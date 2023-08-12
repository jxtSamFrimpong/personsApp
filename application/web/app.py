import os
from flask import Flask, render_template, request, jsonify
import requests

app = Flask(__name__, static_folder='static')

API_HOST = os.getenv("API_HOST", "localhost")
API_PORT = os.getenv("API_PORT", "5000")
WEB_APP_PORT = os.getenv("WEB_APP_PORT", 3000)


@app.route('/')
def index():
    return render_template('index.html')


@app.route('/add', methods=['POST'])
def add_person():
    name = request.form['name']
    age = request.form['age']
    _id = request.form['_id']
    data = {'id': _id, 'name': name, 'age': age}
    r = requests.post(f"http://{API_HOST}:{API_PORT}/person", json=data)
    return jsonify(r.json())


@app.route('/update', methods=['PUT', 'GET'])
def update_person():
    name = request.args.get('name')
    age = request.args.get('age')
    _id = request.args.get('_id')
    data = {'id': _id, 'name': name, 'age': age}
    r = requests.put(f'http://{API_HOST}:{API_PORT}/person/{_id}', json=data)
    return jsonify(r.json())


@app.route('/fetch', methods=['GET'])
def fetch_person():
    _id = request.args.get("_id")
    r = requests.get(f'http://{API_HOST}:{API_PORT}/person/{_id}')
    return jsonify(r.json())


@app.route('/fetch-everyone', methods=['GET'])
def fetch_everyone():
    r = requests.get(f'http://{API_HOST}:{API_PORT}/persons')
    return jsonify(r.json())


@app.route('/delete', methods=['DELETE', 'GET'])
def delete_person():
    _id = request.args.get('_id')
    r = requests.delete(f'http://{API_HOST}:{API_PORT}/person/{_id}')
    return jsonify(r.json())


if __name__ == '__main__':
    app.run(debug=True, port=WEB_APP_PORT, host='0.0.0.0')
