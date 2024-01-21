using Combinatorics
function reach(C)
    # たて
    drop = (1, 2, 3)
    idx = ((2, 3), (1, 3), (1, 2))
    for i in 1:3
        d = drop[i]
        _idx = idx[i]
        for j in 1:3
            if C[d, j] > 0
                continue
            else
                if C[_idx[1], j] == C[_idx[2], j]
                    return true
                end
            end
        end
    end

    # よこ
    for i in 1:3
        d = drop[i]
        _idx = idx[i]
        for j in 1:3
            if C[j, d] > 0
                continue
            else
                if C[j, _idx[1]] == C[j, _idx[2]]
                    return true
                end
            end
        end
    end

    # 斜め(左上から右下)
    d = [9, 5, 1]
    idx = ((1, 5), (1, 9), (5, 9))
    for i in 1:3
        _idx = idx[i]
        if C[d[i]] > 0
            continue
        end
        if C[_idx[1]] == C[_idx[2]]
            # println("斜め1")
            return true
        end
    end

    # 斜め(右上から左下)
    d = [7, 5, 3]
    idx = ((3, 5), (3, 7), (5, 7))
    for i in 1:3
        _idx = idx[i]
        if C[d[i]] > 0
            continue
        end
        if C[_idx[1]] == C[_idx[2]]
            # println("斜め2")
            return true
        end
    end
    return false
end

function out(mat)
    n, m = size(mat)
    for i in 1:n
        for j in 1:m
            print(mat[i, j], " ")
        end
        println()
    end
end


function main()
    C = zeros(Int, (3, 3))
    C[1, :] = parse.(Int, split(readline()))
    C[2, :] = parse.(Int, split(readline()))
    C[3, :] = parse.(Int, split(readline()))
    count = 0
    for perm in permutations(1:9)
        mat = reshape(collect(0:-1:-8), 3, 3)
        for p in perm
            mat[p] = C[p]
            # out(mat)
            # println()
            if reach(mat)
                # println("=====================")
                count += 1
                break
            end
        end
    end
    println(1 - (count / factorial(9)))
end

main()