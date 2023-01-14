N = parse(Int, readline())

ns = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "A", "B", "C", "D", "E", "F"]


println(ns[N ÷ 16 + 1] * ns[N % 16 + 1])
