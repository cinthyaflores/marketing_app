# frozen_string_literal: true

# == Schema Information
#
# Table name: edges
#
#  id          :bigint           not null, primary key
#  from_id     :bigint
#  to_id       :bigint
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  campaign_id :bigint
#

class Edge < ApplicationRecord
  belongs_to :from, class_name: 'Node', foreign_key: 'from_id'
  belongs_to :to, class_name: 'Node', foreign_key: 'to_id'
  belongs_to :campaign
end
