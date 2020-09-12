# language: pt
# encoding: utf-8

Funcionalidade: Realizar fluxo de front para validacao de valores

    @web
    Cenario: Validar valores do curso em detalhes e parcela
        Dado que eu acesse a home
        Quando utilizo a busca Por Professor
        E acesso os cursos da professora Ena Loiola
        E escolho um dos cursos para fazer a validacao
        Entao verifico que o curso bate com o valor e a parcela tambem