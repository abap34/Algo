parseInt(x) = parse(BigInt, x)
parseMap(x::Array{SubString{String},1}) = map(parseInt, x)


function main()
    N, X, M = parseMap(split(readline()))
    A = X
    loop = zeros(Int, M+2)
    seen = Set{Int}()
    loop_start = -1
    loop_length = 0
    ans = 0
    for i in 1:N
        #@show seen
        #@show A
        if (loop_start == -1) && !(in(A, seen))
            push!(seen, A)
            ans += A
        elseif (loop_start == -1) && in(A, seen)
            # @show A
            # @show i
            loop_start = A 
            loop_length = 1    
            loop[1] = loop_start
        end

        

        A = (A^2) % M

        if (loop_start != -1)
            if (loop_start == A)
                # @show A
                # @show i 
                k = (N - i) ÷ loop_length
                mo = (N - i) % loop_length
                # @show k
                # @show mo
                # @show loop[1:loop_length]
                # @show loop_length
                return ans + sum(loop) * (k + 1) + sum(loop[1:mo])   
            else
                loop_length += 1
                loop[loop_length] = A
            end
        end
    end
    return ans
end


println(main())