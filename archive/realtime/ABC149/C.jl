#=
C:
- Julia version: 
- Author: abap
- Date: 2019-12-29
=#


function  isSosu(num)
    if num >= 64
	for j in 1:2:sqrt(num)
		if num % j == 0
			return false
		end
	end
	return true
	else num < 64
	return  mod(2^(num - 1),num) == 1
	end
end
#
function  main()
    X = parse(readline())
	if X == 2
        println(2)
    elseif X == 3
         println(3)
    elseif X==4
         println(5)
    elseif X == 5
        println(5)
	else
        for jj in X:X+6
            if jj % 6 == 0
                X = jj
                break
            end
		end
		for i in X:6:X+100000
			koho1 = X-1
			koho2 = X+1
			if isSosu(koho1)
				println(koho1)
				break
			elseif isSosu(koho2)
				println(koho2)
				break
			end
		end
	end
end

main()