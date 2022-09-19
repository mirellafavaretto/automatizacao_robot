*** Settings ***

Documentation    Essa suite testa o site da Amazon.com.br
Resource         amazon_desafio_resources.robot
Test Setup       Abrir o navegador 
Test Teardown    Fechar o navegador

*** Test Cases ***

Caso de Teste 03 - Adicionar Produto no Carrinho
    [Documentation]    Esse teste verifica a adição de um produto no carrinho de compras
    [Tags]             adicionar_carrinho   
    Acessar a home page do site 
    Digitar o nome de produto "Xbox Series S" no campo de pesquisa   
    Clicar no botão de pesquisa
    Verificar o resultado da pesquisa se está listando o produto "Xbox Series S"   
    Adicionar o produto "Xbox Series S" no carrinho 
    Verificar se o produto "Xbox Series S" foi adicionado com sucesso 

Caso de Teste 04 - Remover Produto do Carrinho
    [Documentation]    Esse teste verifica a remoção de um produto no carrinho de compras
    [Tags]             remover_carrinho
    Acessar a home page do site
    Digitar o nome de produto "Xbox Series S" no campo de pesquisa 
    Clicar no botão de pesquisa
    Verificar o resultado da pesquisa se está listando o produto "Xbox Series S" 
    Adicionar o produto "Xbox Series S" no carrinho
    Verificar se o produto "Xbox Series S" foi adicionado com sucesso
    Remover o produto "Xbox Series S" do carrinho
    Verificar se o carrinho fica vazio   
