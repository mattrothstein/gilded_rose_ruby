module BetterWithAge
  def increment_quality
    return if max_quality?

    @quality += 1
  end

  def max_quality?
    @quality >= 50
  end
end
