function split_n(s::String, n::Int)
    res = []
    for i in 1:n:length(s)
        push!(res, s[i:min(i+n-1, end)])
    end
    return res
end

function main()
    S, T = readline() |> split .|> String
    for i in 1:length(S)-1
        splited = split_n(S, i)
        for c in 1:i
            res = ""
            for j in eachindex(splited)
                if c > length(splited[j])
                    break
                end
                res *= splited[j][c]
            end
            if res == T
                println("Yes")
                return
            end
        end
    end
    println("No")
end

main()