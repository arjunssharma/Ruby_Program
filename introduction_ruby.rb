# Part 1

# asharm33@ncsu.edu
# akanwar2@ncsu.edu

def unique_total a
  # ADD YOUR CODE HERE
  a.uniq.inject(0) { |sum, n| sum + n }
end

def highest_frequency a
  # ADD YOUR CODE HERE
  if a.length == 0 then
    return -1
  end
  hash = Hash.new(0)
  a.each{|key| hash[key] += 1}
  hash.sort_by {|k, v| [-v, k]}[0][0]
end

def check_sum? a, n
  # ADD YOUR CODE HERE
  hash = Hash.new(0)
  a.each { |key|
    rest = n - key
    if hash.key?rest then
      return true
    else
      hash[key] += 1
    end
  }
  false
end

# Part 2

def custom_concat s
  # ADD YOUR CODE HERE
  "Welcome, " + s
end

def initial_consonant? s
  # ADD YOUR CODE HERE
  vowels = ["a", "e", "i", "o", "u"]
  if s.empty? or vowels.include? s.downcase[0] then
    false
  else
    true
  end
end

def divisible_by_n? s,n
  # ADD YOUR CODE HERE
  s.each_char { |c|
    if ["0", "1"].include? c then
      next
    else
      return false
    end
  }
  if s.to_i(2) % n == 0 then
    true
  else
    false
  end
end

# Part 3

class Car
  # ADD YOUR CODE HERE

  attr_accessor :model_number
  attr_accessor :price

  def initialize(model_number, price)
    if model_number.empty? or price <= 0 then
      raise ArgumentError, "Error in initializing Car class"
    else
      @model_number = model_number
      @price = price
    end
  end

  def model_number=(str)
    if str.empty? then
      raise ArgumentError, "Model Number can't be empty"
    else
      @model_number = str
    end
  end

  def price=(price)
    if price <= 0 then
      raise ArgumentError, "Price can't be less than or equal to 0"
    else
      @price = price
    end
  end

  def formatted_price
    dollars = @price.to_i
    cents = (@price.modulo(1).round(2)*100).to_i
    str = ""
    if dollars != 0 and cents != 0 then
      str += "%s and %s" %[handle_plural(dollars, "dollar"),
                           handle_plural(cents, "cent")]
    elsif dollars != 0 then
      str += "%s" %(handle_plural(dollars, "dollar"))
    else
      str += "%s" %(handle_plural(cents, "cent"))
    end
    str += " only"

    str
  end

  protected
  def handle_plural(val, text)
    if val > 1 then
      text += 's'
    end
    "%d %s" %[val, text]
  end
end
