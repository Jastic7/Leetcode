/*:

# Plus One

Given a non-empty array of digits representing a non-negative integer, plus one to the integer.

The digits are stored such that the most significant digit is at the head of the list, and each element in the array contain a single digit.

You may assume the integer does not contain any leading zero, except the number 0 itself.

```
Input: [1,2,3]

Output: [1,2,4]

Explanation: The array represents the integer 123.
```

```
Input: [4,3,2,1]

Output: [4,3,2,2]

Explanation: The array represents the integer 4321.
```
*/

class Solution {
    func plusOne(_ digits: [Int]) -> [Int] {
		var result = [Int]()
		result.reserveCapacity(digits.count)

		var accumulator = 1
		let index = (initial: digits.count - 1, final: -1, step: -1)

		for idx in stride(from: index.initial, to: index.final, by: index.step) {
			let num = digits[idx] + accumulator
			accumulator = num / 10
			result.append(num % 10)
		}

		if accumulator != 0 {
			result.append(accumulator)
		}

		return result.reversed()
    }
}

let solver = Solution()
solver.plusOne([1,2,3])
solver.plusOne([4,3,2,1])
solver.plusOne([0])
solver.plusOne([9])
solver.plusOne([9, 9])
