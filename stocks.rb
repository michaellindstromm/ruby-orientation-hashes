stock_dict = { 
    'GM' => 'General Motors',
    'CAT' => 'Caterpillar', 
    'EK' => "Eastman Kodak",
    'GE' => "General Electric"
}

 purchases = [
    [ 'GE', 100, '10-sep-2001', 48 ],
    [ 'CAT', 100, '1-apr-1999', 24 ],
    [ 'GE', 200, '1-jul-1998', 56 ], 
    [ 'EK', 250, '1-aug-1997', 45 ],
    [ 'GM', 89, '1-aug-1997', 35 ],
    [ 'GM', 124, '1-aug-1997', 37 ],
    [ 'GE', 112, '10-sep-2001', 47 ]
]

purchase_history_report = Array.new
purchase_summary_report = Hash.new

for stock_purchase in purchases do
    symbol = stock_purchase[0]
    name =  stock_dict[symbol]
    shares = stock_purchase[1]
    price = stock_purchase[3]
    full_purchase_price = shares * price
    date = stock_purchase[2]
    purchase_history_report.push( {name: name, date: date, shares: shares, price: price, full_purchase_price: full_purchase_price} )

    if purchase_summary_report[symbol]
        purchase_summary_report[symbol].push({name: name, date: date, shares: shares, price: price, full_purchase_price: full_purchase_price})
    else
        purchase_summary_report[symbol] = Array.new
        purchase_summary_report[symbol].push({name: name, date: date, shares: shares, price: price, full_purchase_price: full_purchase_price})
        full_price = purchase_summary_report[symbol][0][:full_purchase_price]
    end
end

puts
puts "-----------------------"
puts "Purchase History Report"
puts "-----------------------"

for purchase in purchase_history_report do
    puts purchase
end

puts
puts "-----------------------"
puts "Purchase Summary Report"
puts "-----------------------"

for purchase in purchase_summary_report do
    puts purchase
end



