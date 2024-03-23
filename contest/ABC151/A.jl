#=
A:
- Julia version:
- Author: abap
- Date: 2020-01-12
=#
A = "abcdefghijklmnopqrstuvwxyz"
C = (chomp(readline()))
C = C[1]

for i in 1:26
  s = A[i]
  if C == s
    println(A[i+1])
    end
end
