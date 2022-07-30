require('./graphics/line.rb')

class Triangle
  def self.draw(canvas,x1,y1,x2,y2,x3,y3,pen=nil)
    canvas.check(x1,y1,x2,y2)

    Line.draw(canvas,x2,y2,x1,y1,pen)
    Line.draw(canvas,x3,y3,x1,y1,pen)
    Line.draw(canvas,x2,y2,x3,y3,pen)
  end
end