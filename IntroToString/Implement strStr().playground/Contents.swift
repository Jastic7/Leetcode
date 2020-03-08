/*:

# Implement strStr()

Implement strStr().

Return the index of the first occurrence of needle in haystack, or -1 if needle is not part of haystack.

```
Input: haystack = "hello", needle = "ll"

Output: 2
```

```
Input: haystack = "aaaaa", needle = "bba"

Output: -1
```
**Clarification:**

What should we return when needle is an empty string? This is a great question to ask during an interview.

For the purpose of this problem, we will return 0 when needle is an empty string. This is consistent to C's strstr() and Java's indexOf().
*/

class Solution {

	/// This solution uses KMP algorithm with complexity **O(n+m)**, where n - length of `haystack` string and m - length of `needle` string.
	/// - Parameters:
	///   - haystack: Basic string.
	///   - needle: Searching template substring.
    func strStr(_ haystack: String, _ needle: String) -> Int {
		if needle.isEmpty { return 0 }
		guard needle.count <= haystack.count else { return -1 }

		let text = Array(haystack)
		var pattern = Array(needle)
		let prefixTable = self.prefixTable(for: &pattern)

		var hayStackIdx = 0
		var needleIdx = 0

		while hayStackIdx < text.count && needleIdx < pattern.count {
			if text[hayStackIdx] == pattern[needleIdx] {
				needleIdx += 1
				hayStackIdx += 1
			} else if needleIdx == 0 {
				hayStackIdx += 1
			} else {
				needleIdx = prefixTable[needleIdx - 1]
			}
		}

		let isFound = needleIdx == pattern.count
		return isFound ? hayStackIdx - needleIdx : -1
    }

	/// Builds table with lengths of the largest suffixes which at the same time are prefixes.
	/// - Parameter word: Analyzing string.
	@inlinable
	final func prefixTable(for word: inout [String.Element]) -> [Int] {
		var prefix = 0
		var suffix = 1
		var table = Array(repeating: 0, count: word.count)

		while suffix < word.count {
			if word[prefix] == word[suffix] {
				table[suffix] = prefix + 1

				prefix += 1
				suffix += 1
			} else if prefix == 0 {
				suffix += 1
			} else {
				prefix -= 1
				prefix = table[prefix]
			}
		}

		return table
	}
}

let solver = Solution()
solver.strStr("a", "a")
solver.strStr("Hello", "ll")
solver.strStr("aaaaa", "bba")
solver.strStr("mississippi", "pi")
solver.strStr("mississippi", "issipi")
solver.strStr("mississippi", "issip")
solver.strStr("aaaa", "baaa")
