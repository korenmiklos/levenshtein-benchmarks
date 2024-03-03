import sys
from Levenshtein import distance

# Read all lines from "index.txt" into a list
with open('../index.txt', 'r') as file:
    index_lines = file.readlines()

# Function to find the line with the lowest Levenshtein distance
def find_closest_line(input_line, lines):
    min_distance = float('inf')
    closest_line = None
    for line in lines:
        # Compute the Levenshtein distance
        current_distance = distance(input_line, line)
        if current_distance < min_distance:
            min_distance = current_distance
            closest_line = line
    return closest_line.strip()  # Remove trailing newline

# Read lines from stdin and compute the Levenshtein distance
for stdin_line in sys.stdin:
    stdin_line = stdin_line.strip()  # Remove trailing newline from stdin line
    closest_line = find_closest_line(stdin_line, index_lines)
    print(closest_line)
