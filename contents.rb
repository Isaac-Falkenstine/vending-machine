class Contents
  def initialize(data_hash)
    @data_hash = data_hash
  end

  def talk
    @data_hash["contents"].first.each do |item|
      puts "-------------------------------------------"
      puts "Slot: #{item.first}"
      puts "Item: #{item.last["contents"].first["type"]}"
      puts "Cost: ¢#{item.last["cost"]}"
      puts "Capacity: #{item.last["cost"]}"
      puts "-------------------------------------------"
    end
  end
end
