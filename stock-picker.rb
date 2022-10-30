def stock_picker(array)
  array.reduce( Array.new(2,0) ) do |arr, item|
    temp = arr[0]

    profit = array[arr[1]] - array[arr[0]]

    arr[0] = array.index(item) if array[arr[1]] - item >= profit  # && item < array[arr[0]]
    arr[1] = array.index(item) if item - array[arr[0]] >= profit  # && item > array[arr[1]]

    arr[0] = temp if array.index(item) > arr[1]
    arr[1] = arr[0] if arr[1] < arr[0]

    arr
  end
end

puts stock_picker([17,3,6,9,15,8,6,1,10])
# => {1,4}  # for a profit of $15 - $3 == 12
