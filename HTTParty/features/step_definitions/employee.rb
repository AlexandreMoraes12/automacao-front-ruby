# GET

Dado('que o usuario consulte informacoes de Funcionarios') do
  @getlist = Employee_Requests.new
end

Quando('ele realizar a pesquisa') do
  @list_employee = @getlist.find_employee
end

Entao('uma lista de Funcionarios deve retornar') do
    expect(@list_employee.code).to eql 200
    expect(@list_employee.message).to eql 'OK'
end

# POST

Dado('que usuario cadastre um novo Funcionario') do
    @create = Employee_Requests.new
    @assert = Assertions.new
end

Quando('ele enviar as informacoes do Funcionario') do
    @create_employee = @create.create_employee(DATABASE[:name][:name1],DATABASE[:salary][:salary1],DATABASE[:age][:age1])
    puts @create_employee
end

Entao('esse Funcionario sera cadastrado') do
  @assert.request_success(@create_employee.code, @create_employee.message)
  expect( @create_employee["status"]).to eql 'success'
  expect(@create_employee["message"]).to eql 'Successfully! Record has been added.'
  expect( @create_employee['data']["employee_name"]).to eql DATABASE[:name][:name1]
  expect(@create_employee['data']["employee_salary"]).to eql DATABASE[:salary][:salary1]
  expect(@create_employee['data']["employee_age"]).to eql DATABASE[:age][:age1]
    
end

# PUT

Dado('que o usuario altere um informacao de Funcionario') do
    @request = Employee_Requests.new
end

Quando('ele enviar as novas informacoes') do
 @update_employee = @request.update_employee(@request.find_employee['data'][0]['id'], 'Alberto', 100, 40)
 puts @update_employee
end

Entao('as informacoes foram alteradas') do
  expect(@update_employee.code).to eql(200)
  expect(@update_employee.msg).to eql 'OK'
  expect(@update_employee['data']["employee_salary"]).to eql (100)
end


# DELETE

Dado('que o usuario queira deletar um Funcionario') do
  @request = Employee_Requests.new
end

Quando('ele enviar a identificao unica') do
  @del_employee = @request.delete_employee(@request.find_employee['data'][0]['id'])
end

Entao('esse Funcionario sera deletado do sistema') do
  expect(@del_employee.code).to eql(200)
  expect(@del_employee.msg).to eql 'OK'
  expect(@del_employee["status"]).to eql 'success'
  expect(@del_employee["data"]).to eql '27'
  expect(@del_employee["message"]).to eql 'Successfully! Record has been deleted'
end
