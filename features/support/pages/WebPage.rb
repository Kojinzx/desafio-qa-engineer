class WebPage
    include Capybara::DSL
    
    def visitPage
        visit 'https://www.estrategiaconcursos.com.br/'

        find(:xpath, EL['xPathNotificacaoNao'], wait:15).click
    end

    def clicarEmPorProfessor
        find(:xpath, EL['xPathPorProfessor'], wait: 15).click
    end

    def clicarEmEnaLoiola
        find(:xpath, EL['xPathEnaLoiola'], wait: 15).click
    end

    def pegarUmCursoAleatorio
        quantidadeDeCursos = all(:xpath, EL['xPathCursos'], wait:15).length

        $curso = rand(1..quantidadeDeCursos)
        
        arrayDetalhesCurso = all(:xpath, EL['xPathCursos'], wait:15)[$curso].text.split(' ')

        valorCurso = arrayDetalhesCurso[-2]
        
        cursoParcelado = arrayDetalhesCurso[-5]

        if cursoParcelado == "12x"
            $valorTotal = valorCurso.to_i * 12
        else
            $valorTotal = valorCurso
        end

    end

    def clicarEmDetalhesDoCurso
        all(:xpath, EL['xPathDetalhes'], wait:15)[$curso].click
    end

    def validarDetalhes
        valorCursoDetalhes = find(:xpath, EL['xPathValue']).text.split(' ').last
        assert_equal($valorTotal.to_i, valorCursoDetalhes.to_i, nil)
    end
end