parseInt(x) = parse(Int, x)
parseMap(x::Array{SubString{String},1}) = map(parseInt, x)
L = parseInt(readline())
ans = string((L/3)^3)
for i in 1:length(ans)
    if ans[i] == 'e'
        moto = float(ans[1:i-1])
        zyou = 10 ^ Int(ans[i+1])
        ans = float(moto * zyou)
    break
    end
end

println(ans)