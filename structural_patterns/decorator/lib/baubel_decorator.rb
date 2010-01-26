require 'decorator'

class BaubelDecorator < Decorator

  def decorations
    'BAUBELS, ' + @christmas_decoration.decorations
  end

end
