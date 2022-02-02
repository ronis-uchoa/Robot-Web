*** Settings ***
Library     SeleniumLibrary

*** Variables ***
${URL}                      http://automationpratice.com.br/
${LUPA}                     xpath://*[@id="root"]//ul/li[3]/a/img
${PESQUISA_PRODUTO}         xpath://*[@id="search"]//input
${BTN_PESQUISA}             xpath://form/button
${PRODUTO}                  T-shirt For Men
${BTN_CONFIRMA}             xpath://div[3]//div[6]/button[1]
${TITULO_HOME}              QAZANDO Shop E-Commerce
${ADD_PROD_EXISTENTE}       xpath://div[2]/div/div[1]/button
${BTN_CARRINHO}             xpath://*[@id="root"]/header//div/ul/li[2]/a
${BTN_VER_CARRINHO}         xpath://*[@id="offcanvas-add-cart"]//ul[2]/li[1]/a
${BTN_CADASTRO}             xpath://*[@id="top_header"]//div/ul/li[2]/a

*** Keywords ***

Acessar pagina home
    Go To                             ${URL}
    Title Should Be                   ${TITULO_HOME}
    Wait Until Element Is Visible     ${LUPA}

Cadastrar novo usuário
    Wait Until Element Is Visible     ${BTN_CADASTRO}
    Click Element                     ${BTN_CADASTRO}

Pesquisar produto existente
    Click Element                     ${LUPA}
    Wait Until Element Is Visible     ${PESQUISA_PRODUTO}
    Input Text  ${PESQUISA_PRODUTO}   ${PRODUTO}

Clicar no botão pesquisar
    Click Button                      ${BTN_PESQUISA}
    Wait Until Element Is Visible     ${BTN_CONFIRMA}
    Click Element                     ${BTN_CONFIRMA}

Clicar no botão "Add to Cart" do produto
    Mouse Over                        ${ADD_PROD_EXISTENTE}
    Wait Until Element Is Visible     ${ADD_PROD_EXISTENTE}
    Click Button                      ${ADD_PROD_EXISTENTE}

Clicar no botão do carrinho
    Click Element                      ${BTN_CARRINHO}
    Wait Until Element Is Visible      ${BTN_VER_CARRINHO}
    Click Element                      ${BTN_VER_CARRINHO}
