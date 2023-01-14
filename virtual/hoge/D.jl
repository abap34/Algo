function main()
    N, M = parse.(Int, split(readline()))
    disks = []
    for i in 1:M
        disk = parse(Int, readline())
        push!(disks, disk)
    end

    status = collect(1:N)

    prev = 0
    for i in 1:M
        disk = disks[i]
        if prev == disk
            prev = disk
            continue
        end
        if i == 1
            status[disk] = 0
            prev = disk
            continue
        end
        put_index = findfirst(x -> x == disk, status)
        status[put_index] = prev
        prev = disk
    end
    
    for d in status
        println(d)
    end
    
end

main()