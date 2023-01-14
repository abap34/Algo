parseInt(x) = parse(Int, x)
parseMap(x::Array{SubString{String},1}) = map(parseInt, x)




function check(table, K, H, W)
    ans = 0
    for i in 1:H
        for j in 1:W
            if table[i][j] == '#'
                ans += 1
            end
        end
    end
    return (ans == K)
end




function main()
H, W, K = parseMap(split(readline()))

table = []

for idx1 in 1:H
    C = collect(chomp(readline()))
    push!(table, C)
end
old_table = deepcopy(table)

ans = 0
for i in 0:2^H - 1
    for j in 0:2^W - 1 
        y_p = digits(i, base=2, pad=H)
        t_p = digits(j, base=2, pad=W)
        for k in 1:H
            y = y_p[k]
            if y == 1
                for kk in 1:W
                    table[k][kk] = 'r'
                end
            end
        end

        for k in 1:W
            t = t_p[k]
            if t == 1
                for kk in 1:H
                    table[kk][k] = 'r'
                end
            end
        end
        if check(table, K, H, W)
            ans += 1
        end
        table = deepcopy(old_table)
    end
end


println(ans)


end


main()