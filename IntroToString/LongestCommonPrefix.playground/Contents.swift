/*:

# Longest Common Prefix

Write a function to find the longest common prefix string amongst an array of strings.

If there is no common prefix, return an empty string "".

```
Input: ["flower","flow","flight"]

Output: "fl"
```

```
Input: ["dog","racecar","car"]

Output: ""

Explanation: There is no common prefix among the input strings.
```
**Note:**

All given inputs are in lowercase letters a-z.
*/

class Solution {
    func longestCommonPrefix(_ strs: [String]) -> String {
		guard !strs.isEmpty else { return "" }

		let template = strs.first!
		var prefix = ""

		for letter in template {
			prefix.append(letter)

			for idx in 0..<strs.count {
				let string = strs[idx]
				if !string.hasPrefix(prefix) {
					return String(prefix.dropLast())
				}
			}
		}

		return prefix
    }


}

let solver = Solution()
solver.longestCommonPrefix(["flower","flow","flight"])
solver.longestCommonPrefix(["dog","racecar","car"])
solver.longestCommonPrefix([""])
solver.longestCommonPrefix(["a"])
