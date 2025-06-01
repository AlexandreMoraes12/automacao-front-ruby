# language: pt

Funcionalidade: Pesquisar Funcionarios
    para averiguar informacoes
    o usuario do sistema 
    deseja poder consultar informacoes dos Funcionarios

Cenario: Bucar informacoes Funcionarios
    Dado que o usuario consulte informacoes de Funcionarios
    Quando ele realizar a pesquisa
    Entao uma lista de Funcionarios deve retornar    

 @c2
 Cenario: cadastrar Funcionarios
    Dado que usuario cadastre um novo Funcionario
    Quando ele enviar as informacoes do Funcionario
    Entao esse Funcionario sera cadastrado   

@c3
Cenario: Alterar informacoes cadstrais
Dado que o usuario altere um informacao de Funcionario
Quando ele enviar as novas informacoes
Entao as informacoes foram alteradas
