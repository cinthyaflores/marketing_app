# frozen_string_literal: true

class AddPublishDateToPost < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :publish_date, :datetime
  end
end
