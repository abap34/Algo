parseInt(x) = parse(Int, x)
parseMap(x::Array{SubString{String},1}) = map(parseInt, x)

function turn(S::Array)
    return reverse(S)
end
function main()
S = collect(chomp(readline()))
Q = parseInt(readline())
#println(S)
for _ in 1:Q
    T = split(chomp(readline()))
    if length(T) == 1
        S = turn(S)
    else
        F,C = T[2],T[3]
        if F == "1"
            prepend!(S,[C[1]])
        else
            append!(S,[C[1]])    
        end
    end
    #println(S)
end

for i in S
    print(i)
end
println("")
end


main()
