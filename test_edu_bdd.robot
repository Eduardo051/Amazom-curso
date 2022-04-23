*** Settings ***
Documentation  essa suite testa o saite da amazom.com.br
Resource       test_edu_resources.robot
Test Setup     Abrir o navegador
Test Teardown  Fechar o navegador




*** Test Cases ***

Scenario de teste 01 - Acesso ao menu eletronicos
    [Documentation]  esse teste verifica o meno eletronicos do site amazom
    ...              #e verifica a categoria computadores e informatica 
    [Tags]           Menus  categorias 
    Dado que estou na home page da Amazon.com.br
    Quando acessar o menu "Eletrônicos"
    Então o título da página deve ficar "Eletrônicos e Tecnologia | Amazon.com.br"
    E o texto "Eletrônicos e Tecnologia" deve ser exibido na página
    E a categoria "Computadores e Informática" deve ser exibida na página


Scenario de teste 02 - pesquisa de protudo
    [Documentation]  esse teste verifica a busca de um produto
    [Tags]           Busca de produtos  lista_busca 
    Dado que estou na home page da Amazon.com.br
    Quando pesquisar pelo produto "Xbox Series S"
    Então o título da página deve ficar "Amazon.com.br : Xbox Series S"
    E um produto da linha "Xbox Series S" deve ser mostrado na página
    

Scenario de teste 03 - Adicionar Produto no Carrinho
    [Documentation]    Esse teste verifica a adição de um produto no carrinho de compras
    [Tags]             adicionar_carrinho
    Dado que estou na home page da Amazon.com.br
    Quero pesquisar o produto "Xbox Series S"
    Então no resultado da Pesquisa deve constar "Xbox Series S" 
    E quero adicionar o produto "Xbox Series S" no carrinho 
    E tambem verificar se o produto foi adicinado com sucesso
 
Scenario de teste 04 - Remover Produto do Carrinho
    [Documentation]    Esse teste verifica a remoção de um produto no carrinho de compras
    [Tags]             remover_carrinho
    Dado que estou na home page da Amazon.com.br
    Quero pesquisar o produto "Xbox Series S"
    Então no resultado da Pesquisa deve constar "Xbox Series S"
    E quero adicionar o produto "Xbox Series S" no carrinho 
    E tambem verificar se o produto foi adicinado com sucesso
    Dado que o produto foi adicionado quero removelo do carrinho
    E quero verificar se ele foi removido com sucesso  


