#=
C:
- Julia version: 
- Author: abap
- Date: 2020-01-22
=#
parseInt(x) = parse(Int, x)
parseMap(x::Array{SubString{String},1}) = map(parseInt, x)
N = parse(readline())
H = parseMap(split(readline()))
l = 1000000001
function main()
for i in N:-1:1
	h = H[i]
	if h - l > 2
		return "No"
	else
		h -= 1
	end
	l = h
end
return "Yes"
end

ans = main()
println(ans)