
parseInt(x) = parse(Int, x)
parseMap(x::Array{SubString{String},1}) = map(parseInt, x)
function main()
N = readline()
flag = false
for n in N
    if n == '7'
        flag = true
    end
end

if flag 
    println("Yes")
else
    println("No")
end
end

main()