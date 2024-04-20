using Random

include("C.jl")

for i in 1:100
    N = rand(2:2*10^5)
    A = randperm(N)

    history = solve(N, A)

    for h in history[1:end-1]
        left, right = h

        A[left], A[right] = A[right], A[left]
    end

    @assert sort(A) == collect(1:N)
end


