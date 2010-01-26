require 'decorator'

class TinselDecorator < Decorator

  def decorations
    'TINSEL, ' + @christmas_decoration.decorations
  end

end
