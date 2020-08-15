parseInt(x) = parse(Int, x)
parseMap(x::Array{SubString{String},1}) = map(parseInt, x)



function isOk(a, b, c)
    return (a + b > c) && (b + c > a) && (c + a > b) 
end

function main()
N = parseInt(readline())
L = parseMap(split(readline()))
ans = 0
for i in 1:N
    for j in i+1:N
        for k in j+1:N
            if (k == i) || (k == j)
                continue
            else
                if (L[i] != L[k]) && (L[k] != L[j]) && (L[i] != L[j]) && isOk(L[i], L[j], L[k])
                    ans += 1
                end
            end
        end
    end
end
println(ans)
end

main()