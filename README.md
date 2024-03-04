# Benchmarks
Take 10k random lines of text, each 20 characters long. Search for a random 10k character strings by Levenshtein distance. Print the best match for each string.

### make python
```bash
python generate_random_text.py 10000 42 > search.txt
python generate_random_text.py 10000 24 > index.txt
cd py && time poetry run python main.py < ../search.txt > /dev/null

real	0m25.185s
user	0m24.961s
sys	0m0.155s
```

### make julia
```bash
cd julia && time julia --project=. main.jl < ../search.txt > /dev/null

real	0m57.660s
user	0m57.373s
sys	0m0.183s
```

### make rust
```bash
cd rust && cargo build --release && time ./target/release/rust < ../search.txt > /dev/null
    Finished release [optimized] target(s) in 0.02s

real	0m43.100s
user	0m42.734s
sys	0m0.158s
```

### make duckdb
```bash
cd duckdb && time duckdb < main.sql > /dev/null

real	3m37.596s
user	7m21.367s
sys	0m12.357s
```

### make R
```bash
cd R && time Rscript --vanilla main.R > /dev/null

```
