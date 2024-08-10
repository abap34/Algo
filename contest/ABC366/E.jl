DEBUG = false

const M = DEBUG ? 2 : 2 * 10^6 + 10

function debug(args...)
    if DEBUG
        println(args...)
    end
end


function solve_naive(N, D, X, Y; x_min=-30, x_max=30, y_min=-30, y_max=30)
    ok = fill(false, x_max - x_min + 1, y_max - y_min + 1)
    for x in x_min:x_max
        for y in y_min:y_max
            S = 0
            for i in 1:N
                S += abs(X[i] - x) + abs(Y[i] - y)
            end
            if S <= D
                ok[x-x_min+1, y-y_min+1] = true
            end
        end
    end

    return transpose(ok)
end

function disply_result(result)
    N, K = size(result)
    _D = Dict(
        0 => ".",
        1 => "#",
        2 => "🟧"
    )
    for i in 1:N
        for j in 1:K
            print(_D[result[i, j]])
        end
        println()
    end
end

function main()
    N, D = parse.(Int, split(readline()))
    X = Int[]
    Y = Int[]
    for _ in 1:N
        x, y = parse.(Int, split(readline()))
        push!(X, x)
        push!(Y, y)
    end


    X_sorted = sort(X)
    C_x = cumsum(X_sorted)

    Y_sorted = sort(Y)
    C_y = cumsum(Y_sorted)

    function naive_D_x(x)
        S = 0
        for i in 1:N
            S += abs(X[i] - x)
        end
        return S
    end

    function naive_D_y(y)
        S = 0
        for i in 1:N
            S += abs(Y[i] - y)
        end
        return S
    end

    function D_x(x)::Int
        i = searchsortedfirst(X_sorted, x)
        j = searchsortedlast(X_sorted, x)
        
        if i == 1
            return C_x[N] - N * x
        elseif j == N
            return N * x - C_x[N]
        else
            return (i - 1) * x - C_x[i-1] + (C_x[N] - C_x[j]) - (N - j) * x
        end
    end
    

    function D_y(y)::Int
        i = searchsortedfirst(Y_sorted, y)
        j = searchsortedlast(Y_sorted, y)
        
        if i == 1
            return C_y[N] - N * y
        elseif j == N
            return N * y - C_y[N]
        else
            return (i - 1) * y - C_y[i-1] + (C_y[N] - C_y[j]) - (N - j) * y
        end
    end

    X_cache = [D_x(x) for x in -M:M]
    if DEBUG
        X_cache_naive = [naive_D_x(x) for x in -M:M]
        if X_cache != X_cache_naive
            println("error!")
            println(X_cache)
            println(X_cache_naive)
            return
        end
    end


    # xの極値を求める


    # ↓ 何個も平坦なところあったら左端になる
    p = 2
    for i in 2:2M-1
        if X_cache[i-1] >= X_cache[i] && X_cache[i] <= X_cache[i+1]
            p = i
            break
        end
    end


    is_increasing = false
    is_decreasing = false

    if X_cache[1] <= X_cache[2]
        is_increasing = true
    end

    if X_cache[end-1] >= X_cache[end]
        is_decreasing = true
    end

    if is_increasing
        p = 0
    elseif is_decreasing
        p = 2M+1
    end

    debug("p: ", p)

    # 単調減少. (マイナスにして単調増加にする)
    X_cache_left = X_cache[1:p]
    X_cache_left = -X_cache_left
    # 単調増加
    X_cache_right = X_cache[p+1:end]

    @assert length(X_cache_left) + length(X_cache_right) == 2M + 1

    N_left = length(X_cache_left)
    N_right = length(X_cache_right)

    debug("X_cache_left: ", X_cache_left)
    debug("X_cache_right: ", X_cache_right)


    # X_cache_left で x 以上の要素が何個あるかを求める
    function x_count_left(x)
        return N_left - searchsortedfirst(X_cache_left, -x) + 1
    end

    # X_cache_right で x 以下の要素が何個あるかを求める
    function x_count_right(x)
        return searchsortedlast(X_cache_right, x)
    end

    function count_naive(t)
        s = 0
        for x in X_cache_naive
            if x <= t
                s += 1
            end
        end
        return s
    end
    S = 0

    for y in -M:M

        _D_y = D_y(y)

        debug("y: ", y, " D_y: ", _D_y)

        rem = D - _D_y

        debug("残りは: ", rem)

        if rem < 0
            continue
        end

        debug("rem以下の X_left の個数: ", x_count_left(rem))
        debug("rem以上の X_right の個数: ", x_count_right(rem))



        # X_cache_left をみて、何番目から rem以下かを求める
        # X_cache_right をみて、何番目から rem以上かを求める
        if DEBUG
            _c = x_count_left(rem) + x_count_right(rem)
            _c_naive = count_naive(rem)

            if _c != _c_naive
                println("error!")
                println(_c)
                println(_c_naive)
                return
            end
        end

        S += x_count_left(rem) + x_count_right(rem)

        debug("===========================")
    end

    println(S)
end

main()