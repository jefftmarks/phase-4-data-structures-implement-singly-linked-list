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
		node.next_node = self.head
		self.head = node
	end

	def delete_head
		if self.head.nil?
			return
		else
			self.head = self.head.next_node
		end
	end

	def delete_tail
		if self.head.nil?
			return
		elsif !self.head.next_node
			self.head = nil
			return
		end
			
		last_node = self.head
		while last_node.next_node
			last_node = last_node.next_node
		end

		last_node.next_node = nil
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