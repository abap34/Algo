# matrix を use のタイルを使って 埋められるか？
memo = Dict{Tuple{Int,Int,Vector{Bool}},Bool}()
DEBUG = false

function main()
    N, H, W = parse.(Int, split(readline()))

    A = Int[]
    B = Int[]

    for _ in 1:N
        a, b = parse.(Int, split(readline()))
        push!(A, a)
        push!(B, b)
    end

    function dfs(n, m, use, d=0)::Tuple{Bool, Vector{Vector{Bool}}}
        function debug(args...)
            if DEBUG
                println("   "^d, args...)
            end
        end

        if (n == 0) || (m == 0)
            debug("Satisfy!")
            return true, [use]
        end

        if haskey(memo, (n, m, use))
            return memo[(n, m, use)], [use]
        end

        ok_uses = Vector{Vector{Bool}}()

        for i in eachindex(use)    
            if use[i]
                debug("Try to use $i")
                a, b = A[i], B[i]
                if (a > n) || (b > m)
                    debug("n > a or m > b")
                    continue
                end

                # できる二つの長方形領域
                cand1 = ((n - a, b), (n, m - b))
                cand2 = ((n - a, m), (a, m - b))

                debug(
                    "分割の仕方1: $(cand1[1][1]) x $(cand1[1][2]), $(cand1[2][1]) x $(cand1[2][2]) \n",
                    "   "^d,
                    "分割の仕方2: $(cand2[1][1]) x $(cand2[1][2]), $(cand2[2][1]) x $(cand2[2][2])"
                )


                use_memo = copy(use)


                use[i] = false

                debug("Search under $(use)")

                result1, ok_uses = dfs(cand1[1][1], cand1[1][2], use, d + 1)
                for _use in ok_uses
                    result2, _ = dfs(cand1[2][1], cand1[2][2], _use, d + 1)
                    if result1 && result2
                        debug("$n x $m は $(use_memo) で埋められて, 残ったのは $(_use)")
                        memo[(n, m, use_memo)] = true
                        push!(ok_uses, _use)
                    end
                end

                use = copy(use_memo)

                use[i] = false

                result1, ok_uses = dfs(cand2[1][1], cand2[1][2], use, d + 1)
                for _use in ok_uses
                    result2, _ = dfs(cand2[2][1], cand2[2][2], _use, d + 1)
                    if result1 && result2
                        debug("$n x $m は $(use_memo) で埋められて, 残ったのは $(_use)")
                        memo[(n, m, use_memo)] = true
                        push!(ok_uses, _use)
                    end
                end

                debug("======================================")


                debug("Try to use $i")
                b, a = A[i], B[i]
                if (a > n) || (b > m)
                    debug("n > a or m > b")
                    continue
                end

                # できる二つの長方形領域
                cand1 = ((n - a, b), (n, m - b))
                cand2 = ((n - a, m), (a, m - b))

                debug(
                    "分割の仕方1: $(cand1[1][1]) x $(cand1[1][2]), $(cand1[2][1]) x $(cand1[2][2]) \n",
                    "   "^d,
                    "分割の仕方2: $(cand2[1][1]) x $(cand2[1][2]), $(cand2[2][1]) x $(cand2[2][2])"
                )


                use_memo = copy(use)


                use[i] = false

                result1, ok_uses = dfs(cand1[1][1], cand1[1][2], use, d + 1)
                for _use in ok_uses
                    result2, _ = dfs(cand1[2][1], cand1[2][2], _use, d + 1)
                    if result1 && result2
                        debug("$n x $m は $(use_memo) で埋められて, 残ったのは $(_use)")
                        memo[(n, m, use_memo)] = true
                        push!(ok_uses, _use)
                    end
                end

                use = copy(use_memo)

                use[i] = false

                result1, ok_uses = dfs(cand2[1][1], cand2[1][2], use, d + 1)
                for _use in ok_uses
                    result2, _ = dfs(cand2[2][1], cand2[2][2], _use, d + 1)
                    if result1 && result2
                        debug("$n x $m は $(use_memo) で埋められて, 残ったのは $(_use)")
                        memo[(n, m, use_memo)] = true
                        push!(ok_uses, _use)
                    end
                end
            end
        end


        if length(ok_uses) > 0
            memo[(n, m, use)] = true
            return true, ok_uses
        else
            memo[(n, m, use)] = false
            return false, ok_uses
        end
    end


    use = fill(true, N)

    result, uses = dfs(H, W, use)


    if result
        println("Yes")
    else
        println("No")
    end

end

main()