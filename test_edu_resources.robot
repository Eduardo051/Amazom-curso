*** Settings ***
Library  SeleniumLibrary


*** Variable ***
${URL}  http://www.amazom.com.br
${MENU_ELETRONIVCOS}  //a[@href='/Eletronicos-e-Tecnologia/b/?ie=UTF8&node=16209062011&ref_=nav_cs_electronics'][contains(.,'Eletrônicos')]
${HEADER_ELETRONICOS}  //h1[contains(.,'Eletrônicos e Tecnologia')]
${TEXTO_HEADER_ELETRONICOS}  Eletrônicos e Tecnologia


*** Keywords ***
Abrir o navegador  
  Open Browser  browser=chrome  
  Maximize Browser Window  

Fechar o navegador
  Capture Page Screenshot
  Close Browser 
  
Acessar a home page do site Amazon.com.br
    Go To  url=${URL}
    Wait Until Element Is Visible  ${MENU_ELETRONIVCOS} 

Entrar no menu "Eletrônicos"
    Click Element  locator=${MENU_ELETRONIVCOS}  

Verificar se aparece a frase "${FRASE}"
    Wait Until Page Contains  text=${FRASE}
    Wait Until Element Is Visible  locator=${HEADER_ELETRONICOS} 

Verificar se o título da página fica "${TITULO}"
    Title Should Be  title=${TITULO}  

Verificar se aparece a categoria "${NOME_CATEGORIA}"
    Element Should Be Visible  locator=(//img[@alt='${NOME_CATEGORIA}'])[2] 

Digitar o nome de produto "${TEXTO_BUSCA}" no campo de pesquisa
    #Input Text  id=twotabsearchtextbox text=${TEXTO_BUSCA}   
    Input Text  locator=twotabsearchtextbox  text=${TEXTO_BUSCA}

Clicar no botão de pesquisa
    Click Button  locator=nav-search-submit-button  

Verificar resultado da pesquisa se esta listando o produto "${PRODUTO}"
    Element Should Be Visible  locator=search  message=${PRODUTO}

Verificar o resultado da pesquisa se está listando o produto "Console Xbox Series S"
    Element Should Be Visible  locator=search  message=Console Xbox Series S

Adicionar o produto "Console Xbox Series S" no carrinho
    Click Element  locator=//img[@alt='Xbox Series S']
    Click Element  locator=//input[contains(@name,'submit.add-to-cart')]
    #Wait Until Page Contains  text=Não  
    #Click Element  locator=//input[contains(@name,'submit.add-to-cart')]

Verificar se o produto "Console Xbox Series S" foi adicionado com sucesso
    Element Should Be Visible  locator=//span[@class='a-size-medium-plus a-color-base sw-atc-text a-text-bold'][contains(.,'Adicionado ao carrinho')]  message=Adicionado ao carrinho
    
Remover o produto "Console Xbox Series S" do carrinho
    Click Element  locator=//a[@class='a-button-text']
    Click Element  locator=//input[@data-action='delete']

Verificar se o carrinho fica vazio
    Sleep  2
    Element Should Be Visible  locator=//h1[@class='a-spacing-mini a-spacing-top-base'][contains(.,'Seu carrinho de compras da Amazon está vazio.')]  message=Seu carrinho de compras da Amazon está vazio.

# BDD 01

Dado que estou na home page da Amazon.com.br
    Acessar a home page do site Amazon.com.br
    Verificar se o título da página fica "Amazon.com.br | Tudo pra você, de A a Z."
Quando acessar o menu "Eletrônicos"
    Entrar no menu "Eletrônicos"

Então o título da página deve ficar "Eletrônicos e Tecnologia | Amazon.com.br"
    Verificar se o título da página fica "Eletrônicos e Tecnologia | Amazon.com.br"

E o texto "Eletrônicos e Tecnologia" deve ser exibido na página
    Verificar se aparece a frase "Eletrônicos e Tecnologia"

E a categoria "Computadores e Informática" deve ser exibida na página
    Verificar se aparece a categoria "Computadores e Informática"

    
# BDD 02

Dado que estou na home page da Amazon.com.br
    Acessar a home page do site Amazon.com.br
    Verificar se o título da página fica "Amazon.com.br | Tudo pra você, de A a Z."

Quando pesquisar pelo produto "Xbox Series S"
    Digitar o nome de produto "Xbox Series S" no campo de pesquisa

Então o título da página deve ficar "Amazon.com.br : Xbox Series S"
    Title Should Be  title=Amazon.com.br : xbox series s

E um produto da linha "Xbox Series S" deve ser mostrado na página
    Verificar resultado da pesquisa se esta listando o produto "Xbox Series S"


#  BDD 03

Dado que estou na home page da Amazon.com.br
    Acessar a home page do site Amazon.com.br
    Verificar se o título da página fica "Amazon.com.br | Tudo pra você, de A a Z."

Quero pesquisar o produto "Xbox Series S"
    Digitar o nome de produto "Xbox Series S" no campo de pesquisa
    Clicar no botão de pesquisa

Então no resultado da Psquisa deve constar "Xbox Series S"
    Verificar o resultado da pesquisa se está listando o produto "Console Xbox Series S"

E quero adicionar o produto "Xbox Series S" no carrinho
    Adicionar o produto "Console Xbox Series S" no carrinho

E quero verificar se o produto foi adicinado com sucesso
    Verificar se o produto "Console Xbox Series S" foi adicionado com sucesso


# BBD 04

Dado que estou na home page da Amazon.com.br
    Acessar a home page do site Amazon.com.br
    Verificar se o título da página fica "Amazon.com.br | Tudo pra você, de A a Z."

Quero pesquisar o produto "Xbox Series S"
    Digitar o nome de produto "Xbox Series S" no campo de pesquisa
    Clicar no botão de pesquisa

Então no resultado da Psquisa deve constar "Xbox Series S"
    Verificar o resultado da pesquisa se está listando o produto "Console Xbox Series S"

E quero adicionar o produto "Xbox Series S" no carrinho
    Adicionar o produto "Console Xbox Series S" no carrinho

E quero verificar se o produto foi adicinado com sucesso
    Verificar se o produto "Console Xbox Series S" foi adicionado com sucesso

Dado que o produto foi adicionado quero removelo do carrinho
    Remover o produto "Console Xbox Series S" do carrinho

E quero verificar se ele foi removido com sucesso
    Verificar se o carrinho fica vazio





    