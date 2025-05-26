Dado('que loguei') do
    login.load
    
end
  
Quando('eu logar') do
   login.userLogin(CREDENTIAL[:user][:email], CREDENTIAL[:user][:password])
   
end
  
Entao('logaremos') do
 home.checkLoginSuccessful
 recover.sendEmail
   
end