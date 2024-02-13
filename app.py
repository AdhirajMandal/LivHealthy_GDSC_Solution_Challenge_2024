# app.py

from flask import Flask, render_template, request, jsonify
from flask_sqlalchemy import SQLAlchemy

app = Flask(__name__)
app.config['SQLALCHEMY_DATABASE_URI'] = 'sqlite:///reports.db'
db = SQLAlchemy(app)

class IncidentReport(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    latitude = db.Column(db.Float, nullable=False)
    longitude = db.Column(db.Float, nullable=False)
    description = db.Column(db.Text)

# Define a function to create the tables and add it to the app context
def create_tables():
    with app.app_context():
        db.create_all()

# Call the create_tables function
create_tables()

@app.route('/')
def index():
    return render_template('index.html')

@app.route('/report', methods=['POST'])
def report():
    data = request.get_json()

    latitude = data.get('latitude')
    longitude = data.get('longitude')
    description = data.get('description')

    new_report = IncidentReport(latitude=latitude, longitude=longitude, description=description)
    db.session.add(new_report)
    db.session.commit()

    return jsonify({'message': 'Report submitted successfully'})

@app.route('/map')
def map():
    # Convert IncidentReport objects to a JSON-serializable format
    reports = db.session.query(IncidentReport.latitude, IncidentReport.longitude, IncidentReport.description).all()
    
    # Convert Row objects to dictionaries
    reports = [{'latitude': row.latitude, 'longitude': row.longitude, 'description': row.description} for row in reports]

    return render_template('map.html', reports=reports)

if __name__ == '__main__':
    app.run(debug=True)
