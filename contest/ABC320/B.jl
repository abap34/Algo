function kaibun(arr)
    return arr == reverse(arr)
end


function main()
    S = collect(readline())
    ans = -1
    for st in 1:length(S)-1
        for en in st:length(S)
            if kaibun(S[st:en])
                if (length(S[st:en])) > ans
                    ans = length(S[st:en])
                end
            end
        end
    end



    println(ans)
end

main()