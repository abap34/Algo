# N, K = parse.(Int, split(readline()))
# P = parse.(Int, split(readline()))

N = 5
K = 2
P = [3, 5, 2, 1, 4]

inds = []
for i in 1:N
    push!(inds, sortperm(P[1:i]))
end

