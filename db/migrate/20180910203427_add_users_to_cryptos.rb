class AddUsersToCryptos < ActiveRecord::Migration[5.1]
  def change
    add_reference :cryptos, :user, foreign_key: true
  end
end
