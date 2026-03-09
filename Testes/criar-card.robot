*** Settings ***
Library          SeleniumLibrary
Test Teardown    Close Browser

*** Variables ***
${CAMPO_NOME}      id:form-nome
${CAMPO_CARGO}     id:form-cargo
${CAMPO_IMAGEM}    id:form-imagem
${CAMPO_TIME}      class:lista-suspensa
${CAMPO_CARD}      id:form-botao 
${PROGRAMACAO}     //option[contains(.,'Programação')]
${FRONT-END}       //option[contains(.,'Front-End')]
${DADOS}           //option[contains(.,'Data Science')]
${DEVOPS}          //option[contains(.,'Devops')]
${UX}              //option[contains(.,'UX e Design')]
${MOBILE}          //option[contains(.,'Mobile')]
${INOVACAO}        //option[contains(.,'Inovação')]
${COLABORADOR}     class:colaborador
${VALOR_NOME}      Get Value    ${CAMPO_NOME}
${VALOR_CARGO}     Get Value    ${CAMPO_CARGO}
${VALOR_IMAGEM}    Get Value    ${CAMPO_IMAGEM}
${VALOR_TIME}      Get Value    ${CAMPO_TIME}

*** Test Cases ***
Cenário 1: Cria card com sucesso preenchendo os campos e verifica se está visível
    Dado que acessei o site da Organo
    Quando preencho os campos do formulário com dados válidos
    E clico no botão "Criar Card"
    Então o card deve ser criado com sucesso 
    E deve estar visível no time esperado

Cenário 2: Tenta criar card com campos obrigatórios em branco
    Dado que acessei o site da Organo
    Quando deixo todos os campos do formulário em brancos
    E clico no botão "Criar Card"
    Então o card não deve ser criado apresentando mensagem de campos obrigatórios


*** Keywords ***
#Cenário 1

#Keyword padrão
Dado que acessei o site da Organo
    Open Browser    http://localhost:3000/    browser=Chrome
    Maximize Browser Window

Quando preencho os campos do formulário com dados válidos
    Input Text       ${CAMPO_NOME}      Guilherme               
    Input Text       ${CAMPO_CARGO}     Desenvolvedor  
    Input Text       ${CAMPO_IMAGEM}    https://i.pinimg.com/736x/cf/37/03/cf37033da3c04e6fc1510916600ffa08.jpg         
    Click Element    ${CAMPO_TIME}
    Click Element    ${PROGRAMACAO}            

E clico no botão "Criar Card"
    Sleep    4s
    Click Element    ${CAMPO_CARD}

Então o card deve ser criado com sucesso 
    Wait Until Element Is Visible    ${COLABORADOR}    timeout=5s

E deve estar visível no time esperado
    Element Should Be Visible    ${COLABORADOR}

#Cenário 2
Quando deixo todos os campos do formulário em brancos
    Clear Element Text    ${CAMPO_NOME}
    Clear Element Text    ${CAMPO_CARGO}
    Clear Element Text    ${CAMPO_IMAGEM}

Então o card não deve ser criado apresentando mensagem de campos obrigatórios
    Element Should Be Visible    id:form-nome-erro
    Element Should Be Visible    id:form-cargo-erro
    Element Should Be Visible    id:form-times-erro
    


