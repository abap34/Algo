#=
B:
- Julia version:0.5.2
- Author: abap
- Date: 2020-01-12
=#
parseInt(x) = parse(Int, x)
parseMap(x::Array{SubString{String},1}) = map(parseInt, x)
a,b = parse.(split(readline()))

if a<b
    for i in 1:b
    print(a)
    end
else
    for i in 1:a
    print(b)
    end
end

println("")