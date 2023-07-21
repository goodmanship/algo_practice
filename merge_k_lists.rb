# Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val = 0, _next = nil)
#         @val = val
#         @next = _next
#     end
# end
# @param {ListNode[]} lists
# @return {ListNode}

def min_list_with_index(lists)
  min_list = lists.first
  min_index = 0

  lists.each_with_index do |l, i|
    if l.val < min_list.val
      min_list = l
      min_index = i
    end
  end

  return [min_list, min_index]
end

def merge_k_lists(lists)
  lists.compact!
  return [] if lists.nil? || lists.length == 0

  min_list, min_index = min_list_with_index(lists)
  new_list = min_list
  temp_list = new_list

  lists[min_index] = lists[min_index].next
  lists.compact!

  while lists && lists.length > 0 do
    min_list, min_index = min_list_with_index(lists)
    temp_list.next = min_list
    temp_list = temp_list.next
    lists[min_index] = lists[min_index].next
    lists.compact!
  end

  return new_list
end

puts merge_k_lists([])