require './lib/employee'
require './lib/department'
require './lib/budget'

RSpec.describe Budget do
  let(:customer_service) {Department.new("Customer Service")}
  let(:sales) {Department.new("Sales")}
  let(:fire) {Department.new("Fire")}
  let(:bobbi) {Employee.new({name: "Bobbi Jaeger", age: "30", salary: "$100000"})}
  let(:aaron) {Employee.new({name: "Aaron Tanaka", age: "25", salary: "$90000"})}
  let(:billy) {Employee.new({name: "Billy Bob", age: "30", salary: "$100000"})}
  let(:budget1) {Budget.new("2023")}

  describe '#initialize' do
    it 'exists' do
      expect(budget1).to be_a(Budget)
    end

    it 'has readable attributes' do
      expect(budget1.year).to eq("2023")
      expect(budget1.departments).to eq([])
    end
  end

  describe "#add_department" do
    it 'adds a department to its departments array' do
      budget1.add_department(customer_service)
      budget1.add_department(sales)

      expect(budget1.departments).to match([customer_service, sales])
    end
  end

  describe '#list_departments' do
    it 'lists departments that a budget has' do
      budget1.add_department(customer_service)
      budget1.add_department(sales)
      budget1.add_department(fire)

      expect(budget1.list_departments).to match([customer_service, sales, fire])
    end
  end

  describe '#list_low_expense' do
    it 'lists departments that a budget has' do
      budget1.add_department(customer_service)
      budget1.add_department(sales)
      budget1.add_department(fire)
      customer_service.expense(600)

      expect(customer_service.expenses).to eq(600)
      sales.expense(400)
      fire.expense(201)

      expect(budget1.list_low_expense).to eq([sales, fire])
    end
  end

  describe '#salaries_by_employee' do
    it 'creates a hash with employee names as keys and salary as values' do
      budget1.add_department(customer_service)
      budget1.add_department(sales)
      customer_service.hire(bobbi)
      customer_service.hire(aaron)
      sales.hire(billy)
      expected = { "Bobbi Jaeger" => 100000, "Aaron Tanaka" => 90000, "Billy Bob" => 100000
      }

      expect(budget1.salaries_by_employee).to eq(expected)
    end
  end
end