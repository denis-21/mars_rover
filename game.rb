class Game
  MOVES = ['D', 'U', 'R', 'L']
  COORDINATES= { D:[0,-1], U:[0,1], R:[1,0], L:[-1,0] }

  def initialize(map_x, map_y, start_position, route)
    @map_x, @map_y, @route = map_x, map_y, route.split("")
    check_route?
    @bild_map = BuildMap.new(map_x.to_i, map_y.to_i)
    @start_position = start_position.split(',')
    @position_x = @start_position[0].to_i
    @position_y = @start_position[1].to_i
  end

  def start
    @route.each do | step |
      go_to(step)
    end
    puts "Vashi koordinati teper po X: #{@position_x}, po Y: #{@position_y}"
  end

  def go_to(step)
    nex_step_x(COORDINATES[step.to_sym][0])
    nex_step_y(COORDINATES[step.to_sym][1])
  end

  def nex_step_x(new_x)
    next_step = @position_x + new_x
    if include_map_x?(next_step)
      @position_x = next_step
    else
      puts "GAME OVER!!! Marshohod vishel za predeli karti po osi X, tak kak novaya koordinata : #{next_step}"
      exit
    end
  end

  def nex_step_y(new_y)
    next_step = @position_y + new_y
    if include_map_y?(next_step)
      @position_y = next_step
    else
      puts "GAME OVER!!! Marshohod vishel za predeli karti po osi Y, tak kak novaya koordinata : #{next_step}"
      exit
    end
  end

  def check_route?
    @route.each do | step |
      unless MOVES.include?(step)
        puts 'V marshrute ne pravilnie simvoli'
        exit
      end
    end
  end

  def include_map_x?(x)
    (x >=0) && (x <= @bild_map.x)
  end

  def include_map_y?(y)
    (y >=0) && (y <= @bild_map.y)
  end
end
