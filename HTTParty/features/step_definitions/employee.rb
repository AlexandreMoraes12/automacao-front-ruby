
Dado('que o usuario consulte informacoes de Funcionarios') do
  @get_url=HTTParty.get('http://dummy.restapiexample.com/api/v1/employees')
end

Quando('ele realizar a pesquisa') do
  @list_employee = @get_url
end

Entao('uma lista de Funcionarios deve retornar') do
    expect(@list_employee.code).to eql 204
    expect(@list_employee.message).to eql 'OK'
end

Dado('que usuario cadastre um novo Funcionario') do
    @post_url='http://dummy.restapiexample.com/api/v1/create'
end

Quando('ele enviar as informacoes do Funcionario') do
    @create_employee = HTTParty.post(@post_url, :headers =>{'Content_Type':'application/json'}, body: {
        "id": 27,
        "employee_name": "tonny",
        "employee_salary": 420800,
        "employee_age": 30,
        "profile_image": ""
}.to_json)

puts @create_employee
end

Entao('esse Funcionario sera cadastrado') do
  expect( @create_employee.code).to eql(200)
  expect( @create_employee.msg ).to eql 'OK'
  expect( @create_employee["status"]).to eql 'success'
  expect(@create_employee["message"]).to eql 'Successfully! Record has been added.'
  expect( @create_employee['data']["employee_name"]).to eql 'hell'
  expect(@create_employee['data']["employee_salary"]).to eql (420800)
  expect(@create_employee['data']["employee_age"]).to eql(38)
    
end

Dado('que o usuario altere um informacao de Funcionario') do
    @get_employee =HTTParty.get('http://dummy.restapiexample.com/api/v1/employees', :headers=>{'Content-Type': 'application/json'})
    puts @get_employee['data'][0]['id']
    @put_url = 'http://dummy.restapiexample.com/api/v1/update/' + @get_employee['data'][0]['id'].to_s
end

Quando('ele enviar as novas informacoes') do
  @update_employee = HTTParty.put(@put_url, :headers=>{'Content-Type': 'application/json'}, body:{
        "employee_name": "Alberto",
        "employee_salary": 100,
        "employee_age": 40,
        "profile_image": ""
}.to_json)
puts(@update_employee)
end

Entao('as informacoes foram alteradas') do
  expect(@update_employee.code).to eql(200)
  expect(@update_employee.msg).to eql 'OK'
  expect(@update_employee['data']["employee_salary"]).to eql (100)
end