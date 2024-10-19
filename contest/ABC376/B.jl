const DEBUG = false

function debug(args...)
    if DEBUG
        println(args...)
    end
end


function main()
    N, Q = parse.(Int, split(readline()))
    H = Char[]
    T = Int[]
    for _ in 1:Q
        h, t = split(readline())
        push!(H, h[1])
        push!(T, parse(Int, t) - 1)
    end

    l = 0
    r = 1
    ans = 0

    for i in 1:Q
        h = H[i]
        t = T[i]

        if h == 'L'
            if l == t
                continue
            end


            debug("L")
            # l から r に右回りで移動できるか調べる
            # 右回り試す:
            _l = l
            ok = false
            debug("右回り試す")
            for i in 1:N
                _l = (_l + 1) % N
                debug("l: ", _l)

                if _l == t
                    ans += i
                    ok = true
                    break
                end

                if _l == r
                    debug("右回り失敗")
                    break
                end
            end

            if ok
                l = t

            else
                # 左回り試す:
                debug("左回り試す!! 今: ", l, " 目的: ", t)
                _l = l
                for i in 1:N
                    _l = (_l - 1 + N) % N
                    debug("l: ", _l)
                    if _l == t
                        debug("左まわりが成功")
                        debug("移動回数: ", i)
                        ans += i
                        l = t
                        break
                    end

                    if _l == r
                        break
                    end
                end
            end
        elseif h == 'R'
            if r == t
                continue
            end

            debug("R")
            # r から l に左回りで移動できるか調べる
            # 左回り試す:
            debug("左回り試す")
            _r = r
            ok = false
            for i in 1:N
                _r = (_r - 1 + N) % N
                if _r == t
                    ans += i
                    ok = true
                    break
                end

                if _r == l
                    debug("左回り失敗")
                    break
                end
            end

            if ok
                r = t
            else

                # 右回り試す:
                debug("右回り試す!! 今: ", r, " 目的: ", t)
                _r = r
                for i in 1:N
                    _r = (_r + 1) % N
                    debug("r: ", _r)
                    if _r == t
                        debug("右まわりが成功")
                        debug("i: ", i)
                        ans += i
                        r = t
                        break
                    end

                    if _r == l
                        debug("右回り失敗")
                        break
                    end
                end
            end

        end
    end

    println(ans)
end

main()