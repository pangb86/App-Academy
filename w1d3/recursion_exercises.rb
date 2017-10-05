require 'byebug'
def excercise(name)
  puts "*****************"
  puts "Excercise: #{name}"
  puts "*****************"
end

excercise("range_recursive")
def range(num1, num2)
  return [num2 - 1] if num1 == (num2 - 1)

  [num1].concat(range(num1 + 1, num2))
end
p range(1, 5)
excercise("range_interavtive")
def range_interavtive(num1, num2)
  arr = []
  (num1...num2).each do |el|
    arr << el
  end

  arr
end
p range_interavtive(1, 5)

excercise("exponentiation_recursion_1")
def exponentiation(base, exponent)
  return base if exponent == 1
  return nil if exponent < 0
  return 1 if exponent == 0
  base * exponentiation(base, exponent - 1)
end
p exponentiation(2,3)
p exponentiation(2,256)
excercise("exponentiation_recursion_2")
def exponentiation2(base, exponent)
  return base if exponent == 1
  return nil if exponent < 0
  return 1 if exponent == 0
  if exponent.even?
    (exponentiation2(base, exponent/2) ** 2)
  else
    base * (exponentiation2(base, (exponent - 1) / 2) **2)
  end
end
p exponentiation2(2,10)
p exponentiation2(2,-1)

excercise("Deep Dup")
def deep_dup(array)
  #return array if array.length <= 1
  array.map.with_index do |el, idx|
    if el.is_a?(Array)
      deep_dup(el.dup)
    else
      el
    end
  end
end

robot_parts = [
  ["nuts", "bolts", "washers"],
  ["capacitors", "resistors", "inductors"]
]
 a = deep_dup(robot_parts)
 b = deep_dup(robot_parts)

p robot_parts
p a
p b
p a << 'whatever1'
p b << 'whatever2'
p robot_parts

excercise("Fibonacci_up_to_the_nth")
def fibonacci_nth(n)
  return [] if n == 0
  return [0] if n == 1
  return [0, 1] if n == 2
  small_fibs = fibonacci_nth(n - 1)
  last_fib = small_fibs[-1] + small_fibs[-2]
  small_fibs << last_fib
  small_fibs
end
p fibonacci_nth(10)
excercise("fibonacci number")
def fibonacci(n)
  return 0 if n == 0
  return 1 if n == 1
  fibonacci(n - 1) + fibonacci(n - 2)
end

p fibonacci(10)

excercise("Subsets")
def subsets(arr)
=begin
TO DO base case =>
TO DO inductive case =>
TO DO how to call the recursion without mutating the original arr.
=end
  return [[]] if arr.empty?

  previous = subsets(arr[0..-2])
  new_arr = previous.map do |el|
    el + [arr.last]
  end

  previous + new_arr
end

p subsets([1, 2, 3])

excercise("Permutations")
def permutations(arr)
  return [[]] if arr.length == 0
  return [arr] if arr.length == 1

  drop_first = permutations(arr.drop(1))
  result = []

  drop_first.each do |element|
    (drop_first.length + 1).times do |idx|
              #debugger
        result << element.dup.insert(idx, arr.first)

    end
  end

  result
end

p permutations([1,2,3])
p permutations([])
