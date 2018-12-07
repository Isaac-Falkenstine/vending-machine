require 'json'
require 'pry'
require './vending_machine'

vend = VendingMachine.new(0)
vend.talk
vend.get_input
