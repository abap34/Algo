DEBUG = true

debug(args...) = DEBUG && println(args...)
line() = DEBUG && println("------")

function naive(N, A)
    S = 0
    for i in 1:N
        _s = 0
        for j in i+1:N
            _s += max(A[j] - A[i], 0)
        end

        S += _s
        debug("$(A[i])を基準にした場合の総和: ", _s)
    end



    return S
end


function main()
    N = parse(Int, readline())
    A = parse.(Int, split(readline()))

    debug("ナイーブ解: ", naive(N, A))
    line()

    sort!(A)

    # 2番目以降をソートする
    tail_sorted = sort(A[2:end])

    # 2番目で、先頭要素がどこに入るか調べる
    idx = searchsortedfirst(tail_sorted, A[1])

    S = 0

    c = cumsum(tail_sorted)

    function sum_range(i, j)
        if i == 1
            return c[j]
        else
            return c[j] - c[i - 1]
        end
    end


    S += sum_range(idx, N - 1) - (N - idx) * A[1]

    
    println(S)
    

    for i in 1:N-1
        # i + 1番目以降をソートする
        tail_sorted = sort(A[i+1:end])

        # i + 1番目で、i番目の要素がどこに入るか調べる
        idx = searchsortedfirst(tail_sorted, A[i])

        S = 0

        c = cumsum(tail_sorted)

        function sum_range(i, j)
            if i == 1
                return c[j]
            else
                return c[j] - c[i - 1]
            end
        end


        _S = sum_range(idx, N - i) - (N - i - idx) * A[i]
        debug("$(A[i])を基準にした場合の総和: ", _S)


        S += _S

        println(S)
    end




end

main()
