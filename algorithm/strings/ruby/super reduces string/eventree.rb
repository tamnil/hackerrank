#read from file or stdin
def string_match(string)

  sub_reg = /(\w)\1/

  string.gsub!(sub_reg,'')
  if sub_reg.match(string)
    string_match(string)
  end
  string

end


def entrada(*args) (ARGV[0] ? File.read(ARGV[0]) : $stdin.read ).split("\n") end 

string = entrada[0]

string = string_match(string)
if string == ""
  string = "Empty String"
end

puts string



