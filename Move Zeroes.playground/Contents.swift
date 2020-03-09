/*:

# Move zeroes

Given an array nums, write a function to move all 0's to the end of it while maintaining the relative order of the non-zero elements.

```
Input: [0,1,0,3,12]
Output: [1,3,12,0,0]
```
**Note:**

- You must do this in-place without making a copy of the array.
- Minimize the total number of operations.
*/

class Solution {

	/// Time complexity: O(n), where n - length of `nums` array.
	///  Space: O(1)
    func moveZeroes(_ nums: inout [Int]) {
		var position = 0
		for idx in 0..<nums.count {
			if nums[idx] != 0 {
				nums.swapAt(position, idx)
				position += 1
			}
		}
    }
}

let solver = Solution()
var arr1 = [0,0,1,1,2,2,3,3,4,4]
solver.moveZeroes(&arr1)
arr1

var arr2 = [0,0,0,0,1]
solver.moveZeroes(&arr2)
arr2

var arr3 = [Int]()
solver.moveZeroes(&arr3)
arr3

var arr4 = [0,1,0,3,12]
solver.moveZeroes(&arr4)
arr4
