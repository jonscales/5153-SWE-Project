from fastapi import FastAPI, Header, HTTPException, Depends, Security
from fastapi.security.api_key import APIKeyHeader
from pydantic import BaseModel
from typing import Optional, List
from sqlalchemy import Boolean, Column, Integer, String, create_engine, JSON
from sqlalchemy.orm import declarative_base
from sqlalchemy.orm import sessionmaker
import datetime
API_KEY_NAME = "api-key"
API_KEY ="c276770f2efc0e42e2d4e375dc511d370a6e4d3dcf3c73792a303713785bb639"

api_key_header = APIKeyHeader(name=API_KEY_NAME, auto_error=False)
# MySQL database connection URL
DATABASE_URL = "mysql+pymysql://root:scalesHHHapp@localhost/registration_db"

engine =create_engine(DATABASE_URL)
SessionLocal = sessionmaker(bind=engine)

Base = declarative_base()

app = FastAPI()

def verify_api_key(api_key: str = Header(...)):
    if api_key != API_KEY:
        raise HTTPException(status_code=403, detail="Unauthorized")
    
#SQLAlchemy model
class Rider(Base):
    __tablename__ = "riders"
    id = Column(Integer, primary_key=True, index=True)
    first_name = Column(String(50))
    last_name = Column(String(50))
    email = Column(String(100))
    phone = Column(String(20))
    age = Column(String(10))
    main_event = Column(String(100))
    sub_event=Column(String(50), nullable=True)
    rider_category=Column(String(60), nullable=True)
    sex = Column(String(10), nullable=True)
    city=Column(String(50))
    zipcode=Column(String(10))
    emr_contact_name=Column(String(100))
    emr_cont_phone=Column(String(20))
    parent_name=Column(String(100), nullable=True)
    waiver_signed=Column(String(10))


class User(Base):
    __tablename__ = "users"
    id = Column(Integer, primary_key=True, index=True)
    first_name = Column(String(50))
    last_name = Column(String(50))
    email = Column(String(100), unique=True)
    created_at = Column(String(100))  # You can switch to DateTime if preferred

class Vendor(Base):
    __tablename__ = "vendors"
    id = Column(Integer, primary_key=True, index=True)
    name = Column(String(100))
    booth_location = Column(String(50))
    categories = Column(JSON)
    website = Column(String(255))
    logourl = Column(String(500))

# Create the table(s)
Base.metadata.create_all(bind=engine)

#Pydantic model for API input
class RegistrationRequest(BaseModel):
    first_name: str
    last_name: str
    email: str
    phone: str
    age: str
    main_event: str
    sex: Optional[str] = None
    city: str
    zipcode: str
    emr_contact_name: str
    emr_cont_phone: str
    sub_event: Optional[str] = None
    rider_category: Optional [str] = None
    parent_name: Optional [str] = None
    waiver_signed: str
    


@app.post("/register")
def register_rider(rider: RegistrationRequest, api_key: str = Header(...)):
    verify_api_key(api_key)
    db = SessionLocal()
   
    new_rider = Rider(
        first_name = rider.first_name,
        last_name=rider.last_name,
        email=rider.email,
        phone=rider.phone,
        age=rider.age,
        main_event=rider.main_event,
        sex=rider.sex,
        city=rider.city,
        zipcode=rider.zipcode,
        emr_contact_name=rider.emr_contact_name,
        emr_cont_phone=rider.emr_cont_phone,
        sub_event=rider.sub_event,
        rider_category=rider.rider_category,
        parent_name=rider.parent_name,
        waiver_signed=rider.waiver_signed
        
    )    
    db.add(new_rider)
    db.commit()
    db.refresh(new_rider)
    db.close()
    return{"message": f"{rider.first_name} {rider.last_name} registerd successfully."}

class UserRequest(BaseModel):
    first_name: str
    last_name: str
    email: str

class SepUserRequest(BaseModel):
    first_name: str
    last_name: str
    email: str

class VendorResponse(BaseModel):
    id: int
    name: str
    booth_location: str
    categories: List[str]
    website: str
    logourl: str

    class Config:
        orm_mode = True

@app.post("/add_test_user")
def add_test_user(user: SepUserRequest, api_key: str = Header(...)):
    verify_api_key(api_key)
    db = SessionLocal()
    new_user = User(
        first_name=user.first_name,
        last_name=user.last_name,
        email=user.email,
        created_at=str(datetime.datetime.now())
    )
    db.add(new_user)
    db.commit()
    db.refresh(new_user)
    db.close()
    return {"message": f"{user.first_name} {user.last_name} added via test endpoint."}


# @app.post("/add_user")
# def add_user(user: UserRequest, api_key: str = Header(...)):
#     verify_api_key(api_key)
#     db = SessionLocal()
#     new_user = User(
#         first_name=user.first_name,
#         last_name=user.last_name,
#         email=user.email,
#         created_at=str(datetime.datetime.now())
#     )
#     db.add(new_user)
#     db.commit()
#     db.refresh(new_user)
#     db.close()
#     return {"message": f"{user.first_name} {user.last_name} added as user."}

@app.get("/vendors", response_model=list[VendorResponse])
def add_test_user(api_key: str = Header(...)):
    verify_api_key(api_key)
    
    db = SessionLocal()
    vendors = db.query(Vendor).all()
    db.close()
    return vendors
