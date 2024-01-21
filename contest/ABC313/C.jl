function main()
    N = parse(Int, readline())
    if N == 1
        println(0)
        return
    end
    A = parse.(Int, split(readline()))
    S = sum(A)
    if S % N != 0
        m = S / N
        upper = Int(ceil(m))
        under = Int(floor(m))
        ans_up = 0
        ans_un = 0
        for a in A
            if a < m
                ans_un += under - a
            else
                ans_up += a - upper
            end
        end
        println(max(ans_up, ans_un))
    else
        upper = S ÷ N + 1
        under = S ÷ N 
        ans_up = 0
        ans_un = 0
        for a in A
            if a < (S / N)
                ans_un += under - a
            else
                ans_up += a - upper
            end
        end

        ans1 = max(ans_up, ans_un) 
        
        upper = S ÷ N 
        under = S ÷ N - 1
        ans_up = 0
        ans_un = 0
        for a in A
            if a < (S / N)
                ans_un += under - a
            else
                ans_up += a - upper
            end
        end


        ans2 = max(ans_up, ans_un)

        println(min(ans1, ans2))
    end
end



main()