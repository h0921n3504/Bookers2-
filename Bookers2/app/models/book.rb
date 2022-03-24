class Book < ApplicationRecord

  belongs_to :user
  has_many :favorites, dependent: :destroy
  has_many :book_comments, dependent: :destroy

  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end

  def change
    create_table :books do |t|

      t.string :title
      t.text :body
      t.integer :user_id

      t.timestamps
    end
  end

  validates :title, presence: true
  validates :body, presence: true, length: { maximum: 200}

end
