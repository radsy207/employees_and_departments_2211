require './lib/employee'
require './lib/department'
require './lib/budget'

RSpec.describe Budget do
  let(:customer_service) {Department.new("Customer Service")}
  let(:sales) {Department.new("Sales")}
  let(:fire) {Department.new("Fire")}
  let(:bobbi) {Employee.new({name: "Bobbi Jaeger", age: "30", salary: "$100000"})}
  let(:aaron) {Employee.new({name: "Aaron Tanaka", age: "25", salary: "90000"})}
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
end