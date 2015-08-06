def values_without_last(m, n)
  @saved_values[m-1][n]
end

def values_with_last(m, coins, n)
  @saved_values[m][n - coins.last]
end

def coin_change(coins, n)
  m = coins.length
  if n == 0
    return 1
  elsif n < 0
    return 0
  end

  if m == 0 && n > 0
    return 0
  end

  if values_without_last(m, n) == nil
    @saved_values[m - 1][n] = coin_change(coins[0...-1], n)
  end
  if values_with_last(m, coins, n) == nil
    @saved_values[m][n - coins.last] = coin_change(coins, n - coins.last)
  end

  @saved_values[m][n] = values_without_last(m, n) + values_with_last(m, coins, n)
end

def prepare(coins)
  @saved_values = []
  0.upto(coins.count) do |amount_of_coins|
    @saved_values[amount_of_coins] = {}
  end
end

def main
  first_line = gets
  first_line = first_line.split(' ')
  n = first_line[0].to_i
  m = first_line[1].to_i
  coin = gets
  coins = coin.split(' ').map{|c| c.to_i}.first(m)

  prepare coins
  puts coin_change(coins, n)
end
main
