#read from file or stdin


def entrada(*args) (ARGV[0] ? File.read(ARGV[0]) : $stdin.read ).split("\n") end 
class Array

  def get_column(c)
    self.transpose[c]
  end


end

class Route
  def initialize(arr)
    # arr = entrada().to_a
    @n,@k = arr.shift.split(" ").map(&:to_i)
    @mail = arr.shift.split(" ").map(&:to_s)
    @data = arr.map{ |x| x.split(" ")}

  end
  def merge_linear_pairs (index,arr)
    ret_arr = []
    arr.each_with_index do |x,i|

      if x[0] == index || x[1] == index
        ret_arr << x
        arr[i] = nil
      end
    end
    arr.compact!
    ret_arr_t = ret_arr.transpose
    #get sum of weights
    if ret_arr_t != []
      w = ret_arr_t.pop.map(&:to_i).inject(:+)
      newarr = ret_arr_t.flatten.uniq - [index] + [w]
      arr << newarr
    end
    arr
  end

  def get_distance(data,mail,nolinear)
    p data
    p mail
    arr = []
    data.each do |x|
      arr << x[0]
      arr << x[1]
    end
    # p data,"data", mail
    arr = arr.flatten.uniq - mail
    # p arr,"array"
    arr = arr - nolinear
    # p arr
    arr.each  do |x|
      data.map! do |y|
        p y
        if x == y[0] || x == y[1]
          y = "" 
        end
        y
      end
    end
    data.compact!
    p data

# masnipulate data for shortest path


    sum = 0
    data.each do |x|
      sum += x[2].to_i


    end
    return  sum 
  end
  def not_in_mail
    data = @data
    t_data = data.transpose
    t_data.pop
    data = t_data.flatten.sort.uniq - @mail
    data

  end
  def last_elements

    data = @data
    t_data = data.transpose
    t_data.pop
    data_tmp_uniq = t_data.flatten.sort.uniq
    data_tmp = t_data.flatten
    ret_elements = []
    data_tmp_uniq.each do |x|
      if data_tmp.count(x) == 1 # || data_tmp.count(x) > 2
        ret_elements << x
      end


    end
    ret_elements

  end
def nolinear_elements

    data = @data
    t_data = data.transpose
    t_data.pop
    data_tmp_uniq = t_data.flatten.sort.uniq
    data_tmp = t_data.flatten
    ret_elements = []
    data_tmp_uniq.each do |x|
      if data_tmp.count(x) >= 2
        ret_elements << x
      end


    end
    ret_elements


end


  def show
    data = @data.dup
    compress_list = not_in_mail - last_elements - ["2"]
    # p compress_list
    # p last_elements
    #get linear paths: e = 2
    if compress_list != []
      compress_list.each do |x|
        data1 = merge_linear_pairs(x,data)
      end
    end
    puts   get_distance(data,@mail, nolinear_elements)

  end

end
teste = Route.new(entrada)
teste.show
