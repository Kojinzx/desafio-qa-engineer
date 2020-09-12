Obrigado pela oportunidade.

Pré-requisitos

```sh
Ruby 2.6.5
Chromedriver 86.0.4240.22
Bundler
```

Começando
Para que todos os frameworks funcionem no projeto, é necessário rodar o seguinte comando:
```sh
bundle install
```
Em seguida já é possível usar os seguintes comandos, para rodar a automação.

```sh
Front-End:
cucumber -t @web

Back-End:
cucumber -t @api
```