/*:

# Rotate Array

Given an array, rotate the array to the right by k steps, where k is non-negative.

```
Input: [1,2,3,4,5,6,7] and k = 3

Output: [5,6,7,1,2,3,4]

Explanation:

rotate 1 steps to the right: [7,1,2,3,4,5,6]
rotate 2 steps to the right: [6,7,1,2,3,4,5]
rotate 3 steps to the right: [5,6,7,1,2,3,4]
```
```
Input: [-1,-100,3,99] and k = 2

Output: [3,99,-1,-100]

Explanation:

rotate 1 steps to the right: [99,-1,-100,3]
rotate 2 steps to the right: [3,99,-1,-100]
```
**Note:**

- Try to come up as many solutions as you can, there are at least 3 different ways to solve this problem.
- Could you do it in-place with O(1) extra space?
*/

class Solution {
    func rotate(_ nums: inout [Int], _ k: Int) {

//		Solution #1:
//		Complexity O(n), where n - nums.count
//		Space also O(n).

//		var tmp = Array(repeating: 0, count: nums.count)
//		for idx in 0..<nums.count {
//			let newIdx = (idx + k) % nums.count
//			tmp[newIdx] = nums[idx]
//		}
//		nums = tmp

//		Solution #2:
//		Complexity O(n), where n - nums.count
//		Space O(1).

		let offset = k % nums.count
		var idx = 0, shifts = 0
		var buffer: Int

		while shifts < nums.count {
			var currentIdx = idx
			var val = nums[currentIdx]

			repeat {
				currentIdx = (currentIdx + offset) % nums.count

				buffer = nums[currentIdx]
				nums[currentIdx] = val
				val = buffer

				shifts += 1
			} while currentIdx != idx

			idx += 1
		}
    }
}

let solver = Solution()
var arr1 = [1,2,3,4,5,6]
solver.rotate(&arr1, 1)
arr1
