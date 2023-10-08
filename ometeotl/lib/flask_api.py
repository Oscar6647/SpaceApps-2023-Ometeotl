from flask import Flask, request, jsonify
from flask_cors import CORS  # Import CORS from flask_cors

app = Flask(__name__)
CORS(app)  # Enable CORS for your Flask app

@app.route('/', methods=['POST'])
def process_selected_date():
    try:
        data = request.get_json()  # Parse incoming JSON data

        # Check if the required fields are present in the JSON data
        if 'year' in data and 'month' in data and 'day' in data:
            year = data['year']
            month = data['month']
            day = data['day']

            # Perform your processing with the selected date data here
            # For example, you can use the data to make predictions

            # Replace this with your processing logic
            result = {
                'message': 'Date processed successfully',
                'year': year,
                'month': month,
                'day': day
            }

            return jsonify(result), 200
        else:
            return jsonify({'error': 'Invalid JSON data'}), 400

    except Exception as e:
        return jsonify({'error': str(e)}), 500
    
@app.route('/weather', methods=['GET'])
def postWeatherData():
    data = {
            "temperature": 25,
            "wet_bulb_temp": 30,
            "humidity": 50,
        }

    return jsonify(data), 200
  

if __name__ == '__main__':
    app.run(debug=True)
