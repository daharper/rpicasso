class Fill
  def self.plot(canvas,x,y,target)
    if canvas[x,y] == target
      canvas.draw(x,y)
      plot(canvas,x-1,y,target) if x > 1
      plot(canvas,x,y-1,target) if y > 1
      plot(canvas,x+1,y,target) if x < canvas.width
      plot(canvas,x,y+1,target) if y < canvas.height
    end
  end

  def self.draw(canvas,x,y,pen)
    canvas.check(x,y)

    original = canvas.pen
    canvas.pen = pen

    Fill.plot(canvas,x,y,canvas[x,y])

    canvas.pen = original
  end
end