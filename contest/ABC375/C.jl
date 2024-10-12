DEBUG = false

function debug(args...)
    if DEBUG
        println(args...)
    end
end

function naive(A, N, i)
    result = copy(A)
    for x in i:N+1-i
        for y in i:N+1-i
            result[y, N+1-x] = A[x, y]
        end
    end
    return result   
end


function main()
    N = parse(Int, readline())
    A = zeros(Bool, (N, N))
    for i in 1:N
        a = collect(readline())
        for j in 1:N
            A[i, j] = a[j] == '#'
        end
    end

    function show_A(A)
        if DEBUG
            for i in 1:N
                for j in 1:N
                    print(A[i, j] ? "# " : ". ")
                end
                println()
            end
        end
    end

    function answer(A)
        for i in 1:N
            for j in 1:N
                print(A[i, j] ? "#" : ".")
            end
            println()
        end
    end

    result = zeros(Bool, (N, N))

    # TOP = (1, :)
    # BOTTOM = (N, :)
    # LEFT = (:, 1)
    # RIGHT = (:, N)

    # result[TOP...] = A[LEFT...]
    # result[RIGHT...] = A[TOP...]
    # result[BOTTOM...] = A[RIGHT...]
    # result[LEFT...] = A[BOTTOM...]


    for i in 1:N÷2
        _top = (i, i:N - i + 1)
        _bottom = (N - i + 1, i:N - i + 1)
        _left = (i:N - i + 1, i)
        _right = (i:N - i + 1, N - i + 1)

        if i % 4 == 1
            result[_top...] = A[_left...]
            result[_right...] = A[_top...]
            result[_bottom...] = A[_right...]
            result[_left...] = A[_bottom...]
        elseif i % 4 == 2
            result[_top...] = A[_right...]
            result[_right...] = A[_bottom...]
            result[_bottom...] = A[_left...]
            result[_left...] = A[_top...]
        elseif i % 4 == 3
            result[_top...] = A[_bottom...]
            result[_right...] = A[_left...]
            result[_bottom...] = A[_top...]
            result[_left...] = A[_right...]
        elseif i % 4 == 0
            result[_top...] = A[_left...]
            result[_right...] = A[_top...]
            result[_bottom...] = A[_right...]
            result[_left...] = A[_bottom...]
        end

        

    end
    
    answer(result)
        


end

main()