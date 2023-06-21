import pandas as pd
import json

# Load the Excel file into a pandas dataframe
df = pd.read_excel('data.xlsx')

# Convert the dataframe to a dictionary
data = df.to_dict(orient='records')

# Write the dictionary to a JSON file
with open('data.json', 'w') as outfile:
    json.dump(data, outfile)
