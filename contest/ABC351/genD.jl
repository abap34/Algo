H = 1000
W = 1000
println("$(H) $(W)")

for i in 1:H
    # #, . のランダム W 個
    println(join(rand(["#", "."], W)))
end