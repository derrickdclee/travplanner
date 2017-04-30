class AddReferenceToTravelday < ActiveRecord::Migration[5.0]
  def change
    add_reference :traveldays, :post, index: true, foreign_key: true
  end
end
