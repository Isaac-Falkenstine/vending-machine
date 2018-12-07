require './vending_machine'

class Purchase
  def initialize(money, data_hash)
    @money = money
    @data_hash = data_hash
  end

  def buy
    puts "Please enter the slot of the item you'd like to vend:"
    slot = gets.chomp
    @data_hash["contents"].first.each do |item|
      item_slot = item.first
      if slot == item_slot
        if @money >= item.last["cost"].to_i
          @money -= item.last["cost"].to_i
          puts "Vending..."
          puts " "
          sleep(3)
          puts "Enjoy your #{item.last["contents"].first["type"]}!"
          exit
        else
          puts "Insufficient funds. Please (i)nsert more money."
          v = VendingMachine.new(@money)
          v.get_input
        end
      end
    end
    puts "Not a valid slot...."
  end
end
