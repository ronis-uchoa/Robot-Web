*** Settings ***
Resource           ../resource/Resource.robot
Test Setup         Abrir navegador
Test Teardown      Fechar navegador

*** Test Case ***

CT 01 - Buscar cep válido e inválido
    Acessar a página home do site
    Vericicar se tem barra de cookies
    Digitar CEP válido no campo de texto: 63048200
    Alternar janela do navegador
    Conferir Logradouro/Nome: "Rua Vicente Ferreira Duarte"
    Conferir Bairro/Distrito: "Cidade Universitária"
    Conferir Localidade/UF: "Juazeiro do Norte/CE"
    Conferir CEP: "63048-200"
    Pesquisar CEP inválido: 99.666-254
    Selecionar um item por index na lista tipo de CEP
    Conferir mensagem "Não há dados a serem exibidos"
