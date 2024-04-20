function main()
    S = collect(readline())
    num = S[4:end] |> join
    c = parse(Int, num)
    if c != 316 && (1 < c < 350)
         println("Yes")
      else
         println("No")
      end 
 end
 
 main()