import geopandas as gpd
from shapely.geometry import Point
from flask import Flask, request, jsonify, send_from_directory
import matplotlib
matplotlib.use('Agg')  # 'Agg' is a non-interactive backend
import matplotlib.pyplot as plt

class heatmaps:
    #The class initializes the dataframes of all three datasets and list of dfs for easy access

    def __init__(self, file_precipitacion, file_inundacion, file_granizo):
        # filename = "atlas_de_riesgo_precipitacion.shp"
        # file = open(filename)
        print('loading data...')

        self.df_precipitacion = file_precipitacion
        self.df_inundacion = file_inundacion
        self.df_granizo = file_granizo
        self.lista_df = [self.df_inundacion, self.df_precipitacion, self.df_granizo]
        self.lista = ["Flooding", "Precipitation", "Hail"]
        self.alcaldias = ["Álvaro Obregón", "Azcapotzalco", "Benito Juárez", "Coyoacán", "Cuajimalpa de Morelos", "Cuauhtémoc", "Gustavo A. Madero", "Iztacalco", "Iztapalapa", "La Magdalena Contreras", "Miguel Hidalgo", "Milpa Alta", "Tláhuac", "Tlalpan", "Venustiano Carranza" , "Xochimilco"]
        self.warnings = ["very low", "low", "moderate", "high", "very high"]

        print('done w data')

    
    def plot(self, num):

        df = self.lista_df[num]


        # Create a larger figure
        try:
            fig, ax = plt.subplots(figsize=(12, 12))
            print('subplot')
        except Exception as e:
            print('error')
            print(e)
            return

        # Plot the df_granizo data
        df.plot(column="int2", legend=True, legend_kwds={"label": "Intensidad de " +   self.lista_df[num]['taxonom'].iloc[0].lower(), "orientation": "horizontal"}, ax=ax)

        # Plot the target point

        #Falta modificar título
        titulo = "Holi"
        ax.axis('off')
        # Set the title
        plt.title(titulo, fontsize=16, fontweight='bold')

        # Show the plot
        plt.show()

    def position(self, long, lat, num):
        df = self.lista_df[num]


        # Create a GeoDataFrame containing the target point
        target_coordinate = Point(long, lat)
        result = df[df.contains(target_coordinate)]

        print('position')
        target_gdf = gpd.GeoDataFrame(geometry=[target_coordinate], crs=df.crs)

        #Checar si es la alcaldia correcta

        # titulo = "El peligro por " + result['taxonom'].iloc[0].lower() + " en la alcaldia " + result['alcaldi'].iloc[0] + " es " + result['intnsdd'].iloc[0].lower()
        titulo = "T______________titulo :)"

        # Create a larger figure

        fig, ax = plt.subplots(figsize=(12, 12))

        # Plot df data
        #Falta agregar un mejor tamaño de subtitulo
        # df.plot(column="int2", legend=True)
        # df.plot(column="int2", legend=True, legend_kwds={"label": "Intensidad de " +  result['taxonom'].iloc[0].lower(), "orientation": "horizontal"}, ax=ax)
        df.plot(column="int2", legend=True, legend_kwds={"label": "Intensidad de " , "orientation": "horizontal"}, ax=ax)

        # Plot the target point
        target_gdf.plot(ax=ax, markersize=100, color='red', marker='*', label='Your Label', zorder=3)
        return

        ax.axis('off')
  
        plt.title(titulo, fontsize=16, fontweight='bold')

        # Show the plot
        plt.show()