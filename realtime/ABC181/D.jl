parseInt(x) = parse(Int, x)
parseMap(x::Array{SubString{String},1}) = map(parseInt, x)

function main()
    num_counts = [0, 0, 0, 0, 0, 0, 0, 0, 0]
    S = readline()

    if length(S) == 1
        if parseInt(S) % 8 == 0
            return "Yes"
        else
            return "No"
        end
    elseif length(S) == 2
        if (parseInt(S) % 8 == 0) || (parseInt(reverse(S)) % 8 == 0) 
            return "Yes"
        else
            return "No"
        end
    end


    for s in S
        num_counts[parse(Int, s)] += 1
    end
    num_counts .= (x -> min(3, x)).(num_counts)
    result = []
    for i in 1:9
        for _ in 1:num_counts[i]
            push!(result, i)
        end
    end
    N = length(result)
    for i in 1:N
        for j in 1:N
            for k in 1:N
                ((i == j) || (j == k) || (i == k)) && (continue)
                res = 100 * (result[i]) + 10 * (result[j]) + result[k]
                if res % 8 == 0
                    return "Yes"
                end
            end
        end
    end
    return "No"
end



println(main())