###################################
#       Program Heading           #
###################################

""" 
HHH Rider Registration API
----------------------------------------------------------------------------------------
This FastAPI application provides endpoints for handling user and rider registration 
for the Hotter'N Hell Hundred (HHH) cycling event through Flutterflow and MySQL database.
It facilitates the following:

1. **User Registration** (`/registerUser`)  
   - Registers a user with first name, last name, and email.  

2. **User Retrieval** (`/get_user/{email}`)  
   - Retrieves user information based on email for pre-filling the registration form.  

3. **Rider Registration** (`/registerRider`)  
   - Registers a rider for a cycling event, linking them to their user profile  
     and the selected event.  

4. **Admin Interface**  
   - Retrieves all riders for administrative purposes (`/riders`).  
   - Updates rider payment status and bib number (`/update_rider/{rider_id}/{event_id}`).  

5. **Vendor Information**  
   - Retrieves all vendors from the vendor table (`/vendors`).  
   - Retrieves the logos of the vendors (`/vendorLogos`).

6. **Login**  
   - Admin login endpoint to authenticate and grant access based on username and password (`/login`).  

7. **SAG Requests**  
   - Retrieves all SAG requests and displays them for admin approval (`/sag`).  

8. **Database**  
   - Uses MySQL for data storage.  
   - Establishes a connection for each request via `get_db_connection()`.  

9. **Dependencies & Libraries**  
   - `FastAPI`: Framework for API development.  
   - `Pydantic`: Data validation.  
   - `mysql.connector`: MySQL database connection.  
   - `Jinja2Templates`: Used for rendering HTML admin pages (if needed).  

Security Considerations:  
- Uses parameterized queries to prevent SQL injection.  
- Assumes that email is unique for user identification.  

Company: Kings of Code  

Authors:  
- Tim Haxton, Software Engineer  
- Jon Scales, Software Engineer  
- Cooper Wolf, Software Engineer  
         
Date:   [2025-04-26]  
"""


#########################################################
#              Library Import Information               #
#########################################################
"""
                ==== FastAPI framework essentials =====
- FastAPI: A modern, fast (high-performance) web framework for building
           APIs with Python 3.7+ based on Starlette and Pydantic. It's
           designed to create RESTful APIs quickly and efficiently with
           automatic validation, data serialization, and documentation
           generation.
           
- HTTPException: This is used to throw custom HTTP errors. It's 
                 typically raised when an error occurs in your API, and
                 you want to return a specific status code and message.
                 
- Request: Represents the incoming HTTP request. It's used to read and
           process incoming data, headers, cookies, or other
           request-related information.
           
- Form: Used to handle data coming from HTML form submissions. It allows
        you to define parameters for extracting form data.

            ==== FastAPI responses for HTML and JSON ====
- HTMLResponse: This is a type of response that allows you to return
                HTML content. It is commonly used when you need to
                render a full web page in response to a request
                (e.g., after processing form data).
                
- JSONResponse: This is used to return JSON data in the response.
                It's ideal for APIs that communicate with clients in a
                machine-readable format (usually for mobile apps,
                web clients, or other APIs).

    ==== Middleware to handle CORS (Cross-Origin Resource Sharing) ====
- CORSMiddleware: This middleware allows you to control which domains
                  can make requests to your API. It helps manage
                  cross-origin resource sharing, which is important when
                  you have a frontend hosted on one domain and a backend
                  (API) on another domain, like when building SPAs
                  (Single Page Applications).

              ==== Jinja2 template rendering for HTML pages =====
- Jinja2Templates: This allows you to use the Jinja2 templating engine
                   to dynamically generate HTML content. It's useful for
                   rendering HTML views with data, such as user input or
                   database records, to generate full web pages that are
                   sent as HTTP responses.

        ==== Argon2 password hashing and exception handling ====
- PasswordHasher: This is a class from the Argon2 library that provides
                  a secure method for hashing passwords. Argon2 is one
                  of the most secure algorithms for password hashing,
                  designed to resist various attacks like brute force,
                  rainbow tables, and others.
                  
- exceptions: This module contains error classes for handling exceptions
              that might occur during the password verification process.
              For example, `VerifyMismatchError` is raised if the
              provided password doesn't match the stored hash.

    ==== Passlib context to manage password hashing algorithms ====
- CryptContext: Part of the Passlib library, it is used to configure and
                manage multiple password hashing schemes
                (like bcrypt, PBKDF2, Argon2, etc.). The context helps
                in switching between different hashing algorithms based
                on security needs or project requirements.

  ==== Pydantic for defining data models and request validation ====
- BaseModel: This is the base class in Pydantic used for creating data
             models. It ensures that the data you receive
             (like user input or API payloads) follows the structure
             you've defined and that types are validated (e.g., ensuring
             that a value is an integer or a string). Pydantic makes it
             easier to enforce data integrity and automatically converts
             data types.

  ==== Typing module for type hints and defining complex types ==== 
- List: From Python's `typing` module, this is used to define a list
        (or array) type. For example, `List[str]` indicates a list of
        strings. It's particularly helpful in functions that accept or
        return lists and enhances code clarity and readability, allowing
        better type-checking with tools like MyPy.

   ==== MySQL connector for interacting with a MySQL database ====
- mysql.connector: This is a MySQL driver that allows you to interact
                   with a MySQL database from your Python code. It
                   provides a way to execute SQL queries, retrieve data,
                   and handle connections to the database. It's widely
                   used in many web applications for handling database
                   operations.

       ==== Logging module to log messages, errors, and events ====
- logging: This is the standard Python library used for generating logs.
           Logging is essential in production environments for tracking
           system events, errors, and debugging issues. The module
           provides a flexible framework for writing logs, setting
           logging levels (info, debug, error), and directing logs to
           various outputs (console, files, etc.).
"""


