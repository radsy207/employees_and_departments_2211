class Budget
  attr_reader :year, :departments

  def initialize(year)
    @year = year
    @departments = []
  end

  def add_department(department)
    @departments << department
  end

  def list_departments
    @departments.map do |department|
      # require 'pry'; binding.pry
      department
    end
  end

  def list_low_expense
    # low_expense_arr = []
    @departments.map do |department|
      # require 'pry'; binding.pry
      if department.expenses < 500
        department
      end
    end.compact
  end
end