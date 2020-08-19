# frozen_string_literal: true
require "./game.rb"

class Bank
  def initialize
    @total_money = Game::BANKS_INITIAL_AMOUNT
  end

  def add_money(amount)
    @total_money = @total_money + amount
  end

  def deduct_money(amount)
    @total_money = @total_money - amount
  end

  def current_money
    @total_money
  end

end
