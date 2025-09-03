*** Settings ***
Library    RequestsLibrary
Library    Collections

Suite Setup    Setup API

*** Variables ***
${BASE_URL}               https://serverest.dev
${NOME_USUARIO}           Testador QA
${SENHA_USUARIO}          teste1234
${ADMIN}                  true
${NOME_PRODUTO}           Livros QAs
${PRECO_PRODUTO}          39
${DESC_PRODUTO}           Livro: Tecnologia para todos
${QTD_PRODUTO}            199
${EMAIL_DOMINIO}          gmail.com

*** Keywords ***
Setup API
    [Documentation]    Configura a sessão, cria usuário admin e faz login 

    # Gera email
    ${RANDOM}=    Evaluate    __import__('random').randint(1000,9999)
    ${EMAIL_USUARIO}=    Set Variable    testadoraqa_${RANDOM}@${EMAIL_DOMINIO}
    Set Suite Variable    ${EMAIL_USUARIO}

    # Criar usuário
    ${body_user}=    Create Dictionary
    ...    nome=${NOME_USUARIO}
    ...    email=${EMAIL_USUARIO}
    ...    password=${SENHA_USUARIO}
    ...    administrador=${ADMIN}
    ${resp_user}=    POST On Session    serverest    /usuarios    json=${body_user}
    Log    Cadastro usuário status: ${resp_user.status_code}

    ${body_login}=    Create Dictionary
    ...    email=${EMAIL_USUARIO}
    ...    password=${SENHA_USUARIO}
    ${resp_login}=    POST On Session    serverest    /login    json=${body_login}
    Should Be Equal As Integers    ${resp_login.status_code}    200

    ${TOKEN}=    Set Variable    ${resp_login.json()["authorization"]}
    Set Suite Variable     ${TOKEN}

*** Test Cases ***
Cenário 1 - Validar login
    Should Not Be Empty     ${TOKEN}
    Log    Token atual:     ${TOKEN}  

Cenário 2 - Cadastrar produto
    ${body}=    Create Dictionary
    ...    nome=${NOME_PRODUTO}
    ...    preco=${PRECO_PRODUTO}
    ...    descricao=${DESC_PRODUTO}
    ...    quantidade=${QTD_PRODUTO}
    
    ${headers}=    Create Dictionary    Authorization=${TOKEN}
    
    ${resp_prod}=    POST On Session    serverest    /produtos    json=${body}    headers=${headers}
    Should Be Equal As Integers    ${resp_prod.status_code}    201
    ${ID_PROD}=    Set Variable    ${resp_prod.json()["_id"]}
    Log    Produto criado com ID: ${ID_PROD}
