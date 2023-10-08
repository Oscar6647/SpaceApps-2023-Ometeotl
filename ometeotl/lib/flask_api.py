from flask import Flask, request, jsonify
from flask_cors import CORS
import pickle

app = Flask(__name__)
CORS(app)  # Enable CORS for your Flask app

# Load your machine learning model from the .pkl file
with open('watermodel_pkl', 'rb') as model_file:
    loaded_model = pickle.load(model_file)

@app.route('/', methods=['POST'])
def make_prediction():
    try:
        data = request.get_json()  # Parse incoming JSON data

        # Check if the required fields are present in the JSON data
        if 'features' in data:
            features = data['features']

            # Perform predictions or other operations using the loaded object
            result = loaded_model.predict([features])

            # Format the results
            result = {
                'message': 'Prediction successful',
                'prediction': result.tolist()  # Convert predictions to a list
            }

            return jsonify(result), 200
        else:
            return jsonify({'error': 'Invalid JSON data'}), 400

    except Exception as e:
        return jsonify({'error': str(e)}), 500

if __name__ == '__main__':
    app.run(debug=True)
