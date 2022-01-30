*** Settings ***
Library     SeleniumLibrary

*** Variables ***
${BROWSER}              firefox
${URL}                  https://www.correios.com.br/
${CEP_VALIDO}           63048200
${CEP_INVALIDO}         99.666-254
${LOGRADOURO}           Rua Vicente Ferreira Duarte
${BAIRRO}               Cidade Universitária
${LOCALIDADE}           Juazeiro do Norte/CE
${BARRA_COOKIES}        cookiesId
${BOTAO_COOKIES}        btnCookie
${CAMPO_CEP}            relaxation
${BTN_CEP}              xpath://*[@id="content"]/div[2]/div/div[2]/form/div[2]/button
${BTN_NOVA_BUSCA}       retornar
${RESULTADO_PESQUISA}   navegacao-resultado
${MENSAGEM ESPERADA}    "Não há dados a serem exibidos"
${RESULTADO_REAL}       mensagem-resultado

*** Keywords ***
Abrir navegador
    Open Browser     about:blank            ${BROWSER}

Fechar navegador
     Close Browser

Acessar a página home do site
    Go To             ${URL}

Vericicar se tem barra de cookies
    ${PRESENT}=  Run Keyword And Return Status    Element Should Be Visible   ${BARRA_COOKIES}
    Run Keyword If    ${PRESENT}  Click Element   ${BOTAO_COOKIES}

Digitar CEP no campo de texto
    Input Text        ${CAMPO_CEP}    ${CEP_VALIDO}
    Click Element     ${BTN_CEP}

### O site abre uma nova janela, então precisa ir para a nova janela ###
Alternar janela do navegador
    Sleep    1
    ${JANELAS_ABERTAS}=  Get Window Identifiers
    Log    "Janelas abertas:" ${JANELAS_ABERTAS}
    Close Window
    Switch Window   ${JANELAS_ABERTAS}[1]

### Conferências ###
Conferir Logradouro/Nome
    Wait Until Element Is Visible          ${RESULTADO_PESQUISA}
    Page Should Contain Element            ${RESULTADO_PESQUISA}       ${LOGRADOURO}

Conferir Bairro/Distrito
   Page Should Contain Element             ${RESULTADO_PESQUISA}       ${BAIRRO}

Conferir Localidade/UF
   Page Should Contain Element             ${RESULTADO_PESQUISA}       ${LOCALIDADE}

Conferir CEP
   Page Should Contain Element              ${RESULTADO_PESQUISA}       ${CEP_VALIDO}
   Wait Until Element Is Visible            ${BTN_NOVA_BUSCA}
   Click Element                            ${BTN_NOVA_BUSCA}

Conferir mensagem CEP inválido
    Wait Until Element Is Visible           ${RESULTADO_REAL}
    ${RESULTADO}      Get Text              ${RESULTADO_REAL}
    Should Be True    ${MENSAGEM_ESPERADA}  ${RESULTADO}
