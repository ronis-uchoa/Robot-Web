*** Settings ***
Library     SeleniumLibrary

*** Variables ***
${BROWSER}      firefox
${URL}          https://buscacepinter.correios.com.br/app/endereco/index.php

*** Keywords ***
Abrir navegador
    Open Browser                      about:blank            ${BROWSER}

 Fechar navegador
     Close Browser

Acessar a página home do site
    Go To                             ${URL}

Digitar um cep no campo de texto
    Input Text                        endereco                63048200

Selecionar um item por index
    Sleep    1
    Select From List By Index         tipoCEP                 0
    Click Button                      btn_pesquisar
    Wait Until Element Is Visible     navegacao-resultado

Conferir Logradouro/Nome: ${RUA}
    Page Should Contain Element       navegacao-resultado      ${RUA}

Conferir Bairro/Distrito: ${BAIRRO}
    Page Should Contain Element       navegacao-resultado      ${BAIRRO}

Conferir Localidade/UF: ${CIDADE}
    Page Should Contain Element       navegacao-resultado       ${CIDADE}

Conferir CEP: ${CEP}
    Page Should Contain Element       navegacao-resultado       ${CEP}

Clicar no botão voltar
    Click Button                      btn_voltar

# Selecionar um item por label
#     Sleep    1
#     Select From List By label    tipoCEP    Caixa Postal Comunitária
#     Click Button    btn_pesquisar
#
# Selecionar um item por value
#     Sleep    2
#     Select From List By Value     tipoCEP     GRU
#     Click Button    btn_pesquisar
