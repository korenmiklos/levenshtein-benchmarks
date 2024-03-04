library(stringdist)

index <- readLines('../index.txt')
search <- readLines('../search.txt')

m <- stringdistmatrix(search, index, method = 'lv')
for (i in seq_along(search)) {
    print(index[which.min(m[i, ])])
}
