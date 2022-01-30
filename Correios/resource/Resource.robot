*** Settings ***
Library     SeleniumLibrary

*** Variables ***
${BROWSER}              firefox
${URL}                  https://www.correios.com.br/
${BARRA_COOKIES}        xpath://*[@id="cookiesId"]/div
${BOTAO_COOKIES}        xpath://*[@id="btnCookie"]
${CAMPO_CEP}            xpath://*[@id="relaxation"]
${BTN_CEP}              xpath://*[@id="content"]/div[2]/div/div[2]/form/div[2]/button
${BTN_NOVA_BUSCA}       xpath://*[@id="retornar"]/div/div
${RESULTADO_PESQUISA}   xpath://*[@id="navegacao-resultado"]
${LISTA_TIPO_CEP}       xpath:/html/body/main/form/div[1]/div[1]/div/div[2]/div/div[2]/select
${BTN_PESQUISAR}        xpath://*[@id="btn_pesquisar"]
${CAMPO_CEP_ENDERECO}   xpath://*[@id="endereco"]
${RESULTADO_REAL}       xpath://*[@id="mensagem-resultado"]

*** Keywords ***
Abrir navegador
    Open Browser                      about:blank            ${BROWSER}

Fechar navegador
     Close Browser

Acessar a página home do site
    Go To                             ${URL}

Vericicar se tem barra de cookies
    ${PRESENT}=  Run Keyword And Return Status    Element Should Be Visible   ${BARRA_COOKIES}
    Run Keyword If    ${PRESENT}  Click Element   ${BOTAO_COOKIES}

### Buscando CEP válido ###
Digitar CEP válido no campo de texto: ${CEP}
    Input Text                        ${CAMPO_CEP}    ${CEP}
    Click Element     ${BTN_CEP}

### O site abre uma nova janela, então precisa ir para a nova janela ###
Alternar janela do navegador
    Sleep    1
    ${JANELAS_ABERTAS}=  Get Window Identifiers
    Log    "Janelas abertas:" ${JANELAS_ABERTAS}
    Close Window
    Switch Window   ${JANELAS_ABERTAS}[1]

### Conferências ###
Conferir Logradouro/Nome: ${RUA}
    Wait Until Element Is Visible     ${RESULTADO_PESQUISA}
    Page Should Contain Element       ${RESULTADO_PESQUISA}       ${RUA}

Conferir Bairro/Distrito: ${BAIRRO}
   Page Should Contain Element        ${RESULTADO_PESQUISA}       ${BAIRRO}

Conferir Localidade/UF: ${CIDADE}
   Page Should Contain Element        ${RESULTADO_PESQUISA}       ${CIDADE}

Conferir CEP: ${CEP}
   Page Should Contain Element        ${RESULTADO_PESQUISA}       ${CEP}
   Wait Until Element Is Visible      ${BTN_NOVA_BUSCA}
   Click Element                      ${BTN_NOVA_BUSCA}

### Buscando CEP inválido###
Pesquisar CEP inválido: ${CEP_INVALIDO}
    Wait Until Element Is Visible     ${CAMPO_CEP_ENDERECO}
    Input Text                        ${CAMPO_CEP_ENDERECO}       ${CEP_INVALIDO}

Selecionar um item por index na lista tipo de CEP
     Select From List By Index        ${LISTA_TIPO_CEP}          0
     Click Button                     ${BTN_PESQUISAR}

### Conferência ###
Conferir mensagem ${MENSAGEM_ESPERADA}
    Wait Until Element Is Visible           ${RESULTADO_REAL}
    ${RESULTADO}      Get Text              ${RESULTADO_REAL}
    Should Be True    ${MENSAGEM_ESPERADA}  ${RESULTADO}
