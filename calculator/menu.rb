require_relative 'operations'

module Calculator
  class Menu
    def initialize
      operations = Operations.new
      puts '------------------------------------'
      puts '|Bem vindo a calculadora dos brabos|'
      puts '------------------------------------'
      puts 'Selecione:'
      puts '1: Média preconceituosa'
      puts '2: Calculadora sem números'
      puts '3: Filtro de filmes'
      puts '0: Sair'

      op = gets.chomp.to_i
      system "clear || cls"
      

      case op
      when 0
        exit

      when 1
        puts "Insira as notas"
        grades = gets.chomp

        puts = "Insira o nome dos alunos a serem desconsiderados"
        blacklist = gets.chomp
        
        mean = operations.biased_mean(grades, blacklist)
        system "clear || cls"
        puts 'a média final é: '+mean.to_s

      end
        
    end
  end
end
