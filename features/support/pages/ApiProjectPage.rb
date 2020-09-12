class ApiProjectPage
    include HTTParty

    def createNewProject
        @body = {
            "title": Faker::Artist.name,
            "description": Faker::Games::LeagueOfLegends.quote,
            "tasks": [
                {
                    "name": Faker::Name.name,
                    "assignedTo": $id
                }
        ]
        }.to_json

        
        createProject = HTTParty.post 'http://54.207.100.192/projects',
            :body => @body,
            :headers => {
                "Authorization" => ['Bearer ', $token].join(""),
                "Content-Type" => 'application/json'
            }
    end

    def validateNewProject(response)
        assert_equal(200, response.code)

        $id = response["project"]["_id"]
    end

    def getAllProjects
        getAllProjects = HTTParty.get 'http://54.207.100.192/projects',
        :headers => {
            "Authorization" => ['Bearer ', $token].join(""),
            "Content-Type" => 'application/json'
        }
    end

    def validateAllProjects(response)
        allProjects = response["projects"].length

        assert_equal(200, response.code)

        (0..allProjects-1).each do |project|

            taskLength = getAllProjects["projects"][project]["tasks"].length

            (0..taskLength-1).each do |task|
                taskId = getAllProjects["projects"][project]["tasks"][task]["_id"]
                taskName = getAllProjects["projects"][project]["tasks"][task]["name"]
                taskAssignedTo = getAllProjects["projects"][project]["tasks"][task]["assignedTo"]
                taskProject = getAllProjects["projects"][project]["tasks"][task]["project"]
                taskCreated = getAllProjects["projects"][project]["tasks"][task]["createdAt"]

                assert_equal(true, taskId.instance_of?(String))
                assert_equal(true, taskName.instance_of?(String))
                assert_equal(true, taskAssignedTo.instance_of?(String))
                assert_equal(true, taskProject.instance_of?(String))
                assert_equal(true, taskCreated.instance_of?(String))
            end

            projectId = getAllProjects["projects"][project]["_id"]
            title = getAllProjects["projects"][project]["title"]
            description = getAllProjects["projects"][project]["description"]
            userName = getAllProjects["projects"][project]["user"]["name"]
            userEmail = getAllProjects["projects"][project]["user"]["email"]
            createdAt =  getAllProjects["projects"][project]["createdAt"]

            assert_equal(true, projectId.instance_of?(String))
            assert_equal(true, title.instance_of?(String))
            assert_equal(true, description.instance_of?(String))
            assert_equal(true, userName.instance_of?(String))
            assert_equal(true, userEmail.instance_of?(String))
            assert_equal(true, createdAt.instance_of?(String))
        end
    end

    def validateProjectByID(response)
        assert_equal(200, response.code)

        taskId = response["project"]["tasks"][0]["_id"]
        taskName = response["project"]["tasks"][0]["name"]
        taskAssignedTo = response["project"]["tasks"][0]["assignedTo"]
        taskProject = response["project"]["tasks"][0]["project"]
        taskCreated = response["project"]["tasks"][0]["createdAt"]

        assert_equal(true, taskId.instance_of?(String))
        assert_equal(true, taskName.instance_of?(String))
        assert_equal(true, taskAssignedTo.instance_of?(String))
        assert_equal(true, taskProject.instance_of?(String))
        assert_equal(true, taskCreated.instance_of?(String))

        projectId = response["project"]["_id"]
        title = response["project"]["title"]
        description = response["project"]["description"]
        userName = response["project"]["user"]["name"]
        userEmail = response["project"]["user"]["email"]
        createdAt =  response["project"]["createdAt"]

        assert_equal(true, projectId.instance_of?(String))
        assert_equal(true, title.instance_of?(String))
        assert_equal(true, description.instance_of?(String))
        assert_equal(true, userName.instance_of?(String))
        assert_equal(true, userEmail.instance_of?(String))
        assert_equal(true, createdAt.instance_of?(String))
    end

    def getProjectById 
        getProjectById = HTTParty.get ['http://54.207.100.192/projects/', $id].join(""),
            :headers => {
                "Authorization" => ['Bearer ', $token].join(""),
                "Content-Type" => 'application/json'
            }
    end

    def updateProjectById
        @body = {
            "title": Faker::Artist.name,
            "description": Faker::Games::LeagueOfLegends.quote,
            "tasks": [
                {
                    "name": Faker::Name.name,
                    "assignedTo": $id
                }
        ]
        }.to_json

        
        updateProjectById = HTTParty.put ['http://54.207.100.192/projects/', $id].join(""),
            :body => @body,
            :headers => {
                "Authorization" => ['Bearer ', $token].join(""),
                "Content-Type" => 'application/json'
            }
    end

    def deleteProjectById
        deleteProjectById = HTTParty.delete ['http://54.207.100.192/projects/', $id].join(""),
            :headers => {
                "Authorization" => ['Bearer ', $token].join(""),
                "Content-Type" => 'application/json'
            }
    end

    def validateDeletedProject(response)
        assert_equal(200, response.code)
        assert_equal("close", response["connection"])
    end

end