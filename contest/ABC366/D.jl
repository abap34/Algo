function cumsum3d(A, N)
    S = zeros(Int, N + 1, N + 1, N + 1)

    for x in 1:N
        for y in 1:N
            for z in 1:N
                S[x+1, y+1, z+1] = A[x, y, z] +
                                   S[x, y+1, z+1] + S[x+1, y, z+1] + S[x+1, y+1, z] -
                                   S[x, y, z+1] - S[x, y+1, z] - S[x+1, y, z] +
                                   S[x, y, z]
            end
        end
    end

    return S
end


function main()
    N = parse(Int, readline())
    A = zeros(Int, (N, N, N))
    for i in 1:N
        for j in 1:N
            A[i, j, :] = parse.(Int, split(readline()))
        end
    end

    Q = parse(Int, readline())

    # function query(Lx1, Rx1, Ly1, Ry1, Lz1, Rz1)
    #     result = 0
    #     for i in Lx1:Rx1
    #         for j in Ly1:Ry1
    #             for k in Lz1:Rz1
    #                 result += A[i, j, k]
    #             end
    #         end
    #     end
    #     return result
    # end

    S = cumsum3d(A, N)

    function query(Lx1, Rx1, Ly1, Ry1, Lz1, Rz1)
        return S[Rx1+1, Ry1+1, Rz1+1] - S[Lx1, Ry1+1, Rz1+1] - S[Rx1+1, Ly1, Rz1+1] - S[Rx1+1, Ry1+1, Lz1] +
               S[Lx1, Ly1, Rz1+1] + S[Lx1, Ry1+1, Lz1] + S[Rx1+1, Ly1, Lz1] - S[Lx1, Ly1, Lz1]
    end

    for _ in 1:Q
        Lx1, Rx1, Ly1, Ry1, Lz1, Rz1 = parse.(Int, split(readline()))
        println(query(Lx1, Rx1, Ly1, Ry1, Lz1, Rz1))
    end
end

main()