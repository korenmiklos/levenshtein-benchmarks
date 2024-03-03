# Import necessary package
using StringDistances

# Function to find the line with the lowest Levenshtein distance
function find_closest_line(input_line, lines)
    min_distance = Inf
    closest_line = ""
    for line in lines
        # Compute the Levenshtein distance
        current_distance = evaluate(Levenshtein(), input_line, line)
        if current_distance < min_distance
            min_distance = current_distance
            closest_line = line
        end
    end
    return chomp(closest_line) # Remove trailing newline
end

# Read all lines from "index.txt" into an array
index_lines = readlines("../index.txt")

# Read lines from stdin and compute the Levenshtein distance
for stdin_line in eachline(stdin)
    closest_line = find_closest_line(chomp(stdin_line), index_lines)
    println(closest_line)
end
