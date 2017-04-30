class Fixnum
  # Fixnum#hash already implemented for you
end

class Array
  def hash
    sum = 0;
    self.each_with_index do |el, i|
      sum += (el.hash * i)
    end
    sum.hash
  end
end

class String
  def hash
    sum = 0;
    i = 0
    self.split(//).each_with_index do |char, i|
      sum += (char.ord * i)
    end
    sum.hash
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    sum = 0;
    self.keys.each do |key|
      sum += key.to_s.hash * self[key].hash
    end
    sum
    # 0
  end
end
