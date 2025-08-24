# Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val = 0, _next = nil)
#         @val = val
#         @next = _next
#     end
# end
# @param {ListNode} head
# @return {ListNode}
def swap_pairs(head)
  new_tail = head
  return head if new_tail.nil?

  new_head = head.next
  return head if new_head.nil?

  next_node = head.next.next
  
  new_head.next = new_tail
  new_tail.next = next_node

  while next_node do
    # name the nodes
    one = new_tail
    two = next_node
    three = next_node.next
    return new_head if three.nil? # there is no node to swap with
    four = three.next

    # do the swap
    one.next = three
    three.next = two
    two.next = four

    # move on
    new_tail = two
    next_node = four # might be nil
  end
  new_head
end