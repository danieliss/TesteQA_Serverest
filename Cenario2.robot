*** Settings ***
Resource    Variables.robot
Resource    Cenario1.robot
Library     SeleniumLibrary
Library     OperatingSystem

*** Keywords ***
Abre navegador
    Open Browser    ${URL_SITE}    chrome    options=add_argument("--disable-save-password-bubble")
    Maximize Browser Window
    [Documentation]     Cenário de teste com autenticação no site Serverest e adição de item ao carrinho.
*** Test Cases ***

CT2 - Autenticação e adição de item ao carrinho de compra na loja virtual
    Abre navegador
    Wait Until Element Is Visible        ${CAMPO_INPUT_NOME}
    Input Text             ${CAMPO_INPUT_NOME}        ${LOGIN}
    Input Password         ${CAMPO_INPUT_SENHA}       ${PASS}  
    Click Element          ${BOTAO_ENTRAR}
    Wait Until Element Is Visible        ${CAMPO_PESQUISA}
    Input Text             ${CAMPO_PESQUISA}          PRODUTO
    click button            ${BOTAO_PESQUISA}
    Sleep    3
    Click Element            ${ITEM}
    Scroll Element Into View        ${BOTAO_ADD}
    Click Button    ${BOTAO_ADD}
    Sleep    5

