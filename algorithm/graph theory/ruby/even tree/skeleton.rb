#read from file or stdin
def entrada(*args) (ARGV[0] ? File.read(ARGV[0]) : $stdin.read ).split("\n") end 
# processa a linha:
teste = entrada
m,n = teste.shift.split("").map(&:to_i)

p m

