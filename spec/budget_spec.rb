require './lib/employee'
require './lib/department'
require './lib/budget'

RSpec.describe Budget do
  let(:customer_service) {Department.new("Customer Service")}
  let(:bobbi) {Employee.new({name: "Bobbi Jaeger", age: "30", salary: "$100000"})}
  let(:aaron) {Employee.new({name: "Aaron Tanaka", age: "25", salary: "90000"})}
  let(:budget1) {Budget.new("2023")}

  describe '#initialize' do
    it 'exists' do
      
      expect(budget1).to be_a(Budget)
    end
  end
end