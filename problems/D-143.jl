#=
D:
- Julia version: 
- Author: abap
- Date: 2020-01-21
=#
parseInt(x) = parse(Int, x)
parseMap(x::Array{SubString{String},1}) = map(parseInt, x)
N = parseInt(readline())
L = parseMap(split(readline()))
sort!(L)
ans = 0
function BinarySearch(A::Array,key::Integer,N::Int)
   left = 1
   right = N
   mid = div(N,2)
   while left < right
       mid = div((left + right),2)
       if key == A[mid]
           return mid
       elseif  key < A[mid]
           right = mid
       else
           left = mid + 1
       end
   end
   return mid + 1
end

for i in 1:N
	for j in i+1:N
		a = i + j
		println(i," ",j)
		println(ans)
		ans +=  N - BinarySearch(L,a,N) + 1
	end
end
println(ans)

