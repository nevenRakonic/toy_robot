class Bearing
  attr_reader :facing

  def initialize(facing)
    @facing = facing
  end

  def left
    @facing = transition.key(@facing)
  end

  def right
    @facing = transition[@facing]
  end

  def to_s
    @facing.upcase
  end

  private

    def transition
      {
        'north' => 'east',
        'east' => 'south',
        'south' => 'west',
        'west' => 'north'
      }
    end
end
