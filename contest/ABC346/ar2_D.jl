

function main()
    N = parse(Int, readline())
    S = collect(readline())
    C = parse.(Int, split(readline()))

    # 0101 ... のパターン
    S_z = 0

    for i in 1:N
        if i % 2 == 1
            if S[i] == '1'
                S_z += C[i]
            end
        else
            if S[i] == '0'
                S_z += C[i]
            end
        end
    end

    # 00 にする位置探索.
    # 一番左端
    C_z = C[1] 
    for i in 2:N-2
        if i % 2 == 0
            C_z = min(C_z, C[i + 1] - C[i + 2])
        else
            C_z = min(C_z, C[i] - C[i - 1])
        end
    end

    # 11 にする位置探索
    # 一番左端
    C_z = C[2] - 








    S_o = 0

    # 1010 ...
    for i in 1:N
        if i % 2 == 1
            if S[i] == '0'
                S_o += C[i]
            end
        else
            if S[i] == '1'
                S_o += C[i]
            end
        end
    end

    @show S_z
    @show S_o

    @show C_z
    @show C_o

    println(
        min(
            S_z - C_z,
            S_o - C_o
        )
    )


end

main()