# frozen_string_literal: true
require "./game.rb"

class User
  attr_accessor :id

  def initialize(number)
    @id = number
    @total_money = Game::PLAYER_INITIAL_AMOUNT
    @assets = 0
    @current_position = -1
  end

  def play_move(dice_output, cell_array, bank)
    update_position(dice_output, cell_array.length)
    cell = cell_array[@current_position]
    return unless cell
    cell.process_move(bank, self)
  end

  def update_position(dice_output, cells_length)
    @current_position = (@current_position + dice_output) % cells_length
  end

  def add_money(amount)
    @total_money = @total_money + amount
  end

  def deduct_money(amount)
    @total_money = @total_money - amount
  end

  def add_asset(amount)
    @assets = @assets + amount
  end

  def current_money
    @total_money
  end

  def asset_money
    @assets
  end

  def can_afford(value)
    @total_money >= value
  end

end
