#read from file or stdin
class Shortestpath

  @name =  attr_accessor :name
  attr_accessor :teste
  def initialize(*args)
    @name = "asdffff"
  end
end

def entrada(*args) (ARGV[0] ? File.read(ARGV[0]) : $stdin.read ).split("\n") end

teste = entrada

a = Shortestpath.new()

# a.name = 'teste'
# a.name = 'asdf'

p a.name
