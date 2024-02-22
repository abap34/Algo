using Printf

function generate(N, H)
    x = rand(1:500, N)
    y = rand(1:500, N)
    S =  
    """
    $N
    $H
    """
    for i in 1:N
        S *= "$(x[i]) $(y[i])\n"
    end
    return S
end


using ProgressBars


# コーナーケース1 一本で全部通る from (0, 0)
S1 = 
"""
4
10
1 1
2 2 
3 3 
4 4
"""

# コーナーケース2 一本で全部通る (0, H)
S2 = 
"""
4
10
1 9 
2 8 
3 7
4 6
"""

# コーナーケース3 二本で全部通る & クロス
S3 = 
"""
8
10
1 9 
1 9 
2 8 
3 7
4 6
2 8 
3 7
4 6
"""


# コーナーケース4 同じ点がある
S4 = 
"""
2
4
1 1
1 1
"""


# コーナーケース5 偏角ソートで普通にやったら 0 divisionになるやつ その2
S5 = 
"""
2
4
1 1
1 2
"""


# コーナーケース6 平行な線二つ
S6 = 
"""
4
4
1 1
4 1
2 4
4 4
"""

# コーナーケース7 N=1 その1
S7 = 
"""
1
4
1 1
"""

# コーナーケース8 N=1 その2
S8 = 
"""
1
4
1 4
"""

# コーナーケース9 上下対称なもの
S9 = 
"""
5
4
1 1
1 3
2 2
3 1
3 3
"""

# コーナーケース10 クロスするやつ
S10 = 
"""
20
10
1 1
2 2
3 4
4 4
5 5
6 6
7 7
8 8
9 9
10 10
1 10
2 9
3 8
4 7
5 6
6 5
7 2
8 3
9 2
10 1
"""

corner_cases = [S1, S2, S3, S4, S5, S6, S7, S8, S9, S10]

# めっちゃ下に偏ってるやつ
for _ in 1:5
    N = 2000
    H = 500
    x = rand(1:500, N)
    y = rand(1:10, N)
    S =  
    """
    $N
    $H
    """
    for i in 1:N
        S *= "$(x[i]) $(y[i])\n"
    end
    push!(corner_cases, S)
end


# めっちゃ中央に偏ってるやつ
for _ in 1:5
    N = 2000
    H = 500
    x = rand(200:250, N)
    y = rand(200:250, N)
    S =  
    """
    $N
    $H
    """
    for i in 1:N
        S *= "$(x[i]) $(y[i])\n"
    end
    push!(corner_cases, S)
end


for (i, S) in enumerate(corner_cases)
    open((@sprintf "in/%03d.txt" i), "w") do f
        write(f, S)
    end
end


for i in ProgressBar(length(corner_cases)+1:30)
    N = rand(1800:2000)
    H = rand(1:500)
    S = generate(N,H)
    open((@sprintf "in/%03d.txt" i), "w") do f
        write(f, S)
    end
end