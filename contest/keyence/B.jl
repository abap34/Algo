#=
B:
- Julia version: 
- Author: abap
- Date: 2020-01-18
=#
parseInt(x) = parse(Int,x)
function main()
rem = 0
const N = parseInt(readline())
#println()
#println(N)
robots = []
for i in 1:N
	X, L = parse.(split(readline()))
	push!(robots,(X,L))
end
old_robot = - (10^10)
#println("初期値は、$old_robot です")
for robot in sort(robots)
	#println(robot)
	left = robot[1] - (robot[2] - 1)
	if old_robot >  left
		rem += 1
		#println("$(robot[1]) はかぶりです")
		#println("左端が$left")
		#println("前のの右が$(old_robot) なので")
		#println()
		old_robot = - (10 ^ 10)
	else
		old_robot = robot[1] + robot[2] - 1
	end
end

ans  = N - rem
println(ans)
end
main()