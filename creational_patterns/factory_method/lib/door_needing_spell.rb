require 'door'

class DoorNeedingSpell < Door

  def enter(spell)
    open? && spell.is_a?(Spell)
  end

end
