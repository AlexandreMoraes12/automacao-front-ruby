
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