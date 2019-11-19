# frozen_string_literal: true

# == Schema Information
#
# Table name: networks
#
#  id          :bigint           not null, primary key
#  campaign_id :bigint           not null
#


class Network < ApplicationRecord
  has_many :nodes
  has_many :edges

  belongs_to :campaign

end
