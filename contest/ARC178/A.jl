DEBUG = true
function debug(args...)
    if DEBUG
        println(args...)
    end
end


function out(A)
    for a in A
        print("$a ")
    end

    println()
end

function main()
    N, M = parse.(Int, split(readline()))
    A = parse.(Int, split(readline()))
    
    A_set = Set(A)

    sort!(A)
    push!(A, N)

    if 1 in A_set || N in A_set
        println(-1)
        return
    end


    
    result = collect(1:N)

    for i in 1:N
        if i in A_set
            result[i], result[i+1] = result[i+1], result[i]
        end
    end

    out(result)


end

main()