parseInt(x) = parse(Int, x)
parseMap(x::Array{SubString{String},1}) = map(parseInt, x)


function main()
S = collect(chomp(readline()))

streak = false
ans = 0
for s in S
    if (!streak) && (s == 'R')
        streak = true
        ans = 0
        ans += 1
    elseif (streak) && (s == 'R')
        ans += 1 
    else
        streak = false
    end
end

println(ans)

end

main()