#########################################################
#                   Library Imports                     #
#########################################################
from fastapi import FastAPI, HTTPException, Request, Form
from fastapi.responses import HTMLResponse, JSONResponse
from fastapi.responses import RedirectResponse
from fastapi.middleware.cors import CORSMiddleware
from fastapi.templating import Jinja2Templates
from argon2 import PasswordHasher, exceptions
from passlib.context import CryptContext
from pydantic import BaseModel
from typing import List
import mysql.connector
import logging
import re


# logger to receive helpful errors from terminal
logger = logging.getLogger('uvicorn.error')
logger.setLevel(logging.DEBUG)

# Initializing FastAPI app
app = FastAPI()

# Middleware to allow methods like Get, Post, Options etc
# to be received with any headers and from where site
# for stricter control, could set the origins to 
# ["https://hhhapptest.flutterflow.app"]
app.add_middleware(CORSMiddleware,allow_origins=["*"],allow_credentials=True,
                   allow_methods=["*"], allow_headers=["*"],)

# Set up the Jinja2 templates for HTML responses
# (riders_list.html, update_rider.html
templates = Jinja2Templates(directory="templates")

# Database connection configuration
DB_CONFIG = {
    "host": "localhost",
    "user": "root",
    "password": "scalesHHHapp",
    "database": "hhh_db",
}

# Function to get the database connection
def get_db_connection():
    return mysql.connector.connect(**DB_CONFIG)

# Initialize argon2 password hasher
# Initialize CryptContext for password hashing and verification
ph = PasswordHasher()
pwd_context = CryptContext(schemes=["bcrypt"], deprecated="auto")


#################################################################
# Creating Pydantic models used to validate the data coming
# from flutterflow.
# The following base models are:

# User - used to insert a user into the database
# Rider - used to insert a rider into the database
# RegisterRider - all detailed required for a rider
#                 to register for an event
# Vendor - used to sent vendor details to flutterflow
# VendorLogo - used to send only the vendors logo to flutterflow
# AdminLoginRequest - used to match incoming admin username
#                     and password with whats stored in database
# SagInfo - used to match incoming sag request information from
#           flutterflow
#################################################################

class User(BaseModel):
    first_name: str
    last_name: str
    email: str

class Rider(BaseModel):
    user_id: str
    gender: str
    age: str
    city: str
    state_country: str
    phone: str
    emg_cont_name: str = None
    emg_cont_phone: str = None
    
class RegisterRider(BaseModel):
    first_name: str
    last_name: str
    email: str
    gender: str
    age: str
    city: str
    state_country: str
    phone: str
    emg_cont_name: str
    emg_cont_phone: str
    event_main: str
    event_sub: str

class Vendor(BaseModel):
    vendor_id: int
    name: str
    category: str
    booth: str
    website: str
    logo: str

class VendorLogo(BaseModel):
    logo: str 
    
