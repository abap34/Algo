#=
C:
- Julia version:
- Author: abap
- Date: 2019-11-09
=#
parseInt(x::SubString{String}) = parse(Int,x)


function main()
    count::Int64 = 0
    N::Int64 = parse(readline())
    A::Array{Int64} = parseInt.(split(readline()))
    B::Array{Int64} = parseInt.(split(readline()))
    #=sort!(A,alg = QuickSort)
    sort!(B,alg = QuickSort)
    @simd for i in 1:N
        if B[i] < A[N]
            @inbounds A[N], B[i] = B[i], A[N]
            sort!(A,alg = QuickSort)
            count += 1
        end
    end
    if count > N - 2
        println("No")
    else
        println("Yes")
    end=#
    sort!(A)
    for i in B
        if i > A[N]
            count += 1
            end
            end

            if count < N - 2
                println("Yes")
            else
                println("No")
            end
end

main()