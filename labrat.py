
import requests
import pickle
url = 'https://api.openweathermap.org/data/2.5/air_pollution?lat=19.44506&lon=-99.14612&appid=e86f4f960c4b6ce057724044b6a5cea8'

response = requests.get(url)

if response.status_code == 200:
    data = response.json()
    #print(data)
    co_rn = data['list'][0]['components']['co']
    no_rn = data['list'][0]['components']['no']
    no2_rn = data['list'][0]['components']['no2']
    o3_rn = data['list'][0]['components']['o3']
    pm2_5_rn = data['list'][0]['components']['pm2_5']
    pm10_rn = data['list'][0]['components']['pm10']
    so2_rn = data['list'][0]['components']['so2']
    with open('SpaceApps\ModeloCont.pk1', 'rb') as model_file:
        loaded_model = pickle.load(model_file)
    result = loaded_model.predict([[co_rn,no_rn,no2_rn,o3_rn,pm10_rn,pm2_5_rn,so2_rn]])
    print(result)

else:
    print(f"Request failes {response.status_code}")