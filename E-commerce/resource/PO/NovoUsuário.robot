*** Settings ***
Library     SeleniumLibrary

*** Variables ***
${TITULO_HOME}                    QAZANDO Shop E-Commerce
${USER}                           user
${EMAIL}                          email
${PASSWORD}                       password
${NOME_USUARIO}                   Teste da Silva
${E-MAIL_USUARIO}                 teste@dasilva.com
${SENHA_USUARIO}                  123456
${BTN_REGISTRAR}                  btnRegister
${BTN_CONFIRMAR}                  xpath://div[6]/button[1]

*** Keywords ***

Digitar nome no campo Username
    Wait Until Element Is Visible     ${USER}
    Input Text       ${USER}          ${NOME_USUARIO}

Digitar e-mail no campo e-mail
    Wait Until Element Is Visible     ${EMAIL}
    Input Text       ${EMAIL}        ${E-MAIL_USUARIO}

Digitar senha no campo password
    Wait Until Element Is Visible     ${PASSWORD}
    Input Text       ${PASSWORD}       ${SENHA_USUARIO}

Clicar no botão Register
    Click Button      ${BTN_REGISTRAR}

Clicar no botao ok de confirmação de cadastro
    Wait Until Element Is Visible     ${BTN_CONFIRMAR}
    Click Element                     ${BTN_CONFIRMAR}
