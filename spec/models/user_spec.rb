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
require 'rails_helper'

RSpec.describe User, type: :model do
  def create_a_user(email: "#{SecureRandom.hex(4)}@example.org")
    User.create!(first_name: 'Adam', email: email, username: SecureRandom.hex(4))
  end

  describe '#valid?' do
    it 'is valid when email is unique' do
      user = create_a_user

      expect(user.valid?).to be true
    end

    it 'is invalid when email is taken' do
      create_a_user(email: 'adam@example.org')

      user = User.new
      user.email = 'adam@example.org'
      expect(user).not_to be_valid
    end

    it 'is valid when username is unique' do
      user = create_a_user

      expect(user.valid?).to be true
    end

    it 'is invalid when username is taken' do
      User.create!(first_name: 'Adam', email: 'esperanto@esperanto.org', username: 'adamo')

      user = User.new
      user.username = 'adamo'
      expect(user).not_to be_valid
    end

    it 'is invalid is first_name is blank' do
      user = create_a_user
      expect(user).to be_valid

      user.first_name = ''
      expect(user).not_to be_valid

      user.first_name = nil
      expect(user).not_to be_valid
    end

    it 'is invalid with ill-formed email' do 
      user = create_a_user
      expect(user).to be_valid

      user.email = ''
      expect(user).to be_invalid

      user.email = 'foo.bar'
      expect(user).to be_invalid

      user.email = 'foo.bar#example.com'
      expect(user).to be_invalid

      user.email = 'foo.bar@example.com'
      expect(user).to be_valid

      user.email = 'foo+bar@example.com'
      expect(user).to be_valid

      user.email = 'foo.bar@sub.example.co.id'
      expect(user).to be_valid
    end
  end
end
