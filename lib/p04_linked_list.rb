class Link
  attr_accessor :key, :val, :next, :prev

  def initialize(key = nil, val = nil)
    @key = key
    @val = val
    @next = nil
    @prev = nil
  end

  def to_s
    "#{@key}: #{@val}"
  end

  def remove
    # optional but useful, connects previous link to next link
    # and removes self from list.
    self.prev.next = self.next if self.prev
    self.next.prev = self.prev if self.next
    self.next, self.prev = nil, nil
  end
end

require 'byebug'

class LinkedList
  include Enumerable

  def initialize
    @head = Link.new()
    @tail = Link.new()
    @head.next = @tail
    @tail.prev = @head

  end

  def [](i)
    each_with_index { |link, j| return link if i == j }
    nil
  end

  def first
    @head.next
  end

  def last
    @tail.prev
  end

  def empty?
    @head.next == @tail
  end

  def get(key)
    self.each do |link|
      return link.val if link.key == key
    end
    nil
  end

  def include?(key)
    self.each do |link|
      return true if link.key == key
    end
    false
  end

  def append(key, val)
    new_link = Link.new(key, val)
    prev_last = @tail.prev

    new_link.next = @tail
    new_link.prev = prev_last
    prev_last.next = new_link
    @tail.prev = new_link
  end

  def update(key, val)
    self.each do |link|
      if link.key == key
        link.val = val
      end
    end
  end

  def remove(key)
    self.each do |link|
      if link.key == key
        link.remove
        return
      end
    end
  end

  def each
    current_link = @head.next
    until current_link.next == @tail.next
      yield(current_link)
      current_link = current_link.next
    end
  end

  # uncomment when you have `each` working and `Enumerable` included
  def to_s
    inject([]) { |acc, link| acc << "[#{link.key}, #{link.val}]" }.join(", ")
  end
end
