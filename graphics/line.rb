class Line
  def self.draw(canvas,x1,y1,x2,y2,pen=nil)
    canvas.check(x1,y1,x2,y2)

    original = canvas.pen
    canvas.pen = pen unless pen.nil?

    if x1 == x2
      draw_vertical(canvas,x1, y1, y2)
    elsif y1 == y2
      draw_horizontal(canvas,x1, x2, y1)
    else
      draw_diagonal(canvas,x1,y1,x2,y2)
    end

    canvas.pen = original
  end

  private

  def self.draw_horizontal(canvas,x1,x2,y1)
    x1,x2 = x2,x1 if x1 > x2

    x = x1
    loop do
      canvas.draw(x,y1)
      x += 1
      break if x > x2
    end
  end

  def self.draw_vertical(canvas,x1, y1, y2)
    y1,y2 = y2,y1 if y1 > y2

    y = y1
    loop do
      canvas.draw(x1, y)
      y += 1
      break if y > y2
    end
  end

  def self.draw_diagonal(canvas,x1,y1,x2,y2)
    x_diff = (x2 - x1).abs
    y_diff = (y2 - y1).abs

    if x_diff > y_diff
      draw_diagonal_horizontally(canvas,x1,y1,x2,y2,y_diff)
    else
      draw_diagonal_vertically(canvas,x1,y1,x2,y2,x_diff)
    end
  end

  def self.draw_diagonal_horizontally(canvas,x1,y1,x2,y2,y_diff)
    x1,y1,x2,y2 = x2,y2,x1,y1 if x1 > x2

    x = x1
    y = y1
    step = (x2 - x1 + 1) / (y_diff + 1)
    y_inc = y2 > y1 ? 1 : -1

    loop do
      canvas.draw(x,y)
      y += y_inc if x % step == 0 and y != y2
      x += 1
      break if x > x2
    end
  end

  def self.draw_diagonal_vertically(canvas,x1,y1,x2,y2,x_diff)
    x1,y1,x2,y2 = x2,y2,x1,y1 if y1 > y2

    y = y1
    x = x1
    step = (y2 - y1 + 1) / (x_diff + 1)
    x_inc = x2 > x1 ? 1 : -1

    loop do
      canvas.draw(x,y)
      x += x_inc if y % step == 0 and x != x2
      y += 1
      break if y > y2
    end
  end
end