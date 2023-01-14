#=
D:
- Julia version:  0.5.2
- Author: abap
- Date: 2019-11-24
=#
parseInt(x) = parse(Int,x)
parseMap(x::Array{SubString{String}, 1}) = map(parseInt, x)
function  main()
N = parse(readline())
renga = parseMap(split(readline()))

count = 0
w = 1
for i in 1:N
	if renga[i] != w
		count += 1
	else
		w += 1
	end
end

if w == 1
   println("-1")
else
   println(count)
end
end
main()