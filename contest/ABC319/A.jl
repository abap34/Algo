function main()
    S = """
tourist 3858
ksun48 3679
Benq 3658
Um_nik 3648
apiad 3638
Stonefeang 3630
ecnerwala 3613
mnbvmar 3555
newbiedmy 3516
semiexp 3481
"""

    target = readline()
    for s in split(S, "\n")
        if startswith(s, target)
            println(split(s)[2])
        end
    end


end

main()