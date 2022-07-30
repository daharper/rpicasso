require './graphics/canvas.rb'
require './graphics/line.rb'
require './graphics/rectangle.rb'
require './graphics/triangle.rb'
require './graphics/fill.rb'
require './graphics/text.rb'
require './clippy.rb'

class Picasso
  def run
    execute("c 20 4")

    loop do
      command = Clippy.prompt(@canvas)
      begin
        execute(command) unless command.empty?
      rescue => e
        Clippy.error(e)
      end
    end
  end

  private

  def execute(command)
    @args = command.chomp.split(/\s+/)
    op = @args[0].upcase

    case op
    when 'C'
      @canvas = Canvas.new(x1, y1)
      @commands = [command]
    when 'R'
      Rectangle.draw(@canvas,x1,y1,x2,y2,pen(5))
    when 'T'
      Triangle.draw(@canvas,x1,y1,x2,y2,x3,y3,pen(7))
    when 'L'
      Line.draw(@canvas,x1,y1,x2,y2,pen(5))
    when 'B'
      Fill.draw(@canvas,x1,y1,pen(3))
    when 'P'
      @canvas.pen = pen(1)
    when 'O'
      File.foreach(filename) { |cmd| execute(cmd)}
    when 'W'
      File.open(filename, "w") { |f| f.puts(@commands) }
    when 'U'
      @commands.pop if @commands.length > 1
      @commands.each { |cmd| execute(cmd) }
    when 'D'
      @canvas.draw(x1,y1,@args[3])
    when 'S'
      Text.draw(@canvas,x1,y1,@args[3..].join(' '))
    when 'H'
      Clippy.show_commands(@commands)
    when '?'
      Clippy.help
    when 'Q'
      Clippy.goodbye
    else
      Clippy.misunderstanding
    end

    @commands << command if Clippy.is_canvas_command?(op)
  end

  # argument extraction helper functions

  def x1 = @args[1].to_i
  def y1 = @args[2].to_i
  def x2 = @args[3].to_i
  def y2 = @args[4].to_i
  def x3 = @args[5].to_i
  def y3 = @args[6].to_i

  def filename = File.join("demos", @args[1])
  def pen(i) = @args[i].nil? ? nil : @args[i][0]
end

Picasso.new.run