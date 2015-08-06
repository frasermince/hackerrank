def find_fibonacci(n)
  if n == 0
    return @subpatterns[0]
  elsif n == 1
    return @subpatterns[1]
  end

  if @subpatterns[n-2] == nil
    find_fibonacci(n-2)
  end
  if @subpatterns[n-1] == nil
    find_fibonacci(n-1)
  end
  @subpatterns[n] = @subpatterns[n - 1] * @subpatterns[n - 1] + @subpatterns[n - 2]
  @subpatterns[n]
end

def fibonacci(a, b, n)
  @subpatterns = []
  1.upto(n) do |i|
    @subpatterns.push nil
  end
  @subpatterns[1] = a
  @subpatterns[2] = b
  find_fibonacci(n)
end

puts fibonacci(0, 1, 5)
