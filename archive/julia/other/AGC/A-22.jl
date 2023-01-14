S = chomp(readline())




function main(S)
    if length(S) < 26
        for s in 'a':'z'
            if !(s in S)
                return S + s
            end
        end
    else
        for i in length(S):-1:1 
            for s in 'a':'z'
                if !(s in S)
                    
        end
end



if S == "zyxwvutsrqponmlkjihgfedcba"
    println(-1)
else
    main(S)
end