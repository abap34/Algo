parseInt(x) = parse(Int, x)
parseMap(x::Array{SubString{String},1}) = map(parseInt, x)

sm = 'a':'z'
big = 'A':'Z'

a = readline()[1]

if a in sm
    println("a")
else
    println("A")
end