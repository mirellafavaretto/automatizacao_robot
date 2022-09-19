*** Settings ***

Library    SeleniumLibrary


*** Variables ***
${URL}                           https://www.amazon.com.br/
${MENU_MAISVENDIDOS}             //a[@href='/gp/bestsellers/?ref_=nav_cs_bestsellers'][contains(.,'Mais Vendidos')]
${CLICAR_PRODUTO}                (//span[@class='a-size-base a-color-base a-text-normal'][contains(.,'Xbox Series S')])[2]
${ADICIONAR_CARRINHO}            //span[contains(@class,'a-button a-spacing-small a-button-primary a-button-icon natc-enabled')]
${CONFIRMACAO_CARRINHO}          Subtotal do carrinho:  
${CARRINHO}                      //a[contains(.,'Ir para o carrinho')]                      
${CARRINHO_COMPRAS}              Carrinho de compras
${EXCLUIR_PRODUTO}               //input[@value='Excluir']
${CARRINHO_VAZIO}                Seu carrinho de compras da Amazon está vazio.


*** Keywords ***

Abrir o navegador
    Open Browser    browser=chrome
    Maximize Browser Window

Fechar o navegador
    Capture Page Screenshot
    Close Browser     

Acessar a home page do site
    Go To    url=${URL}
    Wait Until Element Is Visible    locator=${MENU_MAISVENDIDOS} 

Digitar o nome de produto "${PRODUTO}" no campo de pesquisa 
    Input Text    locator=twotabsearchtextbox    text=${PRODUTO}

Clicar no botão de pesquisa
    Click Element    locator=nav-search-submit-button

Verificar o resultado da pesquisa se está listando o produto "Xbox Series S"
    Wait Until Element Is Visible    locator=//span[@class='a-size-medium-plus a-color-base a-text-normal'][contains(.,'RESULTADOS')]
    Click Element    locator=${CLICAR_PRODUTO}

Adicionar o produto "Xbox Series S" no carrinho
    Click Element    locator=${ADICIONAR_CARRINHO}

Verificar se o produto "Xbox Series S" foi adicionado com sucesso
    Wait Until Page Contains    text=${CONFIRMACAO_CARRINHO}


Remover o produto "Xbox Series S" do carrinho
    Click Element    locator=${CARRINHO}
    Wait Until Page Contains    text=${CARRINHO_COMPRAS}
    Click Element    locator=${EXCLUIR_PRODUTO}
Verificar se o carrinho fica vazio
   Wait Until Page Contains    text=${CARRINHO_VAZIO}


# GHERKIN BDD

Dado que estou na home page da Amazon.com.br
    Acessar a home page do site

Quando adicionar o produto "Xbox Series S" no carrinho
    Digitar o nome de produto "Xbox Series S" no campo de pesquisa   
    Clicar no botão de pesquisa
    Verificar o resultado da pesquisa se está listando o produto "Xbox Series S" 
    Adicionar o produto "Xbox Series S" no carrinho

Então o produto "Xbox Series S" deve ser mostrado no carrinho
    Verificar se o produto "Xbox Series S" foi adicionado com sucesso 


E existe o produto "Xbox Series S" no carrinho
    Digitar o nome de produto "Xbox Series S" no campo de pesquisa   
    Clicar no botão de pesquisa
    Verificar o resultado da pesquisa se está listando o produto "Xbox Series S" 
    Adicionar o produto "Xbox Series S" no carrinho
    
Quando remover o produto "Xbox Series S" do carrinho
    Remover o produto "Xbox Series S" do carrinho

Então o carrinho deve ficar vazio
    Verificar se o carrinho fica vazio   
