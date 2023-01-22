N, P, Q, R, S = parse.(Int, split(readline()))
A = parse.(Int, split(readline()))

bef = A[P:Q]
af = A[R:S]

result = [A[1:P-1]..., A[R:S]..., A[Q+1:R-1]..., A[P:Q]..., A[S+1:end]...]

for a in result
    print("$a ")
end

println()