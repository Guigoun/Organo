*** Settings ***
Resource         ../resources/organo.resource
Test Teardown    Close Browser

*** Test Cases ***
Cenário 1: Cria card com sucesso preenchendo os campos e verifica se está visível
    Dado que acessei o site da organo
    Quando preencho os campos do formulário com dados válidos
    E clico no botão "Criar Card"
    Então o card deve ser criado com sucesso 
    E deve estar visível no time esperado

Cenário 2: Tenta criar card com campos obrigatórios em branco
    Dado que acessei o site da organo
    Quando deixo todos os campos do formulário em brancos
    E clico no botão "Criar Card"
    Então o card não deve ser criado apresentando mensagem de campos obrigatórios

Cenário 3: Cria 3 cards no mesmo time
    Dado que acessei o site da organo
    Quando crio 3 cards para o mesmo time com dados válidos
    Então o sistema deve exibir os 3 cards criados

Cenário 4:
    Dado que acessei o site da organo
    Quando crio 1 para cada time com dados válidos
    Então o sistema deve exibir 1 card criado para cada time

    



