class Canvas
  attr_reader :pixels, :height, :width
  attr_accessor :pen

  def initialize(width, height)
    if width < 4 or height < 4 or width > 40 or height > 40
      raise "canvas dimensions should be: height(4-10) width(4-40)"
    end

    @pixels = " " * (width * height)
    @height = height
    @width = width
    @pen = 'x'
  end

  def draw(x,y,pen=nil)
    if pen.nil?
      pen = @pen
    elsif pen.length != 1
      raise "invalid pen, must be a single character"
    end

    i = index(x, y)
    pixels[i] = pen
  end

  def [](x, y)
    i = index(x, y)
    pixels[i]
  end

  def pen=(c)
    raise "invalid pen error, must be a single character" if c.length != 1
    @pen=c
  end

  def check(x1,y1,x2=1,y2=1,x3=1,y3=1)
    raise "out of range error" unless x1.between?(1,@width)
    raise "out of range error" unless x2.between?(1,@width)
    raise "out of range error" unless x3.between?(1,@width)
    raise "out of range error" unless y1.between?(1,@height)
    raise "out of range error" unless y2.between?(1,@height)
    raise "out of range error" unless y3.between?(1,@height)
  end

  def display
    line = "*" * (@width + 2)

    puts
    puts(line)

    (1..@height).each do |y|
      print("*")
      (1..@width).each do |x|
        i = index(x, y)
        print(pixels[i] ||= ' ')
      end

      puts("*")
    end

    puts(line)
  end

  private

  def index(x, y)
    ((y - 1) * @width) + x - 1
  end
end
