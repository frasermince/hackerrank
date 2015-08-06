class Child
  def initialize(score)
    @score = score
    @candies = 0
  end
  def give_candy(candy)
    @candies = candy
  end

  def score
    @score
  end

  def get_candy_amount
    @candies
  end
end

def greater_than_last(n)
  n != 0 && @children[n - 1].score < @children[n].score
end

def greater_than_next(n)
  n != @children.length - 1 && @children[n + 1].score < @children[n].score
end

def check_stored_value(n)
  if @children[n].get_candy_amount == 0
    find_candy_amount(n)
  else
    @children[n].get_candy_amount
  end
end

def find_candy_amount(n)
  previous_child = 0
  next_child = 0
  if greater_than_last(n)
    previous_child = check_stored_value n - 1
  end
  if greater_than_next(n)
    next_child = check_stored_value n + 1
  end
  @children[n].give_candy [previous_child, next_child].max + 1
end

def candies(children)
  @children = children
  @children.each_with_index do |child, index|
    find_candy_amount(index)
  end
  @children.inject(0){|accumulator, child| accumulator + child.get_candy_amount}

end

def init(candies)
  candies.map do |candy_amount|
    Child.new(candy_amount)
  end
end

def main
  amount_of_children = gets
  children = []
  1.upto(amount_of_children.to_i) do |i|
    child = gets
    children.push child.to_i
  end
  children = init children
  puts candies children
end
main
