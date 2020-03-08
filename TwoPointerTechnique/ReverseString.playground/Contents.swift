/*:

# Reverse String

Write a function that reverses a string. The input string is given as an array of characters char[].

Do not allocate extra space for another array, you must do this by modifying the input array in-place with O(1) extra memory.

You may assume all the characters consist of printable ascii characters.

```
Input: ["h","e","l","l","o"]

Output: ["o","l","l","e","h"]
```

```
Input: ["H","a","n","n","a","h"]

Output: ["h","a","n","n","a","H"]
```
*/

class Solution {
    func reverseString(_ s: inout [Character]) {
		var i = 0
		var j = s.count - 1
		while i < j {
			s.swapAt(i, j)
			i += 1
			j -= 1
		}
    }
}

let solver = Solution()
var s1: [Character] = ["h","e","l","l","o"]
solver.reverseString(&s1)
