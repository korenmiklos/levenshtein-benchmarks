use levenshtein::levenshtein;
use std::fs::File;
use std::io::{self, BufRead, BufReader};

fn main() -> io::Result<()> {
    // Read all lines from "index.txt" into a vector
    let file = File::open("../index.txt")?;
    let reader = BufReader::new(file);
    let index_lines: Vec<String> = reader.lines().collect::<Result<_, _>>()?;

    // Buffer for stdin to optimize performance
    let stdin = io::stdin();
    let handle = stdin.lock();

    // Read lines from stdin and compute the Levenshtein distance
    for line in handle.lines() {
        let input_line = line?;
        let (closest_line, _) = index_lines.iter()
            .map(|l| (l, levenshtein(&input_line, l)))
            .min_by_key(|&(_, dist)| dist)
            .unwrap(); // Safe to unwrap because index_lines will always have at least one line

        println!("{}", closest_line);
    }

    Ok(())
}
