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

# Function to retrieve accident details from Firebase
def retrieve_accident_details():
    db = firestore.client()
    accidents_ref = db.collection("accidents")
    docs = accidents_ref.stream()
    print("Retrieving accident details:")
    for doc in docs:
        accident_data = doc.to_dict()
        print(f"Latitude: {accident_data['latitude']}, Longitude: {accident_data['longitude']}")
    return docs

# Initialize Firebase
initialize_firebase()

# Retrieve accident details from Firebase
docs = retrieve_accident_details()
