function solve(S, w, b)
    white = 0
    black = 0
    n = length(S)
    for i in 1:10^5
        idx = i % n + 1
        if S[idx] == 'b'
            black += 1
        else
            white += 1
        end

        if (white == w) && (black == b)
            return true
        end
    end

    return false
end


function main()
    w, b = parse.(Int, split(readline()))
    S = "wbwbwwbwbwbw"

    for i in 1:length(S)
        _S = S[i+1:end] * S[1:i]

        if solve(_S, w, b)
            println("Yes")
            return
        end

    end

    println("No")

    
end

main()