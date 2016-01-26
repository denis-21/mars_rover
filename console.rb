require_relative 'build_map'
require_relative 'game'

class Console
  def user_greet
    puts 'Welcome to the game!'
    puts 'Vvedite koordinati karti :'
    puts 'po osi X:'
    map_x = gets.chomp!
    check_valid_numbers?(map_x)
    puts 'po osi Y:'
    map_y = gets.chomp!
    check_valid_numbers?(map_y)

    puts 'Vvedite tochky starta marsahoda (primer: 1,5)'
    start_position = gets.chomp!

    puts 'Vvedite vash marshrut iz bukv (primer : DRLU)'
    puts 'S - eto vniz'
    puts 'N - eto vverh'
    puts 'E - eto vpravo'
    puts 'W - eto vlevo'
    route = gets.chomp!

    @game = Game.new(map_x, map_y, start_position, route)
    @game.start

  end

  def check_valid_numbers?(numer)
    if numer.match(/^[1-9]/)
      true
    else
      puts 'Vi vveli ne cifry'
      exit
    end
  end
end

s = Console.new
s.user_greet
