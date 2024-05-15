module Enumerable
  def my_all?
    all_true = 1

    my_each do |elem|
      all_true = 0 if yield(elem) == false
    end

    return true if all_true == 1

    false if all_true.zero?
  end

  def my_any?
    my_each do |elem|
      return true if yield(elem) == true
    end
    false
  end

  def my_count
    number_of_elements = 0

    my_each do |elem|
      next number_of_elements += 1 unless block_given?

      number_of_elements += 1 if yield(elem)
    end

    number_of_elements
  end

  def my_inject(initial_value)
    initial_value ||= self[0]
    my_each do |elem|
      initial_value = yield(initial_value, elem)
    end
    initial_value
  end

  def my_map
    mapped_array = []
    my_each do |elem|
      mapped_array.push(yield(elem))
    end
    mapped_array
  end

  def my_none?
    my_each do |elem|
      return false if yield(elem)
    end
    true
  end

  def my_select
    selected_arr = []
    my_each do |elem|
      selected_arr.push(elem) if yield(elem)
    end
    selected_arr
  end
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  # Define my_each here
  def my_each
    array_length = length
    index = 0
    until index == array_length
      yield(self[index])
      index += 1
    end
    self
  end

  def my_each_with_index
    array_length = length
    index = 0
    until index == array_length
      yield(self[index], index)
      index += 1
    end
    self
  end
end
