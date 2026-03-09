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

*** Test Cases ***
Valida o preenchimento correto dos campos do formulário, cria o card e verifica se é exibido no time correspondente
    Dado que acessei o site da Organo
    Quando preencho os campos do formulário com dados válidos
    E clico no botão "Criar Card"
    Então o card deve ser criado com sucesso 
    E deve estar visível no time esperado
    

*** Keywords ***
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
    Click Element    ${CAMPO_CARD}    

Então o card deve ser criado com sucesso 
    Wait Until Element Is Visible    ${COLABORADOR}    timeout=5s

E deve estar visível no time esperado
    Element Should Be Visible    ${COLABORADOR}
    