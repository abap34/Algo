parseInt(x) = parse(Int, x)
parseMap(x::Array{SubString{String},1}) = map(parseInt, x)

function main()
A,B = parseMap(split(readline()))    
for i in 1:1000000
    if Int(floor(i * 0.08)) == A && Int(floor(i * 0.1)) == B
        return i
        break
    end
end
return -1
end

println(main())