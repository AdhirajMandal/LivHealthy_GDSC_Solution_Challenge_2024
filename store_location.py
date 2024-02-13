import firebase_admin
from firebase_admin import credentials, firestore
import uuid

# Initialize Firebase
def initialize_firebase(app_name):
    try:
        app = firebase_admin.get_app(app_name)
    except ValueError:
        cred = credentials.Certificate("E:/GDSC PROJECt/Accident Report/Firebase Key/serviceaccountkey.json")  # Replace with your Firebase credentials
        app = firebase_admin.initialize_app(cred,{'databaseURL':'https://gdsc-412506-default-rtdb.firebaseio.com/'},name=app_name)
    return firestore.client(app)

# Function to store accident details in Firebase
def store_accident_details(db, latitude, longitude, details):
    accidents_ref = db.collection("accidents")
    accident_data = {
        "latitude": latitude,
        "longitude": longitude,
    }
    accidents_ref.add(accident_data)
    print("Accident details stored successfully!")

# Generate a unique app name using uuid
app_name = str(uuid.uuid4())

# Initialize Firebase with a unique app name
db = initialize_firebase(app_name)

# Get accident details from the user
latitude = float(input("Enter latitude: "))
longitude = float(input("Enter longitude: "))
details = input("Enter details of the accident: ")

# Store accident details in Firebase
store_accident_details(db, latitude, longitude, details)
