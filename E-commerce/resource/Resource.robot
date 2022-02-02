*** Settings ***
Library     SeleniumLibrary

*** Variables ***
${BROWSER}      firefox

*** Keywords ***
Abrir navegador
    Open Browser    about:blank     ${BROWSER}

Fechar navegador
     Close Browser
