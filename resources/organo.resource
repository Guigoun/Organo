*** Settings ***
Library          SeleniumLibrary
Library          FakerLibrary    locale=pt_BR

*** Variables ***
${CAMPO_NOME}      id:form-nome
${CAMPO_CARGO}     id:form-cargo
${CAMPO_IMAGEM}    id:form-imagem
${CAMPO_TIME}      class:lista-suspensa
${CAMPO_CARD}      id:form-botao 
@{SELECIONAR_TIMES}
...    //option[contains(.,'Programação')]
...    //option[contains(.,'Front-End')]
...    //option[contains(.,'Data Science')]
...    //option[contains(.,'Devops')]
...    //option[contains(.,'UX e Design')]
...    //option[contains(.,'Mobile')]
...    //option[contains(.,'Inovação')]

${COLABORADOR}     class:colaborador

*** Keywords ***
#Cenário 1

#Keyword padrão
Dado que acessei o site da Organo
    Open Browser    http://localhost:3000/    browser=Chrome
    Maximize Browser Window

Quando preencho os campos do formulário com dados válidos
    ${NOME}          FakerLibrary.File Name
    Input Text       ${CAMPO_NOME}      ${NOME}

    ${CARGO}         FakerLibrary.Job        
    Input Text       ${CAMPO_CARGO}     ${CARGO}

    ${IMAGEM}        FakerLibrary.Image Url
    Input Text       ${CAMPO_IMAGEM}    ${IMAGEM}

    Click Element    ${CAMPO_TIME}
    Click Element    ${SELECIONAR_TIMES}[0]        

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
    


