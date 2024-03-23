parseInt(x) = parse(Int, x)
parseMap(x::Array{SubString{String},1}) = map(parseInt, x)

function main()
    N = parseInt(readline())
    ans = 0
    for i in 1:N
        h = (N - 1) ÷ i
        ans += h
    end
    println(ans) 
end


main()