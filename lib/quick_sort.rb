require 'byebug'

class QuickSort
  # Quick sort has average case time complexity O(nlogn), but worst
  # case O(n**2).

  # Not in-place. Uses O(n) memory.

  def self.sort1(array)
    return array if array.length < 1

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
  end

  def self.partition(array, start, length, &prc)
  end
end
