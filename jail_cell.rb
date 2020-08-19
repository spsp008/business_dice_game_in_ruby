# frozen_string_literal: true
require "./cell.rb"

class JailCell < Cell
  JAIL_FINE = 150

  def process_move(bank, user)
    return if user.current_money < JAIL_FINE
    user.deduct_money(JAIL_FINE)
    bank.add_money(JAIL_FINE)
  end

end
