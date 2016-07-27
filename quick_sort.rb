class QuickSort

  # O(n) space complexity
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

  # In-place [ O(1) space ]
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

    pivot_idx = start + rand(length)
    array[start], array[pivot_idx] = array[pivot_idx], array[start]
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
