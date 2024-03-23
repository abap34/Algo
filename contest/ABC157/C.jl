parseInt(x) = parse(Int, x)
parseMap(x::Array{SubString{String},1}) = map(parseInt, x)
function main()
N,M = parseMap(split(readline()))
sc = Dict()
for i in 1:M
    s,c = split(readline())
    s = parse(s)
    if !(s in keys(sc))
        push!(sc,s=>c)
    else
        if sc[s] != c
            return -1
            break
        end
    end
end



i = fill("0",N)
#println(i)
for (keta,num) in sc
    i[keta] = string(num)
end
#println(i)
ans = ""
if i[1] != "0" || i == ["0"]
    for j in i
        ans *= j
    end 
    return parse(Int,ans)
else 
    ans = ""
    i[1] = "1"
    for j in i
        ans *= j
    end 
    return parse(Int,ans)
   
end   
return -1 
end
ans = main()
println(ans)