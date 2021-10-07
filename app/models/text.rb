class Text < ApplicationRecord
  RAILS_GENRE_LIST = %w[basic git ruby rails]
  with_options presence: true do
    validates :genre
    validates :title
    validates :content
  end
  enum genre: {
    invisible: 0, # 非表示
    basic: 1,
    git: 2,
    ruby: 3,
    rails: 4,
    php: 5
  }

  has_many :read_progresses, -> { order(created_at: :desc) }, dependent: :destroy
  def read_progressed_by?(user)
    read_progresses.any? { |read_progress| read_progress.user_id == user.id }
  end
end
