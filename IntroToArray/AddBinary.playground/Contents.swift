/*:

# Add Binary

Given two binary strings, return their sum (also a binary string).

The input strings are both non-empty and contains only characters 1 or 0.

```
Input: a = "11", b = "1"

Output: "100"
```

```
Input: a = "1010", b = "1011"

Output: "10101"
```
*/

class Solution {
    func addBinary(_ a: String, _ b: String) -> String {
		var result = ""
		var accumulator = 0

		let nums = (first: Array(a), second: Array(b))
		var indexies = (first: nums.first.count - 1, second: nums.second.count - 1)

		while indexies.first >= 0 || indexies.second >= 0 {
			let digits = (first: indexies.first >= 0 ? nums.first[indexies.first].wholeNumberValue! : 0,
						  second: indexies.second >= 0 ? nums.second[indexies.second].wholeNumberValue! : 0)

			let num = digits.first + digits.second + accumulator
			accumulator = num / 2
			result.append(String(num % 2))

			indexies.first -= 1
			indexies.second -= 1
		}

		if accumulator != 0 {
			result.append(String(accumulator))
		}

		return String(result.reversed())
    }
}

let solver = Solution()
solver.addBinary("0", "1")
solver.addBinary("11", "1")
solver.addBinary("1010", "1011")


