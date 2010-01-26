require 'decorator'

class LightsDecorator < Decorator

  def decorations
    'LIGHTS, ' + @christmas_decoration.decorations
  end

end
