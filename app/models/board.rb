# == Schema Information
#
# Table name: boards
#
#  id           :bigint           not null, primary key
#  body         :text(65535)
#  company_name :string(255)
#  person_name  :string(255)
#  work_place   :string(255)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  user_id      :bigint           not null
#
# Indexes
#
#  index_boards_on_user_id  (user_id)
#

class Board < ApplicationRecord
    has_many :comments, dependent: :delete_all
    has_many :board_tag_relations, dependent: :delete_all
    has_many :tags, through: :board_tag_relations

    validates :person_name, presence: true, length: { maximum: 10 }
    validates :company_name, presence: true, length: { maximum: 20 }
    validates :work_place, presence: true, length: { maximum: 10 }
    validates :body, presence: true, length: { maximum: 500 }

    belongs_to :user

    scope :recent, -> {order(created_at: :desc)}
end
