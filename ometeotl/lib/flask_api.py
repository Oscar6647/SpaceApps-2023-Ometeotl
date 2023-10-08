from flask import Flask, request, jsonify, send_from_directory, send_file
from flask_cors import CORS
from datetime import datetime, timedelta
import pandas as pd
import geopandas
import HeatMap.heatmap as HM
from io import BytesIO
import requests
import fiona
import matplotlib.pyplot as plt


app = Flask(__name__)
CORS(app)  # Enable CORS for your Flask app

# Load your CSV data into a DataFrame
data = pd.read_csv('Template_Pred.csv')

path = 'atlas_de_riesgo_inundaciones'
inundaciones = geopandas.read_file('atlas_de_riesgo_inundaciones')
precipitaciones = geopandas.read_file('atlas_de_riesgo_precipitacion')
granizo = geopandas.read_file('atlas_de_riesgo_granizo')

print('done')
# data2 = open('atlas_de_riesgo_inundaciones')


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
    

# @app.route('/shapefile/<filename>')
# def serve_shapefile(filename):
#     return send_from_directory('static', filename)

# @app.route('/plot')
# def plot():
#     # Create a Matplotlib plot
#     fig, ax = plt.subplots(figsize=(12, 12))
#     ax.plot([1, 2, 3, 4])

#     # Save the plot to a BytesIO buffer
#     buffer = BytesIO()
#     plt.savefig(buffer, format='png')
#     buffer.seek(0)

#     # Return the plot as a response
#     return send_file(buffer, mimetype='image/png')

@app.route('/getHeatMap', methods=['GET', 'POST'])
def getHeatMap():

    try:
        datax = request.get_json()  # Parse incoming JSON data

        if (datax is not None):
            
            try:
                # file = geopandas.read_file(data2, encoding='utf-8')
                # geopandas.io.file.fiona.drvsupport.supported_drivers['ESRI Shapefile']['Shx'] = 'YES'
                # fileX = geopandas.read_file(data2, encoding='utf-8')
                print('load')
                heatMap = HM.heatmaps(precipitaciones, inundaciones, granizo)
                print('done')
                heatMap.position(19.4284700,-99.1276600,1)
                print('done2')
                # heatMap.plot(2)

                # shapefile_path = '../shapefiles/atlas_de_riesgo_granizo.shp'
                # shapefile = geopandas.read_file(shapefile_path)
                # # Read the shapefile using GeoPandas
                # shapefile = geopandas.read_file(shapefile_path)
                
                # url = "http://127.0.0.1:5000/shapefile/atlas_de_riesgo_precipitacion.shp"
                # # req1 = request.files.get('http://127.0.0.1:5000/shaperfile/atlas_de_riesgo_inundaciones/atlas_de_riesgo_inundaciones')
                # response = requests.get(url)
                # content = response.content
                # # gdf = geopandas.read_file(geopandas.io.file.fiona.BytesCollection(content))

                # file = geopandas.read_file(file)
                # print('doneeee')
                # file = open("http://127.0.0.1:5000/shapefile/atlas_de_riesgo_precipitacion.shp")
                # shapefile = geopandas.read_file("http://127.0.0.1:5000/shapefile/atlas_de_riesgo_precipitacion.shp")
               
                # # file = open('shapefile/test.txt')
                # req2 = request.files.get('http://127.0.0.1:5000/shapefile/atlas_de_riesgo_inundacion.shp')
                # req3 = request.files.get('http://127.0.0.1:5000/shapefile/atlas_de_riesgo_granizo.shp')
                
                # url = 'http://127.0.0.1:5000/shaperfile/atlas_de_riesgo_precipitacion.shp'
                # response = request.files.get(url)

                # if response:
                #     # The file has been successfully downloaded
                #     file_content = response
                    
                #     # You can now process the file content, for example, save it to a local file or open it for reading
                #     with open('local_shapefile.shp', 'wb') as local_file:
                #         local_file.write(file_content)
                # else:
                #     print(f"Failed to download the file. Status code: {response}")
                # t = "aaa"
                
                # if (req1 is not None):
                #     print("SUCCESS")
                #     # df_precipitacion = geopandas.read_file(req1)
                #     # df_inundacion = geopandas.read_file(req2)
                #     # df_granizo = geopandas.read_file(req3)
                #     # heatMap = HM.heatmaps(df_precipitacion, df_inundacion, df_granizo)
                #     # heatMap.position(19.4284700,-99.1276600,0)
                #     # heatMap.plot(2)
                #     # return jsonify(r={'attem':'done'}), 200
                    

                result = {
                'message': 'Prediction successful',
                'prediction': 'a'
                }
                
            except Exception as e:
                print("ERROR LOADING")
                print(e)


            
            
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
    app.run(debug=True, threaded=False)
