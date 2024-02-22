import scipy




def main():
    p = float(input())
    ax, ay = map(int, input().split())
    bx, by = map(int, input().split())
    cx, cy = map(int, input().split())

    def f(x, y):
        # p-norm from 3 points
        return (ax - x) ** p + (ay - y) ** p + (bx - x) ** p + (by - y) ** p + (cx - x) ** p + (cy - y) ** p
    
    # これを最小化する (x, y) を求める
    init = [ax, ay]
    result = scipy.optimize.minimize(lambda x: f(x[0], x[1]), init, method='Nelder-Mead')
    # 結果の入力を出力
    print(result)



if __name__ == "__main__":
    main()