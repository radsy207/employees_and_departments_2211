class Employee
  attr_reader :name, :age, :salary

  def initialize(info)
    @name = info[:name]
    @age = info[:age].to_i
    @salary = info[:salary].delete("$").to_i
  end

  def give_raise(num)
    @salary += num
  end
end