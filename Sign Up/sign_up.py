import firebase_admin
from firebase_admin import credentials, firestore
import smtplib
import random
import uuid

# Initialize Firebase
def initialize_firebase():
    try:
        firebase_admin.get_app()
    except ValueError:
        cred = credentials.Certificate("E:/GDSC PROJECt/Accident Report/Firebase Key/serviceaccountkey.json")
        firebase_admin.initialize_app(cred, {'databaseURL': 'https://gdsc-412506-default-rtdb.firebaseio.com/'})

# Function to check if the email already exists in Firebase
def is_email_exists(email):
    db = firestore.client()
    users_ref = db.collection("users")
    query = users_ref.where("email", "==", email).limit(1)
    return len(list(query.stream())) > 0

# Function to send OTP to the user's email
def send_otp(email, otp):
    # Replace these variables with your SMTP server details
    smtp_server = "smtp.gmail.com"
    smtp_port = 587
    smtp_username = "ankitjha4135@gmail.com"
    smtp_password = "roiumzjfdngbmiun"

    # Create an SMTP session
    server = smtplib.SMTP(smtp_server, smtp_port)
    server.starttls()

    # Log in to your email account
    server.login(smtp_username, smtp_password)

    # Compose the email
    subject = "OTP Verification"
    body = f"Your OTP for registration is: {otp}"
    message = f"Subject: {subject}\n\n{body}"

    # Send the email
    server.sendmail(smtp_username, email, message)

    # Close the SMTP connection
    server.quit()

# Function to generate a random OTP
def generate_otp():
    return str(random.randint(10000, 99999))

# Function to verify OTP entered by the user
def verify_otp(entered_otp, generated_otp):
    return entered_otp == generated_otp

# Function to store user details in Firebase
def store_user_details(name, email, password):
    if is_email_exists(email):
        print(f"Email {email} already exists. Please enter a different email.")
        return False
    
    # Generate and send OTP to the user
    otp = generate_otp()
    send_otp(email, otp)

    # Get user input for OTP verification
    entered_otp = input("Enter the OTP sent to your email: ")

    # Verify OTP
    if verify_otp(entered_otp, otp):
        # If OTP is verified, store user details in Firebase
        db = firestore.client()
        users_ref = db.collection("users")
        user_data = {
            "name": name,
            "email": email,
            "password": password,  # Note: Consider using Firebase Authentication instead of storing passwords directly.
            "uuid": str(uuid.uuid4()),  # Example of using UUID for a unique identifier.
        }
        users_ref.add(user_data)
        print("User details stored successfully!")
        return True
    else:
        print("OTP verification failed. Registration aborted.")
        return False

# Initialize Firebase
initialize_firebase()

# Get user details from the input
while True:
    name = input("Enter name: ")
    email = input("Enter email: ")
    password = input("Enter password: ")

    # Store user details in Firebase
    if store_user_details(name, email, password):
        break
    else:
        continue
