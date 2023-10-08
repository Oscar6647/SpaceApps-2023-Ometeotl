from flask import Flask, request, jsonify, send_from_directory
from flask_cors import CORS
from datetime import datetime, timedelta
import pandas as pd
import HeatMap.heatmap as HM
import geopandas

app = Flask(__name__)
CORS(app)  # Enable CORS for your Flask app

# Load your CSV data into a DataFrame
data = pd.read_csv('Template_Pred.csv')

@app.route('/', methods=['POST'])
def make_prediction():
    try:
        data = request.get_json()  # Parse incoming JSON data

        # Check if the required fields are present in the JSON data
        if 'year' in data and 'month' in data and 'day' in data:
            year = data['year']
            month = data['month']
            day = data['day']

            # Calculate the DOY (Day of Year) based on the user-provided month and day
            date = datetime(year, month, day)
            doy = date.timetuple().tm_yday

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
    

@app.route('/shapefile/<filename>')
def serve_shapefile(filename):
    return send_from_directory('static', filename, mimetype='application/x-qgis')

@app.route('/getHeatMap', methods=['POST'])
def getHeatMap():
    # data = request.get_json()
    # print(data)
    # return
    try:
        data = request.get_json()  # Parse incoming JSON data

        if (data):
            result = {
                'message': 'Prediction successful',
                'prediction': "Holi"
            }
            # geopandas.read_file('/HeatMap/atlas_de_riesgo_precipitacion.shp')
            try:
                file = open('shapefile/test.txt')
                req = request.files.get('fileToUpload')
                df_inundacion = geopandas.read_file('http://127.0.0.1:5000/shapefile/test.txt')
                print("SUCCESS")
            except Exception as e:
                print("ERROR LOADING")
                print(e)


            
            # heatMap = HM.heatmaps()
        # # Check if the required fields are present in the JSON data
        # if 'longitud' in data and 'latitud' in data:
        #     v = -99.1276600
        #     c = 19.4284700
        #     heatMap.position(v,c,0)
        #     heatMap.plot(2)
        #     result = {
        #         'message': 'Prediction successful',
        #         'prediction': "Holi"
        #     }

            return jsonify(result), 200
        else:
            return jsonify({'error': 'Invalid JSON data'}), 400

    except Exception as e:
        return jsonify({'error': str(e)}), 500

if __name__ == '__main__':
    app.run(debug=True)
