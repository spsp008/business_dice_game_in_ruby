# frozen_string_literal: true
require './jail_cell.rb'
require './lottery_cell.rb'
require './hotel_cell.rb'
require './user.rb'
require './bank.rb'

class Game

  PLAYER_INITIAL_AMOUNT = 1000
  BANKS_INITIAL_AMOUNT = 5000
  JAIL_FINE = 150
  LOTTERY_VALUE = 200

  def start_game(number_of_users, cell_array, dice_output)
    intialize_cell_objects(cell_array)
    play_game(number_of_users, dice_output)
  end

  private

  def intialize_cell_objects(cell_array)
    @cell_objects = []
    cell_array.each_with_index do |cell, index|
      new_cell = nil
      if cell == 'J'
        new_cell = JailCell.new
      elsif cell == 'L'
        new_cell = LotteryCell.new
      elsif cell == 'H'
        new_cell = HotelCell.new(index)
      end
      @cell_objects.push(new_cell)
    end
  end

  def play_game(number_of_users, dice_output)
    return if !number_of_users || number_of_users < 2

    bank = Bank.new

    users = set_users(number_of_users)

    execute_moves(dice_output, users, bank)

    show_result(users, bank)
  end

  def set_users(number_of_users)
    users = []
    number_of_users.times do |i|
      new_user = User.new(i+1)
      users.push(new_user)
    end
    users
  end

  def execute_moves(dice_output, users, bank)
    chance = 0

    dice_output.each_with_index do |val, index|
      user = users[chance]
      user.play_move(val, @cell_objects, bank)
      chance = (chance + 1) % users.length
    end
  end

  def show_result(users, bank)
    users.each do |user|
      puts "user#{user.id}: money: #{user.current_money}, asset: #{user.asset_money}"
    end
    puts "bank: #{bank.current_money}"
    puts "The winner is: USER #{get_winner(users).id}"
  end

  def get_winner(users)
    winner = nil;
    users.each do |user|
      unless winner
        winner = user
        next
      end
      winner = user if user.current_money > winner.current_money
    end
    winner
  end

end
