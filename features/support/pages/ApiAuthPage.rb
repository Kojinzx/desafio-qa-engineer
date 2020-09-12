class ApiAuthPage
    include HTTParty

    def registerNewUser

        $name = Faker::Name.name
        $email = Faker::Internet.email
        $password = Faker::Games::Pokemon.name

        @body = {
            "name": $name,
            "email": $email,
            "password": $password
        }.to_json
        
        registerUser = HTTParty.post 'http://54.207.100.192/auth/register',
            :body => @body,
            :headers => {
                "Content-Type" => 'application/json'
            }

    end

    def validateRegisterUser(response)
        assert_equal(200, response.code)

        $token = response["token"]
        $id = response["user"]["_id"]
    end

    def authenticateUser
        @body = {
            "email": $email,
            "password": $password
        }.to_json

        authenticatorUser = HTTParty.post 'http://54.207.100.192/auth/authenticate',
            :body => @body,
            :headers => {
                "Content-Type" => 'application/json'
            }
    end

    def validateAuthenticatorUser(response)
        assert_equal(200, response.code)
    end

end