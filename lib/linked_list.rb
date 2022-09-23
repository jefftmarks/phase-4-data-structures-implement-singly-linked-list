require_relative './node'
require "pry"

class LinkedList
	attr_accessor :head

	def initialize
		@head = nil
	end

	def append(node)
		if self.head.nil?
			self.head = node
			return
		end

		last_node = self.head
		while last_node.next_node
			last_node = last_node.next_node
		end

		last_node.next_node = node
	end

	def prepend(node)
		if self.head.nil?
			self.head = node
		else
			node.next_node = self.head
			self.head = node
		end
	end

	def delete_head
		if self.head.nil?
			return
		elsif !self.head.next_node
			self.head = nil
		else
			self.head = self.head.next_node
		end
	end

	def delete_tail
		if self.head.nil?
			return
		elsif !self.head.next_node
			self.head = nil
		else
			
			second_to_last = self.head
			while second_to_last.next_node.next_node
				second_to_last = second_to_last.next_node
			end

			second_to_last.next_node = nil
		end
	end

	def add_after(index, node)
		count = 0

		target_node = self.head

		while count < index
			if target_node.next_node
				target_node = target_node.next_node
				count =+ 1
			else
				self.append(node)
				return
			end
		end

		node.next_node = target_node.next_node
		target_node.next_node = node

	end

	def search(value)
		current_node = self.head
		until current_node.next_node.data == value
			current_node = current_node.next_node
		end

		current_node.next_node
	end

end