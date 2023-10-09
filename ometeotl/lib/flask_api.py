


from flask import Flask, request, jsonify
from flask_cors import CORS
from datetime import datetime
import pandas as pd
from revChatGPT.V3 import Chatbot

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

            # Check if the prediction can be converted to a double
            try:
                prediction = float(prediction)
            except ValueError:
                return jsonify({'error': 'Invalid prediction value'}), 400

            # Call the ReverseGPT API to get a recommendation based on the prediction value
            recommendation = get_recommendation(str(prediction))  # Convert to string
            print(recommendation)

            # Format the results
            result = {
                'message': 'Prediction successful',
                'prediction': prediction,
                'recommendation': recommendation
            }

            return jsonify(result), 200
        else:
            return jsonify({'error': 'Invalid JSON data'}), 400

    except Exception as e:
        return jsonify({'error': str(e)}), 500

def get_recommendation(prediction_value):
    # Make an API call to ReverseGPT to get a recommendation based on the prediction value
    api_key = "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"  # Replace with your ReverseGPT API key

    chatbot = Chatbot(api_key)

    system_prompt = "Se te entregara un numero el cual es un valor de prediccion para la precipitacion. Debes otorgar recomendaciones al usuario en base al numero de predicción"
    chatbot.add_to_conversation(system_prompt, "system")

    chatbot.add_to_conversation(prediction_value, "user")
    response = chatbot.ask(system_prompt + " " + prediction_value)
    return response

def find_prediction(year, doy):
    # Find the prediction in your CSV data based on the year and DOY
    try:
        prediction = data.loc[(data['YEAR'] == year) & (data['DOY'] == doy), 'Pred Temp'].values[0]
        return prediction
    except IndexError:
        return 'Prediction not found for the specified year and day'

if __name__ == '__main__':
    app.run(debug=True)