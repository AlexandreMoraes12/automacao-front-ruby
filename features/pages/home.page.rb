class HomePage < SitePrism::Page
    element :userName, :xpath,"//div[@class='display-flex mt1']"
    element :navBarHome, :id, "ember169"
    element :myIcon, :id, "ember31"
    

    def checkLoginSuccessful
        expect(userName.text).to eql "ALEXANDRE DE MORAES FURTADO"
        expect(navBarHome.text).to eql "inicio"
        expect(myIcon.text).to eql "eu"
    end    

end    