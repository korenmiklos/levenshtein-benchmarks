import sys
import random
import string

def generate_random_text(n, length=20, seed=42):
    """Generate n lines of random text, each of fixed length, with a fixed seed."""
    random.seed(seed)  # Fix the seed for reproducibility
    chars = string.ascii_letters + string.digits + string.punctuation  # Combine letters, digits, and punctuation for the text
    for _ in range(n):
        print(''.join(random.choice(chars) for _ in range(length)))

if __name__ == "__main__":
    if len(sys.argv) != 3:
        print("Usage: python generate_random_text.py <number_of_lines:int> <seed:int>")
        sys.exit(1)

    try:
        n = int(sys.argv[1])
    except ValueError:
        print("Please enter a valid integer for the number of lines.")
        sys.exit(1)

    try:
        seed = int(sys.argv[2])
    except ValueError:
        print("Please enter a valid integer for the seed.")
        sys.exit(1)

    generate_random_text(n, seed=seed)
