class Time
  def to_simile
    self.to_formatted_s("%m/%d/%Y %H:%M:%S %Z").to_json
  end
end