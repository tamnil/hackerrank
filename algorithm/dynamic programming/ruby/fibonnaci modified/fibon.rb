#read from file or stdin
def entrada(*args) (ARGV[0] ? File.read(ARGV[0]) : $stdin.read ).split("\n") end 

def fibon(t1,t2,n,counter = 3)
if n > counter
return fibon(t2,t1 + t2 ** 2,n, counter+1)
else
  return t1+ t2 ** 2
end

end

t1,t2,n = entrada[0].split.map(&:to_i)

puts fibon(t1,t2,n)


