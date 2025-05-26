class LoginPage < SitePrism::Page
    set_url '/login/'
    element :emailField, :id, "username"
    element :passwordField, :id, "password"
    element :loginButton, :xpath, "//button[@type='submit']"

    def userLogin(email, password)
        emailField.set (email)
        passwordField.set(password)
        loginButton.click
    end    
end


# "//button[@class='btn__primary--large from__button--floating']"