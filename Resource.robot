*** Settings ***
Documentation     Suíte de testes Serverest
Resource        Suite.robot
Resource        teste_usuario.robot
Test Setup        Abrir o navegador
Test Teardown     Fechar o navegador

#
