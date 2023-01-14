N, Q = parse.(Int, split(readline()))

Ls = []

for i in 1:N
    L = parse.(Int, split(readline()))[2:end]
    push!(Ls, L)
end


for i in 1:Q
    s, t = parse.(Int, split(readline()))
    println(Ls[s][t])
end

