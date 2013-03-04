#! /usr/local/bin/io

# フィボナッチ数を求めるメソッドを持つクラスを作る
Fibonacci := Object clone

# 再帰で求める方法
Fibonacci fib_recursive := method( index,
  if( index <= 0, 0,
    if( index == 1, 1,
      fib_recursive ( index -2 ) + fib_recursive ( index -1 )
    )
  )
)

# 再帰で求める方法の検証
for(i, 0, 8, write("fib_recursive(", i, "): ", Fibonacci fib_recursive(i), "\n"))

# ループで求める方法
Fibonacci fib_loop := method( index,
  if ( index <= 0, 0,
    if ( index == 1, 1,
      n2 := 0;
      n1 := 1;
      a := 0;
      for(i, 3, index, a = n1; n1 = n1 + n2; n2 = a);
      n1 + n2
    )
  )
)

# ループで求める方法の検証
for(i, 0, 8, write("fib_loop(", i, "): ", Fibonacci fib_loop(i), "\n"))

