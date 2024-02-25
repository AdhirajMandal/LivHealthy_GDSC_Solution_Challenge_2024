# -*- coding: utf-8 -*-
"""
Created on Tue Feb 13 15:14:18 2024

@author: adhir
"""

from flask import Flask, request, jsonify

app = Flask(__name__)

@app.route('/upload_program', methods=['POST'])
def upload_program():
    if 'file' not in request.files:
        return jsonify({'error': 'No file part'})
    
    file = request.files['file']
    if file.filename == '':
        return jsonify({'error': 'No selected file'})
    
    # Save the uploaded file to a directory
    file.save('/path/to/save/program.py')

    return jsonify({'message': 'File uploaded successfully'})

if __name__ == '__main__':
    app.run(debug=True)
