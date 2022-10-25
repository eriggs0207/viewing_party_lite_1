# frozen_string_literal: true

class User < ApplicationRecord
  validates_presence_of :name, :email, :password_digest
  validates_uniqueness_of :email

  has_secure_password
  
  has_many :user_parties
  has_many :parties, through: :user_parties
end
