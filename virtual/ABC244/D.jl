function main()
    S1, S2, S3 = split(readline())
    T1, T2, T3 = split(readline())
    same_count = Int(S1 == T1) + Int(S2 == T2) + Int(S3 == T3)
    if same_count== 0 || same_count == 3
        println("Yes")
    else
        println("No")
    end
end



main()