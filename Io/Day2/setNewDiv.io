# /usr/local/bin/io

# 既存の除算をバックアップ
Number _originalDiv := Number getSlot("/")

# 「分母が０なら答えは０」の分岐を差し込む
Number / := method( i, if ( i == 0, 0, self _originalDiv(i) ) )

# 演算結果
( 1 / 2 ) println

( 1 / 0 ) println

