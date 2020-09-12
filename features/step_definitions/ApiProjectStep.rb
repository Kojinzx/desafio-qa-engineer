Dado("que eu crie um novo projeto") do
    @response = ApiProjectPage.new.createNewProject()
end

Então("valido as informacoes do projeto") do
    ApiProjectPage.new.validateNewProject(@response)
end

Dado("que eu pegue todos os projetos") do
    @response = ApiProjectPage.new.getAllProjects()
end

Então("valido as informacoes dos projetos retornados") do
    ApiProjectPage.new.validateAllProjects(@response)
end

Dado("que eu pegue um projeto pelo ID") do
    @response = ApiProjectPage.new.getProjectById()
end

Então("valido as informacoes do projeto pelo ID") do
    ApiProjectPage.new.validateProjectByID(@response)
end

Dado("que eu atualize um projeto pelo ID") do
    @response = ApiProjectPage.new.updateProjectById()
end

Então("valido que foi atualizado com sucesso") do
    ApiProjectPage.new.validateProjectByID(@response)
end

Dado("que eu delete um projeto pelo ID") do
    @response = ApiProjectPage.new.deleteProjectById()
end

Então("valido que o projeto foi deletado com sucesso") do
    ApiProjectPage.new.validateDeletedProject(@response)
end