class AdminLoginRequest(BaseModel):
    username: str
    password: str
    
class SagInfo(BaseModel):
    first_name: str
    last_name: str
    location: str
    status: str = "pending"


################################################
# Connection from Flutterflow to database.
# User information from the app will be inserted
# into the user table of the HHH database
################################################
@app.post("/registerUser")
async def register_user(user: User):
    
    # receiving user information and storing into variables
    first_name = user.first_name
    last_name = user.last_name
    email = user.email
    
    # Connect to the database
    connection = get_db_connection()
    cursor = connection.cursor()

    # SQL query to insert the user data into the 'user' table
    cursor.execute("""
                   INSERT INTO user (first_name, last_name, email)
                   VALUES (%s, %s, %s)
                   """, (first_name, last_name, email))

    # Commit the changes to the database
    # and closing connection
    connection.commit()
    cursor.close()
    connection.close()

    # Return a success message
    return {"message": "User registered successfully"}


##########################################################
# Endpoint that will retreive user information to fill in
# some fields for the rider registration page
##########################################################
@app.get("/get_user/{email}")
async def get_user(email: str):
    
    # Connecting to the database
    connection = get_db_connection()
    cursor = connection.cursor(dictionary=True)

    # Query the database to retrieve the user by email
    # and fetching the first matching user
    cursor.execute("SELECT * FROM user WHERE email = %s", (email))
    user = cursor.fetchone()

    # Closing connection
    cursor.close()
    connection.close()

    if user:
        return user  # Return the user data if found
    else:
        raise HTTPException(status_code=404, detail="User not found")


###########################################################
# This endpoint is for flutterflow. This is a post call
# from flutter to api then database.
# It's receiving RegisterRider which is the base model
# for the variables received from flutterflow.
# It then checks if all variables are present and accurate. 
# Finds the correct user to tie the rider to and
# Lastly inserts all variables into their proper tables.
###########################################################
@app.post("/registerRider")
async def register_rider(request: RegisterRider):
    connection = get_db_connection()
    cursor = connection.cursor()

    try:
        # Extract fields from the parsed JSON
        first_name = request.first_name
        last_name = request.last_name
        email = request.email
        gender = request.gender
        age = request.age
        city = request.city
        state_country = request.state_country
        phone = request.phone
        emg_cont_name = request.emg_cont_name
        emg_cont_phone = request.emg_cont_phone
        event_main = request.event_main
        
        # Setting sub event to "none" if they are in 10K Adult or Child race
        if request.event_main == "10 K Adult" or request.event_main == "10 K Child":
            event_sub = "none"
        else:
            event_sub = request.event_sub


        # Making sure potential rider is already a user
        cursor.execute("""
                       SELECT user_id FROM user 
                       WHERE first_name = %s AND last_name = %s AND email = %s
                       """, (first_name, last_name, email))
        
        user = cursor.fetchone()
        
        # Error if potential rider is not a user
        if not user:
            raise HTTPException(
                status_code=404, 
                detail="User not found"
            )
            
        # Creating variable to store riders' user_id
        user_id = user[0]

        # Validating the main event and sub event the 
        # Rider wants to register for
        cursor.execute("""
                       SELECT event_id FROM event 
                       WHERE event_main = %s AND event_sub = %s
                       """, (event_main, event_sub))
        
        # Creating variable to store event data into
        event = cursor.fetchone()
        
        # Error if event is incorrect
        if not event:
            raise HTTPException(
                status_code=404, 
                detail="Event not found"
            )
            
        # Creating variable to store the event_id
        event_id = event[0]

        # Creating a row for the new rider in the database
        cursor.execute("""
                       INSERT INTO rider (user_id, gender, age, city,
                       state_coauntry, phone, emg_cont_name, emg_cont_phone)
                       VALUES (%s, %s, %s, %s, %s, %s, %s, %s)
                       """, (user_id, gender, age, city, state_country,
                             phone, emg_cont_name, emg_cont_phone))

        # Creating variable to store the rider_id to 
        # insert information into the rider_event table
        # in the database
        rider_id = cursor.lastrowid

        # Creating a row for the rider_event table
        # This table links the rider to their event
        cursor.execute("""
                       INSERT INTO rider_event (rider_id, event_id, bib_number, has_paid)
                       VALUES (%s, %s, NULL, 0)
                       """, (rider_id, event_id))

        connection.commit()
        return {"message": "Rider registered successfully"}

    # Message if errors
    except mysql.connector.Error as err:
        raise HTTPException(
            status_code=500, 
            detail=f"Database error: {err}"
        )
    finally:
        # Closing database connection
        cursor.close()
        connection.close()


