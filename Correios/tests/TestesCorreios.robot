*** Settings ***
Resource           ../resource/Resource.robot
Test Setup         Abrir navegador
Test Teardown      Fechar navegador

*** Test Case ***

CT 01 - Buscar CEP válido
    Acessar a página home do site
    Vericicar se tem barra de cookies
    Digitar CEP no campo de texto
    Alternar janela do navegador
    Conferir Logradouro/Nome
    Conferir Bairro/Distrito
    Conferir Localidade/UF
    Conferir CEP

CT 02 - Buscar CEP inválido
    Acessar a página home do site
    Vericicar se tem barra de cookies
    Digitar CEP no campo de texto
    Alternar janela do navegador
    Conferir mensagem CEP inválido
