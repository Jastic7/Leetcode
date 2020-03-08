/*:

# Remove Element

Given an array nums and a value val, remove all instances of that value in-place and return the new length.

Do not allocate extra space for another array, you must do this by modifying the input array in-place with O(1) extra memory.

The order of elements can be changed. It doesn't matter what you leave beyond the new length.

```
Given nums = [3,2,2,3], val = 3,

Your function should return length = 2, with the first two elements of nums being 2.

It doesn't matter what you leave beyond the returned length.
```
```
Given nums = [0,1,2,2,3,0,4,2], val = 2,

Your function should return length = 5, with the first five elements of nums containing 0, 1, 3, 0, and 4.

Note that the order of those five elements can be arbitrary.

It doesn't matter what values are set beyond the returned length.
```
*/

class Solution {
    func removeElement(_ nums: inout [Int], _ val: Int) -> Int {
		var currentPosition = 0

		for idx in 0..<nums.count {
			if nums[idx] != val {
				nums[currentPosition] = nums[idx]
				currentPosition += 1
			}
		}

		return currentPosition
    }
}

let solver = Solution()

var nums1 = [0]
solver.removeElement(&nums1, 0)
nums1

var nums2 = [0,1,0]
solver.removeElement(&nums2, 0)
nums2

var nums3 = [0,0,1,0,0]
solver.removeElement(&nums3, 0)
nums3

var nums4 = [0,0,0,1]
solver.removeElement(&nums4, 0)
nums4

var nums5 = [1,0,0,0]
solver.removeElement(&nums5, 0)
nums5

var nums6: [Int] = []
solver.removeElement(&nums6, 0)
nums6

var nums7 = [1]
solver.removeElement(&nums7, 0)
nums7

var nums8 = [3,2,2,3]
solver.removeElement(&nums8, 3)
nums8
