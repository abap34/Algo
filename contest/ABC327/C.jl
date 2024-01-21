function ok(arr)
    return sort(collect(arr)) == collect(1:9)
end


function main()
    A = zeros(Int, (9, 9))

    for i in 1:9
        a = parse.(Int, split(readline()))
        A[i, :] = a
    end

    for i in 1:9
        if !(ok(A[i, :]))
            return false
        end

        if !(ok(A[:, i]))
            return false
        end
    end

    for i in 1:3
        for j in 1:3
            t = A[(i - 1) * 3 + 1: i * 3, (j - 1) * 3 + 1: j * 3]
            target = vcat(t...)
            if !(ok(target))
                return false
            end
        end
    end

    return true

end


r = main()

if r
    println("Yes")
else
    println("No")
end