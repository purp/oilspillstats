class Time
  def to_simile
    self.to_formatted_s("%m/%d/%Y %H:%M:%S %Z").to_json
  end
end

class String
  def truncate(len = 20, marker = '...')
    self.size > len ? self[0..(len - marker.size - 1)] + marker : self
  end
end
