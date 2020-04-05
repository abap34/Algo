#=
B:
- Julia version: 0.5.2
- Author: abap
- Date: 2019-12-21
=#

S = readline()

len = length(S)

count = 0


for i in  1:div(len,2)
     if S[i] != S[len-i]
         count += 1
      end
end

println(count)