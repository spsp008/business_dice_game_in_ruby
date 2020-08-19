# frozen_string_literal: true
require "./cell.rb"

class LotteryCell < Cell
  LOTTERY_VALUE = 200

  def process_move(bank, user)
    user.add_money(LOTTERY_VALUE)
    bank.deduct_money(LOTTERY_VALUE)
  end
end
