

from unittest import result


def welcome(nome):
    return "Olá " + nome + ", bem vinda ao Curso de Robot Framework!"

result = welcome("Gabrielle")
print(result)