###############################################################
# API endpoint to get all riders and display select information
# To the riders_list.html.
# This endpoint is used and access only by HHH Administration
# and gives the admin the ability to assign riders a bib number
# and check the has_paid box
###############################################################
@app.get("/riders", response_class=HTMLResponse)
async def get_riders(request: Request):
    
    # Connecting to database
    connection = get_db_connection()
    cursor = connection.cursor(dictionary=True)
    
    # SQL command to get all needed information for the admin to view about riders
    # Getting the riders id, concatting the first and last name as one variable
    # getting the rest of the information from rider table and main event name and
    # event fee from the event table in the database.
    # Joining the user to the command to get the user information for each rider
    # making id is different tables to ensure all data is correct across the tables
    cursor.execute("""
                   SELECT 
                         rider.rider_id,
                   CONCAT(user.first_name, ' ', user.last_name) AS rider_name,
                         rider.phone,
                         rider_event.event_id,
                         rider_event.bib_number,
                         rider_event.has_paid,
                         event.event_main,
                         event.event_fee
                   FROM  rider
                   LEFT JOIN user ON rider.user_id = user.user_id
                   LEFT JOIN rider_event ON rider.rider_id = rider_event.rider_id
                   LEFT JOIN event ON rider_event.event_id = event.event_id;
                   """)
    
    
    # Fetching the data from the query and storing it into riders
    riders = cursor.fetchall()
    
    # Closing database connection
    cursor.close()
    connection.close()
    
    # Pushing request and riders to html
    return templates.TemplateResponse("riders_list.html",
                                     {"request": request,
                                      "riders": riders})


###############################################################
# API endpoint to update rider's has_paid and bib_number fields
# and update them into the database.
# This endpoint originally redirected the riders_list.html page
# to an update_rider.html page only to execute the commands and
# offer a button to return the admin to the riders_list.html.
# This has since been tweeked and now executed the commands
# without having to send the admin to a new page.
###############################################################
@app.post("/update_rider/{rider_id}/{event_id}", response_class=HTMLResponse)
async def update_rider(request: Request, rider_id: int, event_id: int,
                       has_paid: str = Form(...), bib_number: int = Form(...)):
    
    # Convert the checkbox input from string to boolean
    has_paid = True if has_paid == "True" else False

    # Connecting to the database
    connection = get_db_connection()
    cursor = connection.cursor()

    # Check if the specific rider_event exists
    cursor.execute("SELECT * FROM rider_event WHERE rider_id = %s AND event_id = %s",
                  (rider_id, event_id))
    
    # Storing information from query to rider_event variable
    rider_event = cursor.fetchone()

    # If no matching rider_event exists, raise a 404 error
    if not rider_event:
        cursor.close()
        connection.close()
        raise HTTPException(status_code=404, detail="Rider event not found")

    # SQL query to update the rider_event with the new has_paid
    # and bib_number values
    cursor.execute("""
                   UPDATE rider_event
                   SET has_paid = %s, bib_number = %s
                   WHERE rider_id = %s AND event_id = %s
                   """, (has_paid, bib_number, rider_id, event_id))

    # Commiting the changes and closing the connection
    connection.commit()
    cursor.close()
    connection.close() 
    
    # Return a JSON to update the rider
    return JSONResponse(content={"message": "Rider updated successfully"})


###############################################################
# API endpoint to GET a rider's event_main, event_sub, bib_number 
# & ride_time fields to display them in flutterflow results page 
# fields.  The ride_time is initially set as a dummy value of 
# 4 h 15 m as this will have to be added to the database after 
# ride completion from another source. 
# The lookup is based on user email joined with rider, rider_event 
# & event tables.
###############################################################

