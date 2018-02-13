# -*- coding: utf-8 -*-

from sklearn.linear_model import LinearRegression
import pandas
import coremltools

# cargar el modelo CSV con pandas:
data = pandas.read_csv("cars.csv")

print(data)

model = LinearRegression()

model.fit(data[["model", "premium", "mileage", "condition"]], data["price"])

# Generar el modelo para coreML
coreml_model = coremltools.converters.sklearn.convert(model, ["model",
                                                              "premium",
                                                              "mileage",
                                                              "condition"],
                                                      "price")

# Dar metadatos
coreml_model.author = "ValiantLucatero"
coreml_model.license = "MIT"
coreml_model.description = "Predice el precio de un auto Tesla"

# Esta linea nos genera una clase de Swift para usarla en XCode
coreml_model.save("Cars.mlmodel")
