require_relative 'operations'

module Calculator
  class Menu
    def initialize
      operations = Operations.new
      puts "------------------------------------"
      puts "|Bem vindo a calculadora dos brabos|"
      puts "------------------------------------"
      puts "Selecione:"
      puts "1: Média preconceituosa"
      puts "2: Calculadora sem números"
      puts "3: Filtro de filmes"
      puts "0: Sair"

      op = gets.chomp.to_i
      system "clear || cls"
      

      case op
      when 0
        exit

      when 1
        puts "Insira as notas"
        grades = gets.chomp

        puts "\nInsira o nome dos alunos a serem desconsiderados"
        blacklist = gets.chomp        
        
        mean = operations.biased_mean(grades,blacklist)
        system "clear || cls"          
        puts "\nA média final é : #{mean.to_s}"
        puts "\nPressione enter para continuar"
        gets.chomp
        system "clear || cls"

      when 2
        puts "Insira o número a saber se é divisível por 25"
        numbers = gets.chomp

        ans = operations.no_integers(numbers)
        puts "\nResultado: "
        puts ans
        puts "\nPressione enter para continuar"
        gets.chomp
        system "clear || cls"

      when 3
        puts "Insira os gêneros:"
        genres = gets.chomp
        puts "Insira o ano:"
        year = gets.chomp.to_i

        movies = operations.filter_films(genres, year)
        puts "\nResultado: "
        puts movies
        puts "\nPressione enter para continuar"
        gets.chomp
        system "clear || cls"
      end
        
    end
  end
end
