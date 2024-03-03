.PHONY: duckdb rust julia python
duckdb: search.txt index.txt
	cd duckdb && time duckdb < main.sql > /dev/null
rust: search.txt index.txt
	cd rust && cargo build --release && time ./target/release/rust < ../search.txt > /dev/null
julia: search.txt index.txt
	cd julia && time julia --project=. main.jl < ../search.txt > /dev/null
python: search.txt index.txt
	cd py && time poetry run python main.py < ../search.txt > /dev/null
search.txt:
	python generate_random_text.py 10000 > $@
index.txt:
	python generate_random_text.py 10000 > $@