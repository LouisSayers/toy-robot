class Grid

  def initialize(rows, cols)
    @rows = rows
    @cols =  cols
    ensure_valid_size!(rows, cols)
  end

  def position_valid?(position)

  end

  private

  def ensure_valid_size!(rows, cols)
    valid = [rows, cols].all? { |item| item > 0 }
    raise ArgumentError.new('Grid rows, columns must be > 0') unless valid
  end

end
