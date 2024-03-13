parseInt(x) = parse(Int, x)
parseMap(x::Array{SubString{String},1}) = map(parseInt, x)


function count_red(C, N)
    count = 0
    for i in 1:N
        if C[i] == 'R'
            count += 1
        end
    end
    return count
end




function main()
    N = parseInt(readline())
    C = collect(chomp(readline()))
    idx = 1
    red_count = count_red(C, N)
    #=for i in 0:N - red_count
        if C[N - i] == 'R'
            if C[i + idx] == 'W'
                C[i + idx] = 'R'
                C[N - i] = 'W'
            else
                C[i + ]
                =#

    ans = red_count
    for i in 1:red_count
        if C[i] == 'R'
            ans -= 1
        end
    end
    println(ans)

end


main()