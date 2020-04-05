parseInt(x) = parse(Int, x)
parseMap(x::Array{SubString{String},1}) = map(parseInt, x)
N,D = parseMap(split(readline()))
X = []
for _ in 1:N
    x = parseMap(split(readline()))
    push!(X,x)
end   

function isLen_int(y,z,D)
    sum = 0
    for i in 1:D
        s = (y[i] - z[i])^2
        sum += s
    end 
    return ceil(sqrt(sum)) == floor(sqrt(sum))   
end 
ans = 0
for i in 1:N
    for j in i+1:N
        y = X[i]
        z = X[j]
        if isLen_int(y,z,D)
            ans += 1
        end
    end
end
println(ans)            
            