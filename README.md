# Onboarding IBGE

Aplicativo para console para exploração das funções da API REST pública para 
pesquisa de nomes que o IBGE publicou em 2016.

## Funcionamento
O aplicativo inicia a partir da classe `application.rb`, no método `main()`.
Para iniciá-la, é necessário ter o Ruby instalado e emitir o comando:
```
ruby lib/application.rb
```

## Ferramentas utilizadas
- Ruby 2.7
- Faraday 1.0.1
- SQLite3 1.4.2
- TerminalTable 1.8.0

## Componentes
Todos localizados em `/lib`. São eles:
- `controllers`: Acionam carregamentos de dados e direcionam para exibições 
humanizadas de dados;
- `models`: Classes PORO de objetos de lógica de negócio evocáveis em diferentes
partes do projeto;
- `views`: Exibições de entradas e saída de dados para facilitação de uso;
- `application`: Ponto inicial de execução da aplicação;
- `database`: Centralizador de informações e tarefas do banco de dados;
- `population_reader`: Leitor do CSV dos dados totais de população;
- `report`: Centralizador de informações de exibição de tabelas;
- `service`: Ponto de obtenção de dados da API do IBGE.

## Controllers
Devem ser inscritos como dependências no construtor de `Application`. São 
roteados em função das escolhas feitas pelo usuário através do menu.<br>
Preparados os dados obtidos de diversas fontes - REST API, banco de dados ou
arquivo -, direcionam para uma `view` para que sejam exibidos 
apropriadamente.<br>
Recursos que sejam comuns a todos os controllers devem ser declarados em 
`BaseController`.

## Views
Realizam os tratamentos apropriados para que as entradas do usuários direcionem
para as funcionalidades corretas. Devem ser cadastrados como dependências nos
controllers correspondentes.<br>
As entradas são tratadas com exceções e sanitizadores para que dados incorretos
não comprometam a funcionalidade da aplicação, da seguinte forma:
- Não há distinção de maiúsculas e minúsculas e espaços em branco antes e depois
são desconsiderados;
- Nomes de cidades demandam que se escolha o UF antes, dado que há casos de 
repetições no território brasileiro. Os nomes demandam correta acentuação;
- Nomes podem ser digitados com acentuação ou sem e separados com vírgulas com
ou sem espaço.
Views com tabelas são parametrizadas através da classe `Report`.

## Application
O coração da aplicação e seu início. Opções adicionadas em `options` são 
automaticamente adicionadas visualmente ao menu, localizado em `HomeView`. Para
que uma nova opção tenha funcionalidades, o método correspondente do controller
a ser adicionado deve ser inscrito em no switch case do método `main()`.<br>
Também dispara a preparação do banco de dados. Se não estiver populado, terá os
métodos de criação localizados nos controllers acionados, que acessarão a REST
API para obter informações necessárias.<br>
Neste projeto, apenas `City` e `State` são persistidos.

## PopulationReader
Através da leitura do arquivo `populacao_2019.csv`, gera instâncias do tipo
`Population` que são combinadas com os dados de `State` e `City` para exibir
os percentuais de cada nome dentro do universo da população.

## Database
Contém um `schema` e dispõe de métodos para geração do banco de dados na 
primeira execução. Porta a instância de `SQLite` direcionando para o arquivo
`database.db` através do método `instance()` e que é chamada globalmente pelos
`models`.

## Service
Obtém dados do IBGE via HTTPS que são instanciados como objetos presentes no
`model`, levando apenas os dados necessários para a aplicação.

## Objetos de estudo
- Programação em Ruby
- Orientação a objetos
- Programação funcional
- Carregamento e operações de arquivos
- Bancos de dados relacionais
- Integração com APIs REST