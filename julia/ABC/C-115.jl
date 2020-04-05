parseInt(x) = parse(Int, x)
parseMap(x::Array{SubString{String},1}) = map(parseInt, x)
N,K = parseMap(split(readline()))
H = []
for i in 1:N 
    h = parseInt(readline())
    push!(H,h)
end
sort!(H)

min_s = 10^10
for i in 1:N-K+1
    s = H[i+K-1] - H[i]
    if s < min_s
        min_s = s
    end
end        
println(min_s)