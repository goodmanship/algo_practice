# Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val = 0, _next = nil)
#         @val = val
#         @next = _next
#     end
# end
# @param {ListNode} head
# @param {Integer} k
# @return {ListNode}
def reverse_k_group(head, k)
  k_stack = []
  temp = head

  # do initial reversal outside of loop
  # because there is no parent node
  while k_stack.length < k do
    puts "first loop #{temp.val}"
    k_stack.push temp
    temp = temp.next
  end

  next_node = temp

  last_node = k_stack.pop
  while k_stack.length > 0 do
    temp = k_stack.pop
    last_node.next = temp
    last_node = temp
    puts "second loop #{temp.val}"
  end

  # continue to reverse until there are no more dudes
  while next_node do
    while next_node && k_stack.length < k do
      puts "third loop #{next_node.val}"
      k_stack.push next_node
      next_node = next_node.next
    end

    puts "k_stack length #{k_stack.length} < #{k}"
    return head if k_stack.length < k

    while k_stack.length > 0 do
      temp = k_stack.pop
      puts "fourth loop #{temp.val}"
      last_node.next = temp
      last_node = temp
    end
  end
  head
end
# time limit exceeded - maybe it means i used too much memory?