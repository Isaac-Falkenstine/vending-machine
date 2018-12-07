require './vaild_coins'
require './contents'
require './input_money'
require './purchase'

class VendingMachine

  def initialize(money)
    file = File.read('tiny_vending_machine.json')
    @contents = JSON.parse(file)
    @money = money
  end

  def talk
    puts "Hello, please enter a command:"
    puts "(c)ontents - Prints the contents of the vending machine."
    puts "(i)nsert money - Takes in coins and prints total money inserted."
    puts "(v)alid coin values - Prints the valid coins inputs"
    puts "(p)urchase - Displays a prompt to enter the slot you'd like to purchase."
    puts "(q)uit"
  end

  def get_input
    puts "Please enter command:"
    input = gets.chomp

    if input == "c"
      c = Contents.new(@contents)
      c.talk
      self.get_input
    elsif input == "i"
      i = InputMoney.new(@money)
      i.insert
    elsif input == "v"
      v = ValidCoins.new
      v.talk
      self.get_input
    elsif input == "p"
      purchase = Purchase.new(@money, @contents)
      purchase.buy
    elsif input == "q"
      exit
    else
      puts "Input not recognised. Please try again"
      self.get_input
    end
  end
end
