require './vending_machine'

class InputMoney
  def initialize(money)
    @money = money
  end

  def insert
    puts "Please insert your money:"
    money_input = gets.chomp
    if money_vaild?(money_input)
      @money += money_input.to_i
      v = VendingMachine.new(@money)
      puts "Total inserted: ¢#{@money}"
      v.get_input
    else
      puts "Not a valid coin."
      v = VendingMachine.new(@money)
      v.get_input
    end
  end

  def money_vaild?(money)
    (money.to_i == 1 || money.to_i % 5 == 0) && money.to_i < 26
  end
end
