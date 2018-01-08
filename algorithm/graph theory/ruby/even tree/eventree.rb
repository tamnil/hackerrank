#read from file
input = (ARGV[0] == nil ? $stdin.read : File.read(ARGV[0])).split("\n")
class EvenTree
  attr_accessor :input
  def initialize(input)
    @input = input.clone
    @x = @input.pop
    p input
    p @x
    p 'teste'
  end
  #def input
  #    return @input
  #end

  def entrada(*args)

    return (ARGV[0] == nil ? $stdin.read : File.read(ARGV[0])).split("\n")

  end
end

p 'asd'

eventree = EvenTree.new(input)
# processa a linha:
p teste.input
p input