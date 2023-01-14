parseInt(x) = parse(BigInt, x)
parseMap(x::Array{SubString{String},1}) = map(parseInt, x)



function main(N)
    t = 'a':'z'
    if N <= 26
        return t[N]
    else
        if N % 26 == 0
            return main(N ÷ 26 - 1) * 'z'
        else    
            return main(N ÷ 26 ) * t[N % 26]
        end
    end
end

N = parseInt(readline())
println(main(N))
