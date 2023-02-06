class MaxIntSet
  attr_reader :store

  def initialize(max)
    @max = max
    @store = Array.new(@max, false)
  end

  def insert(num)
    self.validate!(num)
    if is_valid?(num)
      @store[num] = true
    end
    @store[num]
  end

  def remove(num)
    @store.delete(@store[num])
  end

  def include?(num)
    @store[num] ? true : false
  end

  private

  #heper function
  def is_valid?(num)
    (0...@store.length).each do |i|
      if i == num
        return true
      end
    end
    return false
  end

  def validate!(num)
    raise "Out of bounds" unless is_valid?(num)
  end
end

class IntSet
  attr_reader :store

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)
    self[num] << num unless self[num].include?(num)
  end

  def remove(num)
    self[num].delete(num)
  end

  def include?(num)
    if self[num].include?(num)
      return true
    end
    false
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    index = num % num_buckets
    @store[index]
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
    @cur_numbuckets = num_buckets
    @holder = Array.new(@cur_numbuckets * 2) { Array.new }
  end

  def insert(num)
  end

  def remove(num)
  end

  def include?(num)
    if self[num].include?(num)
      return true
    end
    false
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    index = num % num_buckets
    @store[index]
  end

  def num_buckets
    @store.length
  end

  def resize!
    if count > num_buckets
    end
  end
end
