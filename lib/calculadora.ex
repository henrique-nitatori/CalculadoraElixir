defmodule Calculadora do

    def main do
        numeros = []

        numero1 = IO.gets("Digite o primeiro numero da operação:")

        operacao = IO.gets("Digite a operação:")

        numero2 = IO.gets("Digite o segundo numero da operação:")

        numeros = [string_para_inteiro(numero1) | numeros]
        numeros = [string_para_inteiro(numero2) | numeros]

        operacoes(String.trim(operacao), numeros)

        restartar()

    end
    def restartar() do
        resposta = IO.gets("Deseja fazer outra operação S / N?")
        respostaSemQuebraDeLinha = String.trim(resposta)
        if respostaSemQuebraDeLinha === "N" do
            exit(:Desligado)
        end
        if respostaSemQuebraDeLinha !== "N" and respostaSemQuebraDeLinha !== "S" do
        restartar()
        end
        main()

    end
    def operacoes(operacao, numeros) do
        cond do
            operacao === "/" -> IO.puts('O resultado da divisão é -> #{divisao(numeros)}')
            operacao === "+" -> IO.puts('O resultado da soma é -> #{soma(numeros)}')
            operacao === "*" -> IO.puts('O resultado da multiplicacao é -> #{multiplicacao(numeros)}')
            operacao === "-" -> IO.puts('O resultado da subtracao é -> #{subtracao(numeros)}')
            true -> IO.puts('Essa operacao #{operacao} não existe')
        end
    end
    def string_para_inteiro (string) do
        String.trim(string) |> String.to_integer
    end
    def soma(numeros) do
        Enum.reduce(numeros, fn x, acc -> x + acc end)
    end
    def multiplicacao(numeros) do
        Enum.reduce(numeros, fn x, acc -> x * acc end)
    end
    def divisao(numeros) do
        [head | tail] = numeros
        if head === 0 do
            IO.puts('O divisor não pode ser zero')
            main()
        end
        Enum.reduce(numeros, fn x, acc -> x / acc end)
    end
    def subtracao(numeros) do
        Enum.reduce(numeros, fn x, acc -> x - acc end)
    end
end
