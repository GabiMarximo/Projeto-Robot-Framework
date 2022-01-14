

*** Settings ***
Library     app.py

*** Test Cases ***
Deve retornar mensagem de boas vindas
  ${results}=          Welcome     Gabrielle
  Should be equal    ${results}    Olá Gabrielle, bem vinda ao Curso de Robot Framework!