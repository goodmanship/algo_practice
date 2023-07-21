# @param {Integer} n
# @return {String[]}

# open = current number of open parens
# total = total number of pairs
def gpr(opn, cls, tot)
  if tot == opn && opn == cls
    return [""] # we're done
  elsif tot == opn
    return gpr(opn, cls + 1, tot).map{|p| ")" + p}
  elsif cls == opn
    return gpr(opn + 1, cls, tot).map{|p| "(" + p}
  else
    return gpr(opn + 1, cls, tot).map{|p| "(" + p} + gpr(opn, cls + 1, tot).map{|p| ")" + p}
  end
end

def generate_parenthesis(n)
  gpr(0, 0, n).flatten
end

puts "#{generate_parenthesis(3)}"
