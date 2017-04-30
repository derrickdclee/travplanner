class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :posts, through: :memberships, dependent: :destroy
  has_many :memberships, dependent: :destroy
  has_many :invitations, class_name: 'Invite', foreign_key: 'recipient_id', dependent: :destroy
  has_many :sent_invites, class_name: 'Invite', foreign_key: 'sender_id', dependent: :destroy
end
