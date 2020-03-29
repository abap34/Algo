#=
B:
- Julia version:0.5.2
- Author: abap
- Date: 2020-01-12
=#
using random
N = 10^4
open("input.txt","w") do fp
 write(fp,N)
end

a = random(Int,N)
println(a)
open( "input.txt", "a" ) do fp
  write( fp, "追記してみる\n" )
end