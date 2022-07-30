require('./graphics/line.rb')

class Rectangle
  def self.draw(canvas,x1,y1,x2,y2,pen=nil)
    canvas.check(x1,y1,x2,y2)

    Line.draw(canvas,x1,y1,x2,y1,pen)
    Line.draw(canvas,x1,y1,x1,y2,pen)
    Line.draw(canvas,x2,y1,x2,y2,pen)
    Line.draw(canvas,x1,y2,x2,y2,pen)
  end
end
