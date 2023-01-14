using Primes


function main()
    N, X = parse.(Int, split(readline()))
    X = [factor(Set, X)...]
    exit_list = zeros(Int, length(X))	
	@show exit_list
    for i in 1:N
        _line = parse.(Int, split(readline()))
		L = _line[1]
		A = _line[2:end]
		for a in A
	    	a = factor(Array, a)
           		for _a in a
					ind = findall(x->x==_a, X)
					if length(ind) < 1
		    			continue
					else
		   				exit_list[findall(x->x==_a, X)[1]] += 1
	        		end
				end
	   		end
		end
    end
	@show exit_list
    return exit_list
end

@show main()
	
	
