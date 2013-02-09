# coding: utf-8
magic_number = rand(10)

ans = -1

puts '数字を当てて？'

while magic_number != ans
  ans = gets.to_i
  if magic_number < ans
    puts 'もっと小さいよ。'
  elsif magic_number > ans
    puts 'もっと大きいよ。'
  end    
end

puts 'あたり！'

