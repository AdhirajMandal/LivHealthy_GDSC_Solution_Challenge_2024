import firebase_admin
from firebase_admin import credentials, firestore
import uuid
import random
import smtplib
from email.mime.text import MIMEText

# Initialize Firebase
def initialize_firebase():
    try:
        firebase_admin.get_app()
    except ValueError:
        cred = credentials.Certificate("E:/GDSC PROJECt/Accident Report/Firebase Key/serviceaccountkey.json")
        firebase_admin.initialize_app(cred, {'databaseURL': 'https://gdsc-412506-default-rtdb.firebaseio.com/'})

# Function to retrieve user details from Firebase
def retrieve_user_details(email):
    db = firestore.client()
    users_ref = db.collection("users")
    query = users_ref.where("email", "==", email)
    docs = list(query.stream())
    
    if not docs:
        print(f"No user found with email: {email}")
        return None
    
    return docs[0].to_dict()

# Function to send OTP using Google SMTP
def send_otp(email, otp):
    sender_email = "ankitjha4135@gmail.com"  # Replace with your Gmail address
    sender_password = "roiumzjfdngbmiun"  # Replace with your Gmail password

    subject = "OTP Verification"
    body = f"Your OTP is: {otp}"

    message = MIMEText(body)
    message["Subject"] = subject
    message["From"] = sender_email
    message["To"] = email

    with smtplib.SMTP("smtp.gmail.com", 587) as server:
        server.starttls()
        server.login(sender_email, sender_password)
        server.sendmail(sender_email, [email], message.as_string())

    print(f"OTP sent to {email} successfully!")

# Function to perform login and password change
def login_and_change_password(email):
    otp = str(random.randint(1000, 9999))
    send_otp(email, otp)

    user_otp = input("Enter the OTP sent to your email: ")
    if user_otp != otp:
        print("Invalid OTP. Password change failed.")
        return
    
    new_password = input("Enter your new password: ")

    db = firestore.client()
    users_ref = db.collection("users")
    query = users_ref.where("email", "==", email)
    docs = list(query.stream())
    
    if docs:
        user_doc = docs[0]
        user_doc.reference.update({"password": new_password})
        print("Password change successful!")
    else:
        print(f"No user found with email: {email}")

# Initialize Firebase
initialize_firebase()

# Get user's email
email = input("Enter your email: ")

# Check if the email exists
user_data = retrieve_user_details(email)
if user_data:
    login_and_change_password(email)
else:
    print("No user found with the provided email.")
