*** Settings ***
Library     SeleniumLibrary

*** Variables ***

${TITULO_HOME}              QAZANDO Shop E-Commerce
${AREA_DO_CARRINHO}         xpath://*[@id="cart_area_one"]/div/div/div[1]
${BTN_LIMPAR_CARRINHO}      xpath://*[@id="cart_area_one"]//div[2]/button
${MSG_CARRO_VAZIO}          xpath://*[@id="empty_cart_area"]/div//h3
${BTN_CONTINUAR_COMPRANDO}  xpath://*[@id="empty_cart_area"]//div/a

*** Keywords ***

Verificar se o carrinho está vazio

    ${RESULT_VAZIO}=  Run Keyword And Return Status    Element Should Be Visible    ${MSG_CARRO_VAZIO}
    Run Keyword If    ${RESULT_VAZIO}    Click Button    ${BTN_CONTINUAR_COMPRANDO}

    ${RESULT_VAZIO}=  Run Keyword And Return Status    Element Should Not Be Visible  ${MSG_CARRO_VAZIO}
    Run Keyword If    ${RESULT_VAZIO}    Click Button    ${BTN_LIMPAR_CARRINHO}
