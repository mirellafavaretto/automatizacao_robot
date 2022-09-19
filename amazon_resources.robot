*** Settings ***
Library    SeleniumLibrary

*** Variables ***  # # variaveis que tem valores constantes, jamais passar keywords nessa sessão
${URL}                      https://www.amazon.com.br/
${MENU_MAISVENDIDOS}        //a[@href='/gp/bestsellers/?ref_=nav_cs_bestsellers'][contains(.,'Mais Vendidos')]
${TITULO_MAISVENDIDOS}      //span[contains(@class,'a-size-extra-large a-color-base _p13n-zg-banner-landing-page-header_style_zgLandingPageBannerText__3HlJo')]  
${TEXTO_MAISVENDIDOS}       Mais Vendidos
${CATEGORIA}                //a[@href='/gp/bestsellers/grocery/ref=zg_bs_nav_0'][contains(.,'Alimentos e Bebidas')]      


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

Entrar no menu "Mais Vendidos"
     Click Element    locator=${MENU_MAISVENDIDOS}       ## o click element é bom usar pois pode ser utilizado para clicar em qualquer tipo de elemento (botão, etc)    
     Wait Until Element Is Visible    locator=${TITULO_MAISVENDIDOS}

Verificar se aparece a frase "Mais vendidos"
    Wait Until Page Contains    text=${TEXTO_MAISVENDIDOS}
    Wait Until Element Is Visible    locator=${TITULO_MAISVENDIDOS}

Verificar se o título da página fica "${TITULO}"             ##aqui ele já pega o titulo que está declarado em aspas no cenário e inclui nessa variável
    Title Should Be    title=${TITULO}

Verificar se aparece a categoria "Alimentos e Bebidas"
    Element Should Be Visible    locator=${CATEGORIA}

Digitar o nome de produto "${PRODUTO}" no campo de pesquisa
    Input Text    locator=twotabsearchtextbox    text=${PRODUTO}

Clicar no botão de pesquisa
    Click Element    locator=nav-search-submit-button

Verificar o resultado da pesquisa se está listando o produto "${PRODUTO_XBOX}"       
    Wait Until Element Is Visible    locator=(//span[@class='a-size-base a-color-base a-text-normal'][contains(.,(//span[@class='a-size-base a-color-base a-text-normal'][contains(.,'${PRODUTO_XBOX}')])[2])])[2]




# GHERKIN BDD



Dado que estou na home page da Amazon.com.br
    Acessar a home page do site
    
Quando acessar o menu "Mais Vendidos"
    Entrar no menu "Mais Vendidos"

Então o título da página deve ficar "Amazon.com.br Mais Vendidos: Os itens mais populares na Amazon"
    Verificar se o título da página fica "Amazon.com.br Mais Vendidos: Os itens mais populares na Amazon"
    
E o texto "Mais Vendidos" deve ser exibido na página
    Verificar se aparece a frase "Mais vendidos" 

E a categoria "Alimentos e Bebidas" deve ser exibida na página
    Verificar se aparece a categoria "Alimentos e Bebidas"

Quando pesquisar pelo produto "Xbox Series S"
    Digitar o nome de produto "Xbox Series S" no campo de pesquisa
    Clicar no botão de pesquisa
Então o título da página deve ficar "Amazon.com.br : Xbox Series S"
    Verificar se o título da página fica "Amazon.com.br : Xbox Series S"
E um produto da linha "Xbox Series S" deve ser mostrado na página
    Verificar o resultado da pesquisa se está listando o produto "Xbox Series S"    




