*** Settings ***
Resource    Variables.robot
Resource    Cenario2.robot
Library     SeleniumLibrary

*** Keywords ***
Abre Navegador
    Open Browser    ${URL_SITE}    chrome    options=add_argument("--disable-save-password-bubble")
    Maximize Browser Window
*** Test Cases ***
CT1 - Cadastro via tela
    Abre Navegador
    Sleep    2
    Wait Until Element Is Visible        ${BOTAO_CADASTRO}
    Click Element                        ${BOTAO_CADASTRO}
    Sleep    2
    Input Text        ${CADASTRO_NOME}       ${NOME_ADM}  
    Input Text        ${CADASTRO_EMAIL}      ${LOGIN_ADM}  
    Input Password    ${CADASTRO_SENHA}      ${PASS}
    Sleep    3
    Select Checkbox    ${CHECKBOX_ADM}
    Sleep    3
    Click Element    ${BOTAO_CONFIRMA_CADASTRO}
    Sleep    4

CT3 - Autenticação com admin e inclui um produto da lista de produtos a venda
    Wait Until Element Is Visible    ${CADASTRAR_PRODUTO}
    Click Element          ${CADASTRAR_PRODUTO}
    Input Text             ${NOME_PRODUTO}          LIVRO: Tecnologia
    Input Text             ${VALOR_PRODUTO}         59
    Input Text             ${DESCRICAO_PRODUTO}     Livro sobre a evolução tecnológica desde 1960 até o momento. BEST SELLER.
    Input Text             ${QUANT_PRODUTO}         99
    Scroll Element Into View     ${CADASTRAR_novos_PRODUTOS}     
    Click Element                ${CADASTRAR_novos_PRODUTOS}          
    Sleep    5