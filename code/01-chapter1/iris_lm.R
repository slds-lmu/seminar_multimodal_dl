mod = lm(Sepal.Length ~ ., data = iris)
save(mod_iris, "results/01-chapter1/mod_iris.Rda")
