class Text
  def self.draw(canvas,x1,y1,message)
    canvas.check(x1,y1)
    raise "missing value for message error" if message.empty?

    msg = message.chars

    loop do
      canvas.draw(x1,y1,msg.shift)
      x1 += 1
      break if x1 > canvas.width or msg.empty?
    end
  end
end
