class Clippy
  def self.help
    puts
    puts('C width height        create a canvas: x in [1..width] y in [1..height]')
    puts('R x1 y1 x2 y2         draw a rectangle')
    puts('T x1 y1 x2 y2 x3 y3   draw a rectangle')
    puts('L x1 y1 x2 y2         draw a line')
    puts('B x y c               bucket fill with character c')
    puts('D x y c               draws the character c')
    puts('S x y message         write the message')
    puts('P x                   change the pen to x')
    puts('U                     undo the last command')
    puts('O my_file.txt         load commands from a file')
    puts('W my_file.txt         write commands to a file')
    puts('H                     show command history')
    puts('?                     help')
    puts('Q                     quit')
  end

  def self.is_canvas_command?(op)
    "RTLBPDS".include?(op)
  end

  def self.show_commands(commands)
    puts "command history:"
    commands.each_with_index { |p, i| puts "\t#{i + 1}: #{p}" }
  end

  def self.goodbye
    puts
    puts('thanks for using Picasso!')
    exit(0)
  end

  def self.misunderstanding
    puts "sorry, I don't understand you, try ? for help."
  end

  def self.error(e)
    puts "uh oh...something went wrong:"
    puts e
  end

  def self.prompt(canvas)
    canvas.display
    print "enter command:"
    gets.strip!
  end
end
