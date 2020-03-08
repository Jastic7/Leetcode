/*:

# Two Sum II - Input array is sorted

Given an array of integers that is already sorted in ascending order, find two numbers such that they add up to a specific target number.

The function twoSum should return indices of the two numbers such that they add up to the target, where index1 must be less than index2.

**Note:**

- Your returned answers (both index1 and index2) are not zero-based.
- You may assume that each input would have exactly one solution and you may not use the same element twice.

```
Input: numbers = [2,7,11,15], target = 9

Output: [1,2]

Explanation: The sum of 2 and 7 is 9. Therefore index1 = 1, index2 = 2.
```
*/

class Solution {

	/// Complexity O(n), where n - length of `numbers` array.
    func twoSum(_ numbers: [Int], _ target: Int) -> [Int] {
		var left = 0, right = numbers.count - 1

		while true {
			let sum = numbers[left] + numbers[right]

			if sum == target {
				return [left + 1, right + 1]
			}

			if sum > target {
				right -= 1
			} else {
				left += 1
			}
		}
    }
}

let solver = Solution()
solver.twoSum([2, 7, 11, 15], 9)
solver.twoSum([2, 7, 11, 15], 18)
solver.twoSum([2, 3, 4], 6)
solver.twoSum([-1, 0], -1)
solver.twoSum([3,24,50,79,88,150,345], 200)
