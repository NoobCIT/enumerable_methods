module Enumerable

  def my_each
    i = 0
    while i < self.length
      yield(self[i])
      i += 1
    end
  end

  def my_each_with_index
    i = 0
    while i < self.length
      yield(self[i], i)
      i +=1
    end
  end

  def my_select
    i = 0
    array = []
    while i < self.length
      if yield(self[i])
        array << self[i]
      end
      i +=1
    end
    array
  end

  def my_all?
    i = 0
    while i < self.length
      if yield(self[i])
        i += 1
      else
        return false
        break
      end
    end
    true
  end

  def my_any?
    i = 0
    while i < self.length
      if yield(self[i])
        return true
        break
      else
        i += 1
      end
    end
    false
  end

  def my_none?
    i = 0
    result = []
    while i < self.length
      if yield(self[i])
        result << true
      else
        result << false
      end
      i += 1
    end
    j = 1
    while j < result.length
      if result[j] == result[j-1]
        j += 1
      else
        return false
        break
      end
    end
    true
  end

  def my_count
    i = 0
    j = 0
    while i < self.length
      if yield(self[i])
        j += 1
      end
      i += 1
    end
    j
  end

  def my_map(&proc)
    i = 0
    array = []
    while i < self.length
      array << (proc != nil ? proc.call(self[i]) : yield(self[i]))
      i += 1
    end
    array
  end

  def my_inject(result = nil)
    i = 0
    while i < self.length
      if (i == 0) && (result == nil)
        result = self[i]
      elsif (i == 0) && (result != nil)
        result = yield(result, self[i])
      else
        result = yield(result, self[i])
      end
      i += 1
    end
    result
  end

  def multiply_els
    return self.my_inject { |product, num| product * num}
  end


end

include Enumerable
