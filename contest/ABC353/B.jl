function main()
    N, K = parse.(Int, split(readline()))
    A = parse.(Int, split(readline()))
    rem = K
    c = 0
    while true
        if rem >= A[1]
            rem -= A[1]
            popfirst!(A)
        else
            rem = K
            c += 1
            continue
        end

        if isempty(A)
            println(c + 1)
            break
        end
    end


end

main()