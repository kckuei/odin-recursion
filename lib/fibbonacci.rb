# Fibonacci solution, counting from 1:
# f(1) f(2) f(3) f(4) f(5) f(6) f(7) f(8)
#  0,   1,   1,   2,   3,   5,   8,   13...

def fibs(num, result = [0, 1])
  (2..num - 1).each { |i| result << result[i - 1] + result[i - 2] }
  result
end

def fibs_rec(num)
  return [0] if num <= 1
  return [0, 1] if num == 2

  result = fibs_rec(num - 1)
  result << result[-2] + result[-1]
end

p fibs(8)       # => [0, 1, 1, 2, 3, 5, 8, 13]
p fibs_rec(8)   # => [0, 1, 1, 2, 3, 5, 8, 13]
