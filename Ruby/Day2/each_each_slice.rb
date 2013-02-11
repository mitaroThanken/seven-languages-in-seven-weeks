# coding: utf-8

# １６個の数値と４個の数値の配列
a = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16]
b = [10, 20, 30, 40]

puts "each だけで一気に出力。"
(a + b).each {|x| puts x}

puts

puts "each_slice でやってみる。"
(a + b).each_slice(1) {|x| puts x}

puts

puts "…指示を間違えてとっている気がする…"

