import pandas as pd

airbnb = pd.read_csv('/Users/vladislav/Desktop/Data_analysis/coding_for_economists/python/Airbnb.csv')

# Substitute "t" and "f" by boolean values
airbnb['host_has_profile_pic'] = airbnb['host_has_profile_pic'] == 't'
airbnb['host_identity_verified'] = airbnb['host_identity_verified'] == 't'
airbnb['host_is_superhost'] = airbnb['host_is_superhost'] == 't'

# Make the response rate as a float so it can be used in calculations
airbnb['host_response_rate'] = airbnb['host_response_rate'].str.replace('%', '').astype(float)

# Make dummy for having a TV using loop
for index, row in airbnb.iterrows():
    airbnb.at[index, 'has_TV'] = "TV" in row['amenities']

# Make dummy for having an Internet using list comprehension
airbnb['has_internet'] = ["Internet" in amenities for amenities in airbnb['amenities']]

# Make a dictionary which stores these dummies together using loop
dicts = []

for index, row in airbnb.iterrows():
    dict = {'TV': row['has_TV'], 'Net': row['has_internet']}
    dicts.append(dict)

airbnb['tv&internet'] = dicts

# Change the value in the dictionary stored in the first key
airbnb.loc[0,'tv&internet']['TV'] = True