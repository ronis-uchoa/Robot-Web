*** Settings ***
Resource           ../resource/Resource.robot
Test Setup         Abrir navegador
Test Teardown      Fechar navegador

*** Test Case ***

CT 01 - Usando o Dropdown no site dos correios
    Acessar a página home do site
    Digitar um cep no campo de texto
    Selecionar um item por index
    Conferir Logradouro/Nome: "Rua Vicente Ferreira Duarte"
    Conferir Bairro/Distrito: "Cidade Universitária"
    Conferir Localidade/UF: "Juazeiro do Norte/CE"
    Conferir CEP: "63048-200"
    Pesquisar CEP inválido: "99.666-254"
    Conferir mensagem "Não há dados a serem exibidos"
