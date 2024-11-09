# Define the Queue class to manage a collection of items in a first-in, first-out (FIFO) order
class_name MyQueue

# Initialize the queue as an empty array
var queue = []

# Adds (enqueues) an item to the end of the queue
func enqueue(item):
	self.queue.append(item)


# Removes (dequeues) and returns the item at the front of the queue
func dequeue():
	if not self.queue.is_empty():
		return self.queue.pop_front()
	return null


# Returns the item at the front of the queue without removing it
func peek():
	if not self.queue.is_empty():
		return self.queue[0]
	return null


# Checks if the queue is empty
func is_empty():
	return self.queue.size() == 0


func _to_string():
	return self.queue
