parseInt(x) = parse(Int, x)
parseMap(x::Array{SubString{String},1}) = map(parseInt, x)

N = parseInt(readline())

h = [2, 4, 5, 7, 9]
p = [0, 1, 6, 8]
b = [3]

n = N % 10

if n in h
    println("hon")
elseif n in p
    println("pon")
else
    println("bon")
end


