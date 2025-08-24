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
# too slow
# def min_list_with_index(lists)
#   min_list = lists.first
#   min_index = 0

#   lists.each_with_index do |l, i|
#     if l.val < min_list.val
#       min_list = l
#       min_index = i
#     end
#   end

#   return [min_list, min_index]
# end

# def merge_k_lists(lists)
#   lists.compact!
#   return [] if lists.nil? || lists.length == 0

#   min_list, min_index = min_list_with_index(lists)
#   new_list = min_list
#   temp_list = new_list

#   lists[min_index] = lists[min_index].next
#   lists.compact!

#   while lists && lists.length > 0 do
#     min_list, min_index = min_list_with_index(lists)
#     temp_list.next = min_list
#     temp_list = temp_list.next
#     lists[min_index] = lists[min_index].next
#     lists.compact!
#   end

#   return new_list
# end

def merge_k_lists(lists)
  # Prepare answer list
  head = ListNode.new
  tail = head
  
  # Remove empty list first
  lists.delete_if { |list| list.nil? }
  
  # Sort list from min to max
  lists.sort_by! { |list| list.val }
  
  while !lists.empty?
    # Get min node from left of array
    min_node = lists.shift
    
    # Add to answer list
    tail.next = min_node
    tail = tail.next
    
    # Prepare next node
    new_list = min_node.next
    next if new_list.nil?

    # Want to insert next node into sorted array at correct index to keep it still a sorted array
    # Then we can still shift min node from left in next run
    # Using bsearch on a sorted array is very fast
    insert_at = lists.bsearch_index { |list| list.val >= new_list.val }
    if insert_at.nil?
      lists.push(new_list)
    else
      lists.insert(insert_at, new_list)
    end
  end
  
  head.next
end
