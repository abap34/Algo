parseInt(x) = parse(Int, x)
parseMap(x::Array{SubString{String},1}) = map(parseInt, x)



function main()

capacitys = zeros(Int, 5)
N = parseInt(readline())

for i in 1:5
    capacitys[i] = parseInt(readline())
end

println(cld(N, minimum(capacitys)) + 4)

end


main()