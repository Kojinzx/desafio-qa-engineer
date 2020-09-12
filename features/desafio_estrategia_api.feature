# language: pt
# encoding: utf-8

Funcionalidade: Realizar o CRUD da API

    @api @create
	Cenario: Cadastrar um novo Usuario
		Dado que eu realize o cadastro de um usuario na API 
		Então valido o cadastro do usuario

    @api @authenticate
    Cenario: Autenticar o usuario criado
        Dado que eu pegue as informacoes do usuario criado
        Então eu faco a autenticacao e valido

    @api @createProject
    Cenario: Criar um novo projeto
        Dado que eu crie um novo projeto
        Então valido as informacoes do projeto
    
    @api @getAllProjects
    Cenario: Pegar todos os projetos criado
        Dado que eu pegue todos os projetos
        Então valido as informacoes dos projetos retornados

    @api @getProjectById
    Cenario: Pegar projeto por ID
        Dado que eu pegue um projeto pelo ID
        Então valido as informacoes do projeto pelo ID
    
    @api @updateProjectById
    Cenario: Atualizar um projeto pelo ID
        Dado que eu atualize um projeto pelo ID
        Então valido que foi atualizado com sucesso

    @api @deleteProjectById
    Cenario: Deletar um projeto pelo ID
        Dado que eu delete um projeto pelo ID
        Então valido que o projeto foi deletado com sucesso
