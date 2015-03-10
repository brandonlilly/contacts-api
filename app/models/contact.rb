class Contact < ActiveRecord::Base
  validates :email, :user_id, :name, presence: true

  validates :email, uniqueness: {scope: :user_id}

  belongs_to :owner,
    foreign_key: :user_id,
    class_name: 'User'

  has_many :contact_shares

  has_many :shared_users,
    through: :contact_shares,
    source:  :user

  has_many :comments, as: :commentable

  has_many :groupings

  has_many :groups,
    through: :groupings,
    source: :group

end
