function main()
    N, M = parse.(Int, split(readline()))
    A = parse.(Int, split(readline()))
    B = parse.(Int, split(readline()))
    result = 0
    for b in B
        result += A[b]
    end
    return result    
end

println(main())