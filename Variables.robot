*** Settings ***
Library     FakerLibrary
*** Variables ***
${URL_SITE}               https://front.serverest.dev/login
${URL_USER}               https://front.serverest.dev/cadastrarusuarios
${LOGIN}                  dani@teste.com.br
${PASS}                   teste
${NOME}                   dani
${NOME_ADM}               admin
${LOGIN_ADM}              admin110@teste.com.br  
${CAMPO_INPUT_NOME}               //*[@id="email"]
${CAMPO_INPUT_SENHA}              //*[@id="password"]
${BOTAO_ENTRAR}                   //*[@id="root"]/div/div/form/button
${CAMPO_PESQUISA}                 //*[@id="root"]/div/div/div[1]/div/div[2]/input
${BOTAO_PESQUISA}                 //*[@id="root"]/div/div/div[1]/div/div[3]/button
${ITEM}                           //*[@id="root"]/div/div/div[2]/div/section/div[2]/div/a/img
${BOTAO_ADD}                      //*[@id="root"]/div/div/div/section/div/div[1]/a/button
${BOTAO_CADASTRO}                 //*[@id="root"]/div/div/form/small/a
${CADASTRO_NOME}                  //*[@id="nome"]
${CADASTRO_EMAIL}                 //*[@id="email"]
${CADASTRO_SENHA}                 //*[@id="password"]
${BOTAO_CONFIRMA_CADASTRO}        //*[@id="root"]/div/div/form/div[5]/button
${CHECKBOX_ADM}                   //*[@id="administrador"]
${CADASTRAR_novos_PRODUTOS}       //*[@id="root"]/div/div/div/form/div[6]/div/button
${NOME_PRODUTO}                   //*[@id="nome"]
${VALOR_PRODUTO}                  //*[@id="price"]
${DESCRICAO_PRODUTO}              //*[@id="description"]
${QUANT_PRODUTO}                  //*[@id="quantity"]
${CADASTRAR_PRODUTO}              //*[@id="root"]/div/div/p[2]/div[4]/div/div/a
                                