@app.get("/get_rider_event_info")
async def get_rider_event_info(email: str, event_main: str):
    connection = get_db_connection()
    cursor = connection.cursor(dictionary=True)

    try:
        # Get user_id from email
        cursor.execute("SELECT user_id FROM user WHERE email = %s", (email,))
        user = cursor.fetchone()
        if not user:
            raise HTTPException(status_code=404, detail="User not found")
        user_id = user["user_id"]

        # Get rider_id from user_id
        cursor.execute("SELECT rider_id FROM rider WHERE user_id = %s", (user_id,))
        rider = cursor.fetchone()
        if not rider:
            raise HTTPException(status_code=404, detail="Rider not found")
        rider_id = rider["rider_id"]

        # Get event_id and event_sub from event_main
        cursor.execute("SELECT event_id, event_sub FROM event WHERE event_main = %s", (event_main,))
        event = cursor.fetchone()
        if not event:
            raise HTTPException(status_code=404, detail="Event not found")
        event_id = event["event_id"]
        event_sub = event["event_sub"]

        # Get bib_number from rider_event
        cursor.execute("""
            SELECT bib_number 
            FROM rider_event 
            WHERE rider_id = %s AND event_id = %s
        """, (rider_id, event_id))
        rider_event = cursor.fetchone()
        if not rider_event:
            raise HTTPException(status_code=404, detail="Rider is not registered for this event")

        return {
            "event_main": event_main,
            "event_sub": event_sub,
            "bib_number": rider_event["bib_number"],
            "ride_time": "4h 15m"  # Simulated value
        }

    finally:
        cursor.close()
        connection.close()

###############################################################
# API endpoint to GET a rider's bib_number to display them in 
# flutterflow profile page 
###############################################################

@app.get("/get_rider_bibs")
async def get_rider_bibs(email: str):
    connection = get_db_connection()
    cursor = connection.cursor(dictionary=True)

    try:
        # Get user_id from user table
        cursor.execute("SELECT user_id FROM user WHERE email = %s", (email,))
        user = cursor.fetchone()
        if not user:
            raise HTTPException(status_code=404, detail="User not found")
        user_id = user["user_id"]

        # Get rider_id from rider table
        cursor.execute("SELECT rider_id FROM rider WHERE user_id = %s", (user_id,))
        rider = cursor.fetchone()
        if not rider:
            raise HTTPException(status_code=404, detail="Rider not found")
        rider_id = rider["rider_id"]

        # Get all events the rider is registered in with bib numbers
        cursor.execute("""
            SELECT event.event_main, event.event_sub, rider_event.bib_number
            FROM rider_event
            JOIN event ON rider_event.event_id = event.event_id
            WHERE rider_event.rider_id = %s
        """, (rider_id,))
        results = cursor.fetchall()

        return results  # Returns a list of event entries with bib numbers

    finally:
        cursor.close()
        connection.close()


###############################################################
# This endpoint returns the whole contents of the vendor table
# in the database as a json type
##############################################################
@app.get("/vendors", response_model=List[Vendor])
def get_vendors():
    
    # Connecting to database
    connection = get_db_connection()
    cursor = connection.cursor(dictionary=True)
    
    # SQL query to retreive all vendor information
    cursor.execute("SELECT * FROM vendor")
    vendors = cursor.fetchall()
    
    # Closing database connection
    cursor.close()
    connection.close()
    
    # Returning vendor information as json type
    return vendors


########################################################
# This endpoint returns the logo url of the vendor table
# in the database as a json type
########################################################
@app.get("/vendorLogos")
def get_vendor_logos():
    
    # Connecting to database
    connection = get_db_connection()
    cursor = connection.cursor(dictionary=True)
    
    # SQL query to get the logo url form the vendor table
    cursor.execute("select logo from vendor")
    logos = cursor.fetchall()
    
    # Extract just the logos from the result
    logo_urls = [logo['logo'] for logo in logos]

    # Closing database connection
    cursor.close()
    connection.close()
    
    # Return a dictionary with "logos" as the key
    return JSONResponse(content={"logos": logo_urls})


######################################################
# This endpoint receives a username and password which
# are matched with the username and password that is
# stored in the admin table of the database.
# If there is a match, access is granted, if not
# access is denied.
######################################################
@app.post("/login")
async def login_admin(admin: AdminLoginRequest):
    
    # Connecting to database
    connection = get_db_connection()
    cursor = connection.cursor(dictionary=True, buffered=True)

    try:
        # Fetch the admin record
        cursor.execute("SELECT * FROM admin WHERE username = %s",
                       (admin.username,))
        
        admin_record = cursor.fetchone()
        
        # Error if username not found
        if not admin_record:
            raise HTTPException(status_code=401,
                                detail="Invalid username or password")

        # Verify the password using argon2
        try:
            ph.verify(admin_record['password'], admin.password)
        except exceptions.VerifyMismatchError:
            raise HTTPException(status_code=401,
                                detail="Invalid username or password")
        
        # Returning this message if correct
        return {"message": "Login successful!"}

    finally:
        # Closing database connection
        cursor.close()
        connection.close()


