# nums を並び替えて target にできるか？
function ok(target, nums)
    if target == 0
        if unique(nums) == [0]
            return true
        end
    end
    
    target_digits = digits(target)
    if length(target_digits) < length(nums)
        for i in 1:length(nums) - length(target_digits)
            push!(target_digits, 0)
        end
    elseif length(target)
    end

    sort!(target_digits)

    sort!(nums)

    if target_digits == nums
        return true
    else
        return false
    end

end

function issquare(N)
    if N == 0
        return true
    end

    for i in 1:Int(floor(sqrt(N))) + 1
        if i^2 == N
            return true
        end
    end

    return false
end


function main()
    N = parse(Int, readline())
    nums = parse.(Int, collect(readline()))
        
    N_max = Int(maximum(N) * 10^N)

    count = 0

    for i in 0:Int(floor(sqrt(N_max))) + 1
        if ok(i^2, nums)
            count += 1
        end
    end

    println(count)
end

main()