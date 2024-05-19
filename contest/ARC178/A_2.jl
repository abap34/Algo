DEBUG = true
function debug(args...)
    if DEBUG
        println(args...)
    end
end


function main()
    N, M = parse.(Int, split(readline()))
    A = parse.(Int, split(readline()))


    result = zeros(Int, N)

    result[1] = 1
    result[end] = 2
    result[2:end-1] = collect(3:N)

    debug(result)
end

main()