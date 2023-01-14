parseInt(x) = parse(Int, x)
parseMap(x::Array{SubString{String},1}) = map(parseInt, x)

function main()
S = collect(chomp(readline()))

ans = 0
for len in 0:length(S)
    for i in 1:length(S) - len
        for s in  S[i:i + len]
            if !(s in ['A', 'C', 'G', 'T'])
                @goto end_try_s
            end
        end
        ans = len + 1
    @label end_try_s
    end
end

println(ans)

end


main()