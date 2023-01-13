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
    @departments.map do |department|
      if department.expenses < 500
        department
      end
    end.compact
  end


  def salaries_by_employee
		salary_hash = {}
		@departments.each do |department|
			department.employees.each do |employee|
				salary_hash[employee.name] = employee.salary			
			end
		end
		salary_hash
	end
end