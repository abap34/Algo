#=
C:
- Julia version: 
- Author: abap
- Date: 2019-12-21
=#

function return_all_pettern(x)  #bit全探索
    count_pettern = x ^ 2
    b = []
    for i in 0:count_pettern - 1
        bit = bin(i, x)
        bits = []
        for j in 1:x
            push!(bits, bit[j])
        end
        bits = [bits .== '1']
        push!(b, bits)
    end
    #println(length(b))
    return  b
end


function main()
XY = Dict{Int64, Array{Any,1}}() # xıとyıの格納先
N = parse(Int,readline())
for i in 1:N
    A = parse(Int,readline())
    for j in  1:A
       xy = parse.(split(readline()))
       xy[2] = xy[2] == 1
       push!(XY,i=>xy)       # i = 発言者 xy = 主張
    end
end
petterns = return_all_pettern(length(keys(XY)))  # 全ての部分集合を取得
res_said = []
for i in 1:length(petterns)               # それぞれの部分集合についての結果の格納先
    push!(res_said,[])
end
for jj in 1:length(petterns)        # 特定の格納先に入れるためにインデックスを回す
    pettern = petterns[jj]
    honest_list = collect(1:N)[sum(pettern)]
    for k in honest_list
        push!(res_said[jj],[k,1])      # 発言している人は本物
        push!(res_said[jj], [XY[k][1],Bool(XY[k][2]) ]  ) # 本物の言っている人も本物
    end
end
global kari_ans = []
for i in 1:length(petterns)               # それぞれの仮の答えについての結果の格納先
    push!(kari_ans,[])
end

for kk in 1:length(petterns)        # 特定の格納先に入れるためにインデックスを回す
    res = res_said[kk]
    if res == []
        ans = 0
    else
        for ik in res
            push!(kari_ans[kk],[ik[1],ik[2]])
        end
    end
end
ans_list  = []
for kari in kari_ans
    #println(kari)
    honest_count = 0
    kari = unique(kari)
    for i in kari  # それぞれの結果について検証する
        #println(i)
        if i[2] == 0
            another_ans = [i[1],1]  # 違う答えがないかチェック
        else
            another_ans = [i[1],0]
            #=count = 0
            for jj in kari
                if jj == i
                    count += 1
                end
            end
            if count == 1
                honest_count += 1 # 同じ答えが何回もあるときはカウントしない
            end=#
        end
        if another_ans in kari
            honest_count = 0
            break
        end
    end
    push!(ans_list,honest_count)
end
println(maximum(ans_list))
end

main()