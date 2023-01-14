#=
C:
- Julia version: 
- Author: abap
- Date: 2020-01-12
=#
parseInt(x) = parse(Int, x)
parseMap(x::Array{SubString{String},1}) = map(parseInt, x)
N,M = parseMap(split(readline()))
d = Dict()
wa = 0
ac = 0
for i in 1:M
	#println(d)
	p,s = split(readline())
	p = parseInt(p)
	#println("$p $s")
	if !(in(p,keys(d)))
		in(p,keys(d))
		push!(d,p=>"wa")
	end
	#=
	if s == "WA\n" &&  d[p] == "wa"
		wa += 1
		#print("$(d[p]) なので、wa")
	elseif s == "AC\n" && d[p] == "wa"
		d[p] = "ac"
		#ac += 1
		#println("ac")
	end=#
	if d[p] == "wa"
		if s == "WA"
			wa += 1
		else
			ac += 1
			d[p] = "ac"
		end
	end
end
#=for i in values(d)
	if i == "ac"
		ac += 1
	end
end=!=#
ac = Int(ac)
wa = Int(wa)
println("$ac $wa")
print("")