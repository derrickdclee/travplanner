class Post < ApplicationRecord
    has_many :users, through: :memberships
end
