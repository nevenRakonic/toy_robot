class Robot
  attr_reader :x, :y, :bearing
  MIN_LIMIT = 0
  MAX_LIMIT = 4
  
  def initialize
    @placed = false
  end

  def move
    case @bearing.facing
    when 'north'
      @y += 1 if @y < MAX_LIMIT
    when 'west'
      @x -= 1 if @x > MIN_LIMIT
    when 'south'
      @y -= 1 if @y > MIN_LIMIT
    when 'east'
      @x += 1 if @x < MAX_LIMIT
    end
  end

  def left
    @bearing.left
  end

  def right
    @bearing.right
  end

  def place(x, y, facing)
    if validate_place(x.to_i, y.to_i)
      @x = x.to_i
      @y = y.to_i
      @bearing = Bearing.new(facing)
      @placed = true
    end
  end

  def placed?
    @placed
  end

  def report
    puts "#{@x},#{@y},#{@bearing}"
  end

  private

    def validate_place(x, y)
      (x >= MIN_LIMIT && x <= MAX_LIMIT) && (y >= MIN_LIMIT && y <= MAX_LIMIT)
    end
end
