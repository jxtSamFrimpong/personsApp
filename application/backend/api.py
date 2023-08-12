import os
from flask import Flask, jsonify, request, Response
from flask_pymongo import PyMongo
from prometheus_flask_exporter import PrometheusMetrics
from prometheus_client import generate_latest
from serial import Serial
import logging

app = Flask(__name__)

MONGODB_USERNAME = os.getenv("MONGODB_USERNAME", "username")
MONGODB_PASSWORD = os.getenv("MONGODB_PASSWORD", "userpass")
MONGODB_DATABASE = os.getenv("MONGODB_DATABASE", "userdb")
MONGODB_HOST = os.getenv("MONGODB_HOST", "localhost")
MONGODB_PORT = os.getenv("MONGODB_PORT", "27017")
api_port = os.getenv("API_PORT", 5000)

app.config["MONGO_URI"] = f"mongodb://{MONGODB_USERNAME}:{MONGODB_PASSWORD}@{MONGODB_HOST}:{MONGODB_PORT}/{MONGODB_DATABASE}"
app.logger.setLevel(logging.INFO)

mongo = PyMongo(app)
metrics = PrometheusMetrics(app)

# by_path_counter = metrics.counter(
#     'by_path_counter', 'Request count by request paths',
#     labels={'path': lambda: request.path}
# )

# GET_ALL_COUNTER = metrics.counter(
#     "get_persons_requests", "Number of GET /persons requests")
# GET_COUNTER = metrics.counter(
#     "get_person_requests", "Number of GET /person requests")
# POST_COUNTER = metrics.counter("post_requests", "Number of POST requests")
# PUT_COUNTER = metrics.counter("put_requests", "Number of PUT requests")
# DELETE_COUNTER = metrics.counter(
#     "delete_requests", "Number of DELETE requests")


@app.route('/person/<id>', methods=['GET'])
def get_person(id):
    # GET_COUNTER.inc()
    try:
        person = mongo.db.persons.find_one({'id': id})
        if person:
            serialize = Serial()
            serialized = serialize.single_person(person)
            return jsonify(serialized)
        else:
            return jsonify({'message': 'Person not found'}), 404

    except Exception as e:
        return jsonify({
            "error": e
        }), 500


@app.route('/persons', methods=['GET'])
def get_persons():
    # persons_metric.labels(persons=id).inc()
    # GET_ALL_COUNTER.inc()
    try:
        persons = mongo.db.persons.find()
        # print(persons)
        serialize = Serial()
        serialized = serialize.all_persons(persons)
        # print(serialized)

        return jsonify(
            {
                "persons":  serialized
            }
        ), 200
    except Exception as e:
        return jsonify({
            "error": e
        }), 500


@app.route('/person', methods=['POST'])
def add_person():
    # POST_COUNTER.inc()
    try:
        person = request.get_json()
        # print(person["id"])

        person_exists = mongo.db.persons.find_one({'id': str(person["id"])})

        if not person_exists:
            mongo.db.persons.insert_one(person)
            return jsonify({'message': 'Person added successfully'}), 201
        else:
            return jsonify({"message": "Person already exists"}), 409

    except Exception as e:
        return jsonify({
            "error": e
        }), 500


@app.route('/person/<id>', methods=['PUT'])
def update_person(id):
    # PUT_COUNTER.inc()
    try:
        person = mongo.db.persons.find_one({'id': id})
        if person:
            update_data = request.get_json()
            mongo.db.persons.update_one({'id': id}, {'$set': update_data})
            return jsonify({'message': 'Person updated successfully'})
        else:
            return jsonify({'message': 'Person not found'}), 404
    except Exception as e:
        return jsonify({
            "error": e
        }), 500


@app.route('/person/<id>', methods=['DELETE'])
def delete_person(id):
    # DELETE_COUNTER.inc()
    try:
        person = mongo.db.persons.find_one({'id': id})
        if person:
            mongo.db.persons.delete_one({'id': id})
            return jsonify({'message': 'Person deleted successfully'})  # 204
        else:
            return jsonify({'message': 'Person not found'}), 404
    except Exception as e:
        return jsonify({
            "error": e
        }), 500


@app.route('/metrics')
def metrics():
    # return metrics.response()
    # return Response(metrics.generate_latest(), mimetype="text/plain")
    # print(metrics.)
    # return generate_latest()
    return generate_latest().decode("utf-8"), 200, {"Content-Type": "text/plain"}


if __name__ == '__main__':
    app.run(debug=False, port=api_port, threaded=True, host='0.0.0.0')
# pip install flask flask_pymongo prometheus_flask_exporter
