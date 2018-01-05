class Bike
  def working?
    true
  end

  def broken?
    true
  end

  def report_broken
    raise "Bike is broken" if broken?
    true
  end
end
