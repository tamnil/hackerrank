#read from file or stdin


def entrada(*args) (ARGV[0] ? File.read(ARGV[0]) : $stdin.read ).split("\n") end 

arr = entrada()
n,k = arr.shift.split(" ").map(&:to_i)
mail = arr.shift.split(" ").map(&:to_i)
arr.map!{ |x| x.split(" ").map(&:to_i)}
house_arr = Hash.new()
houses = arr.flatten.uniq.sort
houses.each do |house|
  house_arr[house.to_s] =  10**4


end

house_arr[mail[0].to_s] = 0  #start point

houses.each do |house|
  num = arr.select{ |x| x[0] == house}
  num.each do |path|
    if (path[2] + house_arr[path[0].to_s]) <  house_arr[path[1].to_s] 
      house_arr[path[1].to_s]   = path[2] + house_arr[path[0].to_s]
    end
  end

end




count = 0
puts house_arr
mail.each do |x|
  count += house_arr[x.to_s]

end
puts count
