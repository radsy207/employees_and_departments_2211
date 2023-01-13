require './lib/employee'
require './lib/department'

RSpec.describe Department do
  let(:customer_service) {Department.new("Customer Service")}
  let(:bobbi) {Employee.new({name: "Bobbi Jaeger", age: "30", salary: "$100000"})}
  
  
  describe '#initialize' do
    it 'exists' do
      expect(customer_service).to be_a(Department)
    end
  end
end