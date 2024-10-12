N = 3000
A = rand(Bool, (N, N))

println(N)

for i in 1:N
    for j in 1:N
        print(A[i, j] ? "#" : ".")
    end
    println()
end

