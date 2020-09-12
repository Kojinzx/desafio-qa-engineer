Dado("que eu realize o cadastro de um usuario na API") do
    @response = ApiAuthPage.new.registerNewUser()
end

Então("valido o cadastro do usuario") do
    ApiAuthPage.new.validateRegisterUser(@response)
end

Dado("que eu pegue as informacoes do usuario criado") do
    @response = ApiAuthPage.new.authenticateUser()
end

Então("eu faco a autenticacao e valido") do
    ApiAuthPage.new.validateAuthenticatorUser(@response)
end