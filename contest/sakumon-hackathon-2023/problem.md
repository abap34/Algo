# Double Least Squares 

二次元座標上に $N$ 個の点があります。$i$ 番目の点の座標は $(x_i, y_i)$ です。

$N$, 各 $(x_i, y_i)$, $W$と$H$が与えられます。



ここで、$h_u$と$h_d$を定めます。
($h_u \geq h_d$)

このとき、$(0, W)$と$(W, h_u)$を通る一次関数を$f_{h_u}$

$(0, 0)$と$(W, h_d)$を通る一次関数を$g_{h_d}$とします。

次の関数$L(h_u, h_d)$を最小化する$h_u$と$h_d$を一つ求めて出力してください。
$$
L(h_u, h_d) =\sum_i^n \min \left\{ \left( y_i - f_{h_u}(x_i) \right)^2, \left( y_i - g_{h_d}(x_i) \right)^2 \right\}
$$

<!-- align center -->

<div style="text-align: center">

![問題図](problem1.svg)

</div>

つまり、上図の矢印の長さの総和が最小になるような$h_u$と$h_d$を求めてください。


## 制約

- 入力はすべて整数
- $1 \leq N \leq 10^2$
- $1 \leq W, H \leq 10^9$
- $\forall i \in \{1, 2, \dots, N\}, 0 \leq x_i \leq W, 0 \leq y_i \leq H$


## 入力の形式