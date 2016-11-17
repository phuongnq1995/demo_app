class Entry < ActiveRecord::Base
  belongs_to :user
  has_many :comments, dependent: :destroy
  default_scope -> { order(created_at: :desc) }
  validates :user_id, presence: true
  validates :title, presence: true, length: { maximum: 40 }  
  validates :content, presence: true, length: { maximum: 140 }

  def delete_entry
  	Entry.find_by(:entry).destroy
  end

  def feed
    Comment.where("entry_id IN (?)", id)
  end

end
