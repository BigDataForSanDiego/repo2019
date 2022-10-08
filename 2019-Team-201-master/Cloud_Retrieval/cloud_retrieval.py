#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Mon Mar 10 05:00:26 2019

@author: tstone
"""
import matplotlib.pyplot as plt

import numpy as np
import pandas as pd

import pvlib
from pvlib.forecast import GFS 

location_path = "streetlight_locations_datasd_ids.csv"
sll = pd.read_csv(location_path)

# GFS model, defaults to 0.5 degree resolution
model_gfs = GFS()

#Create times to retrieve archive data
tz = 'US/Pacific'
end = pd.Timestamp.today(tz=tz) 
start = end - pd.Timedelta(days=7)

for index, row in sll.iterrows():
    #print(index, row.longitude, row.latitude, row.ID)
    latitude = row.latitude
    longitude = row.longitude
    raw_data = model_gfs.get_data(latitude, longitude, start, end)
    data = model_gfs.process_data(raw_data)
    data.to_csv("../Hackathon Datasets/Cloud/cloud_ID_" + str(row.ID) + ".csv")
