Dado("que eu acesse a home") do
  WebPage.new.visitPage()
end

Quando("utilizo a busca Por Professor") do
  WebPage.new.clicarEmPorProfessor()
end

E("acesso os cursos da professora Ena Loiola") do
  WebPage.new.clicarEmEnaLoiola()
end

E("escolho um dos cursos para fazer a validacao") do
  WebPage.new.pegarUmCursoAleatorio()
end

Entao("verifico que o curso bate com o valor e a parcela tambem") do
  WebPage.new.clicarEmDetalhesDoCurso()
  WebPage.new.validarDetalhes()
end