const N = 4
for i in 0:2^N - 1
    pettern = digits(i, base=2, pad=N)
    println(pettern)
end