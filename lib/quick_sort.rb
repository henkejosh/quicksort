require 'byebug'

class QuickSort
  # Quick sort has average case time complexity O(nlogn), but worst
  # case O(n**2).

  # Not in-place. Uses O(n) memory.

  def self.sort1(array)
    return array if array.length <= 1

    pivot_idx = rand(array.length)
    array[0], array[pivot_idx] = array[pivot_idx], array[0]
    pivot = array.first

    array = array.drop(1)

    left, right = [], []

    array.each do |el|
      el <= pivot ? left << el : right << el
    end

    sort1(left) + [pivot] + sort1(right)
  end

  # In-place.
  def self.sort2!(array, start = 0, length = array.length, &prc)
    prc ||= Proc.new { |el1, el2| el1 <=> el2 }
    return array if length <= 1

    pivot = self.partition(array, start, length, &prc)

    left_length = pivot - start
    right_length = length - (left_length + 1)

    self.sort2!(array, start, left_length, &prc)
    self.sort2!(array, pivot + 1, right_length, &prc)
    array
  end

  def self.partition(array, start, length, &prc)
    prc ||= Proc.new { |el1, el2| el1 <=> el2 }
    pivot = array[start]

    (start + 1).upto(start + length - 1).each do |idx|

      val = prc.call(array[idx], pivot)

      if val <= 0
        array[start + 1], array[idx] = array[idx], array[start + 1]
        array[start], array[start + 1] = array[start + 1], array[start]
        start += 1
      end
    end

    return start
  end
end

# ::partition method takes in an array, a start position (this should
#  be your pivot), and a length. It should go through all of the
#  elements from the start position up to start + length. It should
#  move all elements less than the pivot to its left and all elements
#  greater than the pivot to the right thus partitioning this portion
#  of the array. At the end of the method, it should return the pivot
#  element's new index.
