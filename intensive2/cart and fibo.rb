string = 'Hello world, i love ruby'
p string.scan(/\w+/).join(',')

#Fibo
arrFibo = [0, 1]

i = 1
while arrFibo[i] < 100000 - arrFibo[i-1]
  i +=1
  arrFibo[i] = arrFibo[i-1] + arrFibo[i-2]
end
p arrFibo

#Cart
cart = {}

#loop do
product  = 'car'
price    = 35
quantity = 4

cart[product.to_sym] = {Цена: price, Количество: quantity, Сумма: price*quantity} 
#end

total_price = 0

cart.each do |item, params|
  params.each do |key, value|
    if key.to_s == "Сумма"
      total_price += value 
    end
  end

end

puts cart
puts "Сумма Вашего заказа: #{total_price}"
