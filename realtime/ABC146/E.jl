#=
E:
- Julia version: 0.5.2
- Author: abap
- Date: 2019-12-22


function f(x::Int)
    stop = x / 2
    a = 1
   for i in 1:stop
   a *= i
      x -= 2
   end
   return a
end

function main()
N = parse(readline())

ans_f = f(N)

count = 0

for k in 1:10000000000000
	if ans_f % 10 == 0
		ans_f /= 10
		count += 1
	else
		break
	end
end

println(count)
end
main()=#

isOdd(x) = if x % 2 == 1
        return false
    else
        return true
    end


N = parse(readline())

Odd = isOdd(N)

if Odd == false
    println(0)
else
    main(N)
end

function howmany(N,num)
	a = 0
	for i in 1:60
	b = num^i
		if b > num
			print(div(N,b))
			a += div(N,b)
		else
			break
		end
	end
	return a
end



function main(N)
    five = howmany(N,5)
    two = howmany(N,2)
    ten = howmany(N,10)
    ans = ten + min(five,two)
end