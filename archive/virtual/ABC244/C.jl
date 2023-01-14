
function main()    
    N = parse(Int, readline())
    used_nums = Set{Int}(1)
    println(1)
    for _ in 1:2N + 1
        aoki_num = parse(Int, readline())
        (aoki_num == 0) && (exit())
        push!(used_nums, aoki_num)
        for i in 1:2N + 1
            if !(i in used_nums)
                println(i)
                push!(used_nums, i)
                break
            end
        end
    end
    
end

main()