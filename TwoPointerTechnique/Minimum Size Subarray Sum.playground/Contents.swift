/*:

# Minimum Size Subarray Sum

Given an array of n positive integers and a positive integer s, find the minimal length of a contiguous subarray of which the sum ≥ s. If there isn't one, return 0 instead.

```
Input: s = 7, nums = [2,3,1,2,4,3]

Output: 2

Explanation: the subarray [4,3] has the minimal length under the problem constraint.
```

**Follow up:**

If you have figured out the O(n) solution, try coding another solution of which the time complexity is O(n log n).
*/

class Solution {

	/// Complexity O(n)
	/// - Parameters:
    func minSubArrayLen(_ s: Int, _ nums: [Int]) -> Int {
		var left = 0
		var right = 0
		var minLength = Int.max
		var accumulator = 0

		while nums.indices.contains(left) && nums.indices.contains(right) {
			if accumulator < s {
				accumulator += nums[right]
			}

			if accumulator >= s {
				minLength = min(minLength, right - left + 1)
				accumulator -= nums[left]
				left += 1
			}

			if accumulator < s {
				right += 1
			}
		}

		return minLength == Int.max ? 0 : minLength
    }
}

let solver = Solution()
solver.minSubArrayLen(7, [2,3,1,2,4,3])
solver.minSubArrayLen(7, [2,3,1,2,4,7])
solver.minSubArrayLen(7, [1])
solver.minSubArrayLen(7, [])
solver.minSubArrayLen(1, [1, 1, 1, 1])
solver.minSubArrayLen(100, [100, 50, 50])
solver.minSubArrayLen(100, [100, 50, 50, 100])
solver.minSubArrayLen(100, [50, 50, 100, 50, 50])
