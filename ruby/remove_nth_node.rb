# Definition for singly-linked list.
class ListNode
    attr_accessor :val, :next
    def initialize(val = 0, _next = nil)
        @val = val
        @next = _next
    end

    def print
      if self.next
        self.val.to_s + ", " + self.next.print
      else
        self.val.to_s
      end
    end
end

# @param {ListNode} head
# @param {Integer} n
# @return {ListNode}
# This should work, but leetcode.com throws an error (q.first is nil? but yet it prints it out fine)
# def remove_nth_from_end(head, n)
#   q = []
#   temp = head
#   while temp.next do
#     q.push temp
#     q.shift if q.length > n
#     temp = temp.next
#   end
#   return head.next if q.length < n
#   q.first.next = q.first.next.next unless q.first.next.nil?
#   return head
# end

def remove_nth_from_end(head, n)
  first = head
  last = head
  n.times do
    last = last.next
  end
  return head.next if last.nil? # if linked list's length is n (avoid single node error)
  while last.next do
    first = first.next
    last = last.next
  end
  first.next = first.next.next
  head
end

# head = ListNode.new(1, ListNode.new(2, ListNode.new(3, ListNode.new(4, ListNode.new(5)))))
# puts remove_nth_from_end(head, 2).print

head = ListNode.new(1)
puts remove_nth_from_end(head, 1).print