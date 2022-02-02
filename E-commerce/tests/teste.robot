*** Settings ***
Resource           ../resource/Resource.robot
Resource           ../resource/PO/Home.robot
Resource           ../resource/PO/Carrinho.robot
Resource           ../resource/PO/NovoUsuário.robot
Test Setup         Abrir navegador
Test Teardown      Fechar navegador

*** Test Case ***


CT 01 - Pesquisar produto existe
    Home.Acessar pagina home
    Home.Clicar no botão do carrinho
    Carrinho.Verificar se o carrinho está vazio
    Home.Pesquisar produto existente
    Home.Clicar no botão pesquisar
    Home.Clicar no botão "Add to Cart" do produto


CT 02 - Cadastrar novo usuário
    Home.Acessar pagina home
    Home.Cadastrar novo usuário
    NovoUsuário.Digitar nome no campo Username
    NovoUsuário.Digitar e-mail no campo e-mail
    NovoUsuário.Digitar senha no campo password
    NovoUsuário.Clicar no botão Register
    NovoUsuário.Clicar no botao ok de confirmação de cadastro
