/*:

# Design Circular Queue

Design your implementation of the circular queue. The circular queue is a linear data structure in which the operations are performed based on FIFO (First In First Out) principle and the last position is connected back to the first position to make a circle. It is also called "Ring Buffer".

One of the benefits of the circular queue is that we can make use of the spaces in front of the queue. In a normal queue, once the queue becomes full, we cannot insert the next element even if there is a space in front of the queue. But using the circular queue, we can use the space to store new values.

**Your implementation should support following operations:**

- MyCircularQueue(k): Constructor, set the size of the queue to be k.
- Front: Get the front item from the queue. If the queue is empty, return -1.
- Rear: Get the last item from the queue. If the queue is empty, return -1.
- enQueue(value): Insert an element into the circular queue. Return true if the operation is successful.
- deQueue(): Delete an element from the circular queue. Return true if the operation is successful.
- isEmpty(): Checks whether the circular queue is empty or not.
- isFull(): Checks whether the circular queue is full or not.

```
MyCircularQueue circularQueue = new MyCircularQueue(3); // set the size to be 3
circularQueue.enQueue(1);  // return true
circularQueue.enQueue(2);  // return true
circularQueue.enQueue(3);  // return true
circularQueue.enQueue(4);  // return false, the queue is full
circularQueue.Rear();  // return 3
circularQueue.isFull();  // return true
circularQueue.deQueue();  // return true
circularQueue.enQueue(4);  // return true
circularQueue.Rear();  // return 4
```
**Note:**

- All values will be in the range of [0, 1000].
- The number of operations will be in the range of [1, 1000].
- Please do not use the built-in Queue library.
*/


class MyCircularQueue: CustomStringConvertible {

	private var storage: [Int]
	private var head = 0, tail = 0

	private let maxSize: Int
	private var size: Int = 0

    /** Initialize your data structure here. Set the size of the queue to be k. */
    init(_ k: Int) {
		storage = Array(repeating: 0, count: k)
		maxSize = k
    }

    /** Insert an element into the circular queue. Return true if the operation is successful. */
    func enQueue(_ value: Int) -> Bool {
		guard !isFull() else { return false }

		if !isEmpty() {
			tail = (tail + 1) % maxSize
		}
		storage[tail] = value
		size += 1

		return true
    }

    /** Delete an element from the circular queue. Return true if the operation is successful. */
    func deQueue() -> Bool {
		guard !isEmpty() else { return false }

		size -= 1

		if !isEmpty() {
			head = (head + 1) % maxSize
		}

		return true
    }

    /** Get the front item from the queue. */
    func Front() -> Int {
		return isEmpty() ? -1 : storage[head]
    }

    /** Get the last item from the queue. */
    func Rear() -> Int {
		return isEmpty() ? -1 : storage[tail]
    }

    /** Checks whether the circular queue is empty or not. */
    func isEmpty() -> Bool {
		return size == 0
    }

    /** Checks whether the circular queue is full or not. */
    func isFull() -> Bool {
		return size == maxSize
    }

	var description: String {
		return "storage: \(storage); front: \(Front()); tail: \(Rear())"
	}
}

/**
 * Your MyCircularQueue object will be instantiated and called as such:
*/
let obj = MyCircularQueue(3)
obj.Front()
//obj.enQueue(17)
//obj.Front()
//obj.Rear()
//obj.isEmpty()
//obj.isFull()
//
//obj.deQueue()
//obj.Front()
//obj.Rear()
//obj.isEmpty()
//obj.isFull()

obj.enQueue(1)
obj

obj.enQueue(2)
obj

obj.enQueue(3)
obj

obj.enQueue(4)
obj

obj.Front()
obj.Rear()
obj.isEmpty()
obj.isFull()

obj.deQueue()
obj

obj.deQueue()
obj

obj.deQueue()
obj

obj.deQueue()
obj

obj.enQueue(5)
obj

obj.enQueue(6)
obj

obj.deQueue()
obj

obj.isEmpty()


//1 % 3
//2 % 3
//3 % 3
//
//let one: Int? = 1
//let two: Int? = 2
//let three: Int? = 3
//
//one ?? 1 % 3
//two ?? 2 % 3
//three! % 3
