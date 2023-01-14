#=
A:
- Julia version: 
- Author: abap
- Date: 2020-01-18
=#
H = parse(readline())
W = parse(readline())
N = parse(readline())
white = H * W
black  = 0
h = 0
w = 0
count = 0
for i in 1:100000
	count += 1
	if W - h > H - w
		w += 1
		black += W - h
	else
		h += 1
		black += H - w
	end
	if black >= N
		println(count)
		break
	end
end