*** Settings ***
Resource    Variables.robot
Library     SeleniumLibrary
Library     OperatingSystem

*** Keywords ***
Abrir Navegador
    Open Browser    ${URL_SITE}    chrome    options=add_argument("--disable-save-password-bubble")
    Maximize Browser Window

     [Documentation]     Teste: Cadastro de usuário por formulário em tela.
*** Test Cases ***
CT1 - Cadastro via tela
    Abrir Navegador
    Wait Until Element Is Visible        ${BOTAO_CADASTRO}
    Click Element                        ${BOTAO_CADASTRO}
    Sleep    2
    Input Text        ${CADASTRO_NOME}       ${NOME}  
    Input Text        ${CADASTRO_EMAIL}      ${LOGIN}  
    Input Password    ${CADASTRO_SENHA}      ${PASS}
    Click Element    ${BOTAO_CONFIRMA_CADASTRO}
    Sleep    4