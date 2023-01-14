parseInt(x) = parse(Int, x)
parseMap(x::Array{SubString{String},1}) = map(parseInt, x)


function main()
N = parseInt(readline())

ac = 0
wa = 0
tle = 0
re = 0
for _ in 1:N
    s = chomp(readline())
    if s == "AC"
        ac += 1
    elseif s == "WA"
        wa += 1
    elseif s == "RE"
        re += 1
    else
        tle += 1
    end
end


println("AC x $(ac)")
println("WA x $(wa)")
println("TLE x $(tle)")
println("RE x $(re)")
end


main()