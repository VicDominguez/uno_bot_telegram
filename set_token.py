import json
import sys

"""This script sets botfather token which receives it as first argv parameter (others argv parameters are ignored)"""

if len(sys.argv) > 1:

    token = sys.argv[1]  # Read parameter

    with open('config.json') as file:  # Open json
        data = json.load(file)

    data["token"] = token  # Modify token field

    with open('config.json', 'w') as file:  # save json
        json.dump(data, file)

else:
    print("You missed the token argument. Please rerun this script with that argument.")
    exit(-1)
