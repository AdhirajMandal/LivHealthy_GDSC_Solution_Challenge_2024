from flask import Flask, request, jsonify
import firebase_admin
from firebase_admin import credentials, firestore

app = Flask(__name__)

# Initialize Firebase
def initialize_firebase():
    try:
        firebase_admin.get_app()
    except ValueError:
        cred = credentials.Certificate("E:/GDSC PROJECt/Accident Report/Firebase Key/serviceaccountkey.json")  # Replace with your Firebase credentials
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

# Function to perform login
@app.route('/login', methods=['POST'])
def login():
    data = request.get_json()
    email = data.get('email')
    password = data.get('password')

    user_data = retrieve_user_details(email)
    
    if user_data and "password" in user_data and user_data["password"] == password:
        return jsonify({"message": "Login successful!"})
    else:
        return jsonify({"message": "Invalid email or password. Login failed."}), 401

# Initialize Firebase when the server starts
initialize_firebase()

# Catch-all route for handling 404 errors
@app.errorhandler(404)
def not_found(e):
    return jsonify({"message": "Not Found"}), 404

# Route to handle root URL
@app.route('/')
def index():
    return jsonify({"message": "Welcome to the Flask Server!"})

if __name__ == '__main__':
    app.run(debug=True)
