# frozen_string_literal: true
require "./cell.rb"
class HotelCell < Cell

  STATUSES = [
    {name: 'silver', value: 200, rent: 50},
    {name: 'gold', value: 300, rent: 150},
    {name: 'platinum', value: 500, rent: 300}
  ].freeze

  def initialize(number)
    @owner = nil
    @status = 0
  end

  def process_move(bank, user)
    if !@owner
      buy(user, bank)
    else
      if @owner.id == user.id
        upgrade(user, bank)
      else
        rent(user)
      end
    end
  end

  def status
    @status
  end

  private

  def buy(user, bank)
    value = STATUSES[@status][:value]
    if user.can_afford(value)
      user.deduct_money(value)
      user.add_asset(value)
      bank.add_money(value)
      @owner = user
    end
  end

  def rent(user)
    value = STATUSES[@status][:rent]
    if user.can_afford(value)
      user.deduct_money(value)
      @owner.add_money(value)
    end
  end

  def upgrade(user, bank)
    return if @status == STATUSES.length
    new_status = @status + 1
    value = STATUSES[new_status][:value] - STATUSES[@status][:value]
    if user.can_afford(value)
      user.deduct_money(value)
      user.add_asset(value)
      bank.add_money(value)
      @status = new_status
    end
  end

end