##########################################################    
# This endpoint receives sag information form flutterflow
# and inserts it into the database
##########################################################
@app.post("/sag")
async def create_sag_request(request: SagInfo):
    
    # Connection to database
    connection = get_db_connection()
    cursor = connection.cursor()
    
    try:
        # Extract fields from the parsed JSON
        first_name = request.first_name
        last_name = request.last_name
        location = request.location
        status = request.status

        # Parse lat and lng from string using regex
        match = re.search(r"lat:\s*([-\d.]+),\s*lng:\s*([-\d.]+)",
                          location)
        if not match:
            return {"error": "Invalid location format."}
        
        latitude = float(match.group(1))
        longitude = float(match.group(2))

        # Making sure person needing assistance is a user
        cursor.execute("""
                       SELECT user_id FROM user 
                       WHERE first_name = %s AND last_name = %s""",
                       (first_name, last_name))
        
        user = cursor.fetchone()
        
        # Error if potential rider is not a user
        if not user:
            raise HTTPException(status_code=404,
                                detail="User not found")
            
        # Creating variable to store riders' user_id
        user_id = user[0]
            
        cursor.execute("""
                        SELECT * FROM sag WHERE user_id = %s
                        AND status = 'pending'
                        """, (user_id,))
        existing = cursor.fetchone()

        if existing:
            cursor.fetchall()  # Prevents MySQL error on cursor close
            raise HTTPException(status_code=400,
                                detail="A pending SAG request already exists.")   
            
        # Creating a row for the new sag_assistance in the database
        cursor.execute("""
                       INSERT INTO sag (user_id, longitude, latitude,
                       status)
                       VALUES (%s, %s, %s, %s)
                       """, (user_id, longitude, latitude, status))

        connection.commit()
        return {"message": "Sag request sent successfully"}

    # Message if errors
    except mysql.connector.Error as err:
        raise HTTPException(status_code=500,
                            detail=f"Database error: {err}")
    finally:
        # Closing database connection
        cursor.close()
        connection.close()

    
##########################################################    
# This endpoint returns the information form the sag table
# to the sag_requests.html for the admin to view
##########################################################
@app.get("/sagView", response_class=HTMLResponse)
async def get_sag_requests(request: Request):
    
    # Connecting to the database
    connection = get_db_connection()
    cursor = connection.cursor(dictionary=True)

    try:
        # SQL query to retrieve sag id, rider full name
        # and phone number as well as their coordinates
        cursor.execute("""
                       SELECT DISTINCT sag.sag_id, 
                       CONCAT(user.first_name, ' ', user.last_name)
                       AS rider_name,
                              rider.phone,
                              sag.longitude, 
                              sag.latitude,
                              sag.status
                       FROM sag
                       JOIN user ON sag.user_id = user.user_id
                       JOIN rider ON user.user_id = rider.user_id
                       """)
        
        # Creating variable to store infor from query
        sag_data = cursor.fetchall()
    finally:
        # Closing database connection
        cursor.close()
        connection.close()

    # Returning a json to the sag_requests.html
    return templates.TemplateResponse("sag_requests.html",
    {
        "request": request,
        "sag_data": sag_data
    })
    
    
##########################################################    
# This endpoint updates the sag "status" field with either
# pending, active or completed
##########################################################
@app.post("/update-sag-status")
def update_sag_status(sag_id: int = Form(...), status: str = Form(...)):
    
    # Connecting to the database
    connection = get_db_connection()
    cursor = connection.cursor()
    
    # SQL query to update the status of 
    # a sag request based on the sag_id
    cursor.execute( "UPDATE sag SET status = %s WHERE sag_id = %s",
                  (status, sag_id))
    
    # Closing database connection
    connection.commit()
    cursor.close()
    connection.close()
    
    # Reloading the sag url to refresh updates
    return RedirectResponse(url="/sagView", status_code=303)
    
    
######################################
#           End of FastAPi           #
######################################