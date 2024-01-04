# MultiMix Store

O App MultiMix Store é a solução para um desafio de código proposto por uma empresa.

## Capturas de Tela

| <img src="https://github.com/douglasmouralds/store-flutter/assets/142683965/452c956f-c2da-4684-8b5d-4eb297c63970" alt="Captura de Tela 1" width="300"> | <img src="https://github.com/douglasmouralds/store-flutter/assets/142683965/f2d3c61b-ad8c-470b-815a-35fc6e2f641a" alt="Captura de Tela 2" width="300"> | <img src="https://github.com/douglasmouralds/store-flutter/assets/142683965/12c2747f-aa18-4735-92dc-93327e99b8d7" alt="Captura de Tela 3" width="300"> |
| --- | --- | --- |
| *Captura de Tela 1* | *Captura de Tela 2* | *Captura de Tela 3* |

## Arquitetura:

O aplicativo utiliza a arquitetura MVC (Model-View-Controller) para organizar o código de maneira clara e separar as responsabilidades.
Foi empregado o uso de ValueNotifier para gerenciar estados reativos no aplicativo.

## API de Produtos:

Foi integrada uma API fictícia de produtos para fornecer dados de produtos ao aplicativo.
A classe HttpClient foi criada para realizar solicitações HTTP, enquanto a classe ProdutoRepository foi responsável por obter dados da API.

## Modelo de Dados:

O modelo de dados ProdutoModel foi definido para representar as informações de um produto, incluindo título, descrição, preço, classificação, estoque, marca, categoria, imagens, etc.

## Loja de Produtos:

A página principal (HomePage) exibe uma lista de produtos consumidos da API.
O estado da loja é gerenciado por ProdutoStore, que lida com a obtenção e manipulação dos dados dos produtos.

## Navegação por Tags:

A página TagPage exibe tags ordenadas, representando marcas de produtos.
Ao clicar em uma tag, a página de produtos (ProductsPage) é exibida, filtrando os produtos pela marca correspondente.

## Tratamento de Erros:

O aplicativo trata possíveis erros, como falha na obtenção de produtos ou URL inválida, exibindo mensagens apropriadas.

## Interface do Usuário:

O aplicativo possui uma interface de usuário amigável com detalhes de produtos, imagens, preços e informações de estoque.
