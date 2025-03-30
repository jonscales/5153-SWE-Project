from fastapi import FastAPI, Header, HTTPException, Depends, Security
from fastapi.security.api_key import APIKeyHeader
from pydantic import BaseModel
from sqlalchemy import Column, Integer, String, create_engine
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
class Registration(Base):
    __tablename__ = "registrations"
    id = Column(Integer, primary_key=True, index=True)
    first_name = Column(String(50))
    last_name = Column(String(50))
    email = Column(String(100))
    phone = Column(String(20))
    age = Column(Integer)
    event = Column(String(100))

class User(Base):
    __tablename__ = "users"
    id = Column(Integer, primary_key=True, index=True)
    first_name = Column(String(50))
    last_name = Column(String(50))
    email = Column(String(100), unique=True)
    created_at = Column(String(100))  # You can switch to DateTime if preferred

# Create the table(s)
Base.metadata.create_all(bind=engine)

#Pydantic model for API input
class RegistrationRequest(BaseModel):
    first_name: str
    last_name: str
    email: str
    phone: str
    age: int
    event: str

@app.post("/register")
def register_user(reg: RegistrationRequest, api_key: str = Header(...)):
    verify_api_key(api_key)
    db = SessionLocal()
    new_reg = Registration(
        first_name = reg.first_name,
        last_name=reg.last_name,
        email=reg.email,
        phone=reg.phone,
        age=reg.age,
        event=reg.event
    )    
    db.add(new_reg)
    db.commit()
    db.refresh(new_reg)
    db.close()
    return{"message": f"{reg.first_name} {reg.last_name} registerd successfully."}

class UserRequest(BaseModel):
    first_name: str
    last_name: str
    email: str

class SepUserRequest(BaseModel):
    first_name: str
    last_name: str
    email: str

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


@app.post("/add_user")
def add_user(user: UserRequest, api_key: str = Header(...)):
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
    return {"message": f"{user.first_name} {user.last_name} added as user."}
