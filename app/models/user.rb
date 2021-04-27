# == Schema Information
#
# Table name: users
#
#  id              :bigint           not null, primary key
#  admin           :boolean          not null
#  email           :string(255)      not null
#  name            :string(255)      not null
#  password_digest :string(255)      not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
# Indexes
#
#  index_users_on_email  (email) UNIQUE
#
class User < ApplicationRecord
    has_secure_password

    validates :name,
        presence: true,
        uniqueness: true,
        length: { maximum: 16 }

    validates :password,
        length: { minimum: 8 }

    validates :email,
        presence: true,
        uniqueness: true

    has_many :boards
end
