yesno(b::Bool) = (b ? "Yes" : "No") |> println
function main()
    N = parse(Int, readline())
    D = parse.(Int, split(readline()))
    r = 0
    for i in 1:N
        for j in 1:D[i]
            m_dig = unique(digits(i))
            d_dig = unique(digits(j))
            if length(m_dig) == length(d_dig) == 1
                if m_dig[1] == d_dig[1]
                    r += 1
                end
            end
        end
    end

    println(r)

end

main()