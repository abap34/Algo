# 必要なパッケージの読み込み
using Dates

# タイムアウト付きのブール型構造体の定義
mutable struct TimeoutBool
    timeout::Millisecond
    created::DateTime
end

# コンストラクタ関数
function TimeoutBool(timeout_ms::Int) 
    return TimeoutBool(Millisecond(timeout_ms), Dates.now())
end

# ブール型への変換
Base.Bool(x::TimeoutBool) = is_timeout(x)

# タイムアウト判定関数
function is_timeout(x::TimeoutBool)
    now_time = Dates.now()
    elapsed_time = now_time - x.created
    if elapsed_time >= x.timeout
        return true
    end
    return false
end

# 使用例
function example()
    timeout_ms = 5000  # 5秒のタイムアウト
    timeout_bool = TimeoutBool(timeout_ms)

    while is_timeout(timeout_bool)
        println("Timeout has not occurred yet.")
        sleep(0.1)  # 0.1秒待機
    end

    println("Timeout occurred.")
end

example()
