parseInt(x) = parse(Int, x)
parseMap(x::Array{SubString{String},1}) = map(parseInt, x)

function main()
N = parseInt(readline())
A = parseMap(split(readline()))
sort!(A)
res = 1
if A[1] == 0
    println(0)
else
    for a in A
        if a > (10^18 ÷ res)
            res = -1
            break   
        else
            res *= a
        end
    end
    println(res)    
end

end

main()