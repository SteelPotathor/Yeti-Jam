extends Node


func read(json_file_path):
	# Open a file in read-only mode
	var file = FileAccess.open(json_file_path, FileAccess.READ)
	
	# Read the entire content of the file as text
	var content = file.get_as_text()
	
	# Close the file to free up system resources
	file.close()
	
	# Array to return
	var timing_values = []

	# Create a new JSON object for parsing JSON data
	var json = JSON.new()
	
	# Parse the JSON content read from the file
	var result = json.parse(content)

	# Check if the JSON parsing was successful
	if result == OK:
		# Retrieve the parsed data from the JSON object
		var json_data = json.get_data()
		
		# Convert each timings from s to ms and store the converted values in an array
		for x in json_data['intense_moments']:
			timing_values.append(float(x) * 1000)
			
	else:
		print("Error parsing JSON. Error code: %d" % result)
	
	return timing_values
