class Text
  def self.draw(canvas,x1,y1,message)
    canvas.check(x1,y1)
    raise "missing value for message error" if message.empty?

    x = x1
    msg = message.chars

    loop do
      canvas.draw(x,y1,msg.shift)
      x += 1
      break if x > canvas.width or msg.empty?
    end
  end
end