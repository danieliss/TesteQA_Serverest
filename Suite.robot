*** Settings ***
Resource    Cenario1.robot
Resource    Cenario2.robot    
Resource    Cenario3.robot
Resource    Variables.robot

*** Test Cases ***
Abrir Navegador
    Open Browser    ${URL_SITE}    chrome    options=add_argument("--disable-save-password-bubble")
    Maximize Browser Window

