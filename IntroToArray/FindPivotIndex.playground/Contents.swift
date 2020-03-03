/*:

# Find Pivot Index

Given an array of integers `nums`, write a method that returns the "pivot" index of this array.

We define the pivot index as the index where the sum of the numbers to the left of the index is equal to the sum of the numbers to the right of the index.

If no such index exists, we should return -1. If there are multiple pivot indexes, you should return the left-most pivot index.

```
Input:
nums = [1, 7, 3, 6, 5, 6]

Output: 3

Explanation:
The sum of the numbers to the left of index 3 (nums[3] = 6) is equal to the sum of numbers to the right of index 3.
Also, 3 is the first index where this occurs.
```

```
Input:
nums = [1, 2, 3]

Output: -1

Explanation:
There is no index that satisfies the conditions in the problem statement.
```

**Note:**

- The length of nums will be in the range `[0, 10000]`.
- Each element `nums[i]` will be an integer in the range `[-1000, 1000]`.
*/


class Solution {
    func pivotIndex(_ nums: [Int]) -> Int {
		guard !nums.isEmpty else { return -1 }

		// It seems better, but at the same time shows a worse performance in the Leetcode benchmarks.
		// let sum = nums.reduce(0) { $0 + $1}

		var sum = 0
		for idx in 0..<nums.count { sum += nums[idx] }

		var accumulator = 0
		var reverseAccumulator = sum

		// There is also another fancy approach, that leads to worse benchmark results.
		// for (idx, num) in nums.enumerated()
		for idx in 0..<nums.count {
			accumulator += nums[idx]

			if reverseAccumulator == accumulator {
				return idx
			}

			reverseAccumulator -= nums[idx]
		}

		return -1
    }
}

let solver = Solution()
solver.pivotIndex([1, 7, 3, 6, 5, 6])
solver.pivotIndex([1, 2, 3])
