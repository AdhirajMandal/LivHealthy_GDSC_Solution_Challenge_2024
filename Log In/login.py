import firebase_admin
from firebase_admin import credentials, firestore
import uuid

# Initialize Firebase
def initialize_firebase():
    try:
        firebase_admin.get_app()
    except ValueError:
        cred = credentials.Certificate("E:/GDSC PROJECt/Accident Report/Firebase Key/serviceaccountkey.json")  # Replace with your Firebase credentials
        firebase_admin.initialize_app(cred, {'databaseURL': 'https://gdsc-412506-default-rtdb.firebaseio.com/'})

# Function to retrieve user details from Firebase
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

# Function to perform login
# Function to perform login
def login(email, password):
    user_data = retrieve_user_details(email)
    
    if user_data and "password" in user_data and user_data["password"] == password:
        print("Login successful!")
    else:
        print("Invalid email or password. Login failed.")


# Initialize Firebase
initialize_firebase()

# Get login credentials from the user
email = input("Enter your email: ")
password = input("Enter your password: ")

# Perform login
login(email, password)
