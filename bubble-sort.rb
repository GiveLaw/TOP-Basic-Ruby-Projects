def bubble_sort(array)
  return array if array.length < 2

  array.each_index do |index|
    next unless array[index + 1]
    if array[index] > array[index + 1]
      array[index], array[index+1] = array[index+1], array[index]
    end
  end

  bubble_sort(array[0..-2]).push(array[-1])
end

p bubble_sort([4,3,78,2,0,2])
# => [0,2,2,3,4,78]
