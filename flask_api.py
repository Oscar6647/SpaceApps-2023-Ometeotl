from flask import Flask, request, jsonify
from flask_cors import CORS
from datetime import datetime, timedelta
import pandas as pd

app = Flask(__name__)
CORS(app)  # Enable CORS for your Flask app

# Load your CSV data into a DataFrame
data = pd.read_csv('Precip_Hist_Pred.csv')

@app.route('/', methods=['POST'])
def make_prediction():
    try:
        data = request.get_json()  # Parse incoming JSON data
        print(data)

        # Check if the required fields are present in the JSON data
        if 'year' in data and 'month' in data and 'day' in data:
            year = data['year']
            month = data['month']
            day = data['day']

            # Calculate the DOY (Day of Year) based on the user-provided month and day
            date = datetime(year, month, day)
            doy = date.timetuple().tm_yday
            print(doy)

            # Find the prediction for the specified year and DOY
            prediction = find_prediction(year, doy)

            # Format the results
            result = {
                'message': 'Prediction successful',
                'prediction': prediction
            }

            return jsonify(result), 200
        else:
            return jsonify({'error': 'Invalid JSON data'}), 400

    except Exception as e:
        return jsonify({'error': str(e)}), 500

def find_prediction(year, doy):
    # Find the prediction in your CSV data based on the year and DOY
    try:
        prediction = data.loc[(data['YEAR'] == year) & (data['DOY'] == doy), 'Pred Temp'].values[0]
        return prediction
    except IndexError:
        return 'Prediction not found for the specified year and day'

if __name__ == '__main__':
    app.run(debug=True)