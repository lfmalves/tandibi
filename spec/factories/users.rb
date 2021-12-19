# frozen_string_literal: true

# == Schema Information
#
# Table name: users
#
#  id         :bigint           not null, primary key
#  email      :string           not null
#  first_name :string           not null
#  is_public  :boolean          default(TRUE), not null
#  last_name  :string
#  username   :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_users_on_email     (email) UNIQUE
#  index_users_on_username  (username) UNIQUE
#
FactoryBot.define do
  factory :user do
    username { SecureRandom.hex(3) }
    first_name { ['Zeev', 'Lazar', 'Yacov'].sample }
    last_name { ['Cohen', 'Rabinovich', 'Rosembaum'].sample }
    email { "#{ SecureRandom.hex(4)}@irgun.org.il" }
    is_public { true }
  end
end
