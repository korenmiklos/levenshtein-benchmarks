# Benchmarks
Take 100k random lines of text, each 20 characters long. Search for a random 5k character strings by Levenshtein distance. Print the best match for each string.

## Python
make python
cd py && time poetry run python main.py < ../search.txt > /dev/null

real	2m5.901s
user	2m5.189s
sys	0m0.410s

## Julia
make julia
cd julia && time julia --project=. main.jl < ../search.txt > /dev/null

real	4m59.299s
user	4m46.227s
sys	0m0.983s

## Rust
make rust
cd rust && cargo build --release && time ./target/release/rust < ../search.txt > /dev/null
    Finished release [optimized] target(s) in 0.02s

real	3m35.732s
user	3m34.699s
sys	0m0.610s