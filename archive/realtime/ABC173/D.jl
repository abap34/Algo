parseInt(x) = parse(Int, x)
parseMap(x::Array{SubString{String},1}) = map(parseInt, x)

function main()
N = parseInt(readline())
A = parseMap(split(readline()))

sort!(A, rev=true)

ans = 0

println(A)
for i in 1:N-1
    ans += A[div(i, 2) + 1]
end

println(ans)

end

main()