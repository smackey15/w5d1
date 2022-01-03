class MaxIntSet
  attr_reader :store

  def initialize(max)
    @store = Array.new(max, false)
    @range = (0..max)
  end

  def insert(num)
    if @range.include?(num)
      @store[num] = true
    else
      raise "Out of bounds"
    end
  end

  def remove(num)
    @store[num] = false
  end

  def include?(num)
    @store[num]
  end

  private

  def is_valid?(num)
  end

  def validate!(num)
  end
end


class IntSet
  attr_reader :store
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)
    self[num] << num
  end

  def remove(num)
    self[num].delete(num)
  end

  def include?(num)
    self[num].include?(num)
  end

  private
  def [](num)
    @store[num % num_buckets]
  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_reader :count

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)
    self[num] << num unless self.include?(num)
    #count += 1
  end

  def remove(num)
    self[num].delete(num) unless !self.include?(num)
     #count -= 1
  end

  def include?(num)
    self[num].include?(num) 
  end

  private

  def [](num)
    @store[num % num_buckets]
  end

  def num_buckets
    @store.length
  end

  def resize!
    if @count > num_buckets
      @store = Array.new(num_buckets * 2) {Array.new}
    end
  end
end
