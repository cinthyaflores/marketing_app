# frozen_string_literal: true

# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  roles_mask             :integer
#  invitation_token       :string
#  invitation_created_at  :datetime
#  invitation_sent_at     :datetime
#  invitation_accepted_at :datetime
#  invitation_limit       :integer
#  invited_by_id          :integer
#  invited_by_type        :string
#  company_id             :bigint
#  name                   :string
#

class User < ApplicationRecord
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i.freeze
  include RoleModel

  belongs_to :company
  has_many :campaigns, foreign_key: 'manager_id'
  has_many :tasks

  devise :database_authenticatable, :recoverable, :invitable, validate_on_invite: true

  roles_attribute :roles_mask
  roles :owner,
        :company,
        :community_manager,
        :content_creator,
        :designer,
        :rrhh,
        :finance,
        :client,
        :contact

  scope :admin_manage_users, lambda { |company|
                               where(company: company)
                                 .where('roles_mask = 4
                                            OR roles_mask = 32
                                            OR roles_mask = 64
                                            OR roles_mask = 128
                                            OR roles_mask = 256')
                             }

  scope :with_role, lambda { |role|
                      where(roles_mask: User.mask_for(role))
                    }

  scope :community_managers, -> { where(roles_mask: 4) }
  scope :possible_coworkers, lambda { |campaign_id|
    joins("LEFT JOIN (SELECT * FROM coworkers
                               WHERE coworkers.campaign_id = #{campaign_id})
                               as cw on cw.user_id = users.id")
      .where('users.roles_mask = 8
      OR roles_mask = 16
      OR roles_mask = 24')
      .where('cw.user_id IS NULL')
  }
  validates :email, :name, presence: true
  validates :email, format: { with: VALID_EMAIL_REGEX }

  def self.admin_manage_roles
    %i[rrhh finance client contact]
  end
end
