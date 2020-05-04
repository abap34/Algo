parseInt(x) = parse(Int, x)
parseMap(x::Array{SubString{String},1}) = map(parseInt, x)


function main()
N,M = parseMap(split(readline()))

H = parseMap(split(readline()))
ok_list = zeros(Int,N)
for i in 1:M
    a,b = parseMap(split(readline()))
    if H[a] == H[b]
        ok_list[a] = 1
        ok_list[b] = 1
    elseif  H[a] > H[b]
        ok_list[b] = 1
    else
        ok_list[a] = 1
    end
end




println(N - sum(ok_list))


end

main()