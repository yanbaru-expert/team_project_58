class Movie < ApplicationRecord
  RAILS_GENRE_LIST = %w[basic git ruby rails]
  PHP_GENRE_LIST = %w[php]
  with_options presence: true do
    validates :genre
    validates :title
    validates :url
  end
  enum genre: {
    invisible: 0, # 非表示
    basic: 1,
    git: 2,
    ruby: 3,
    rails: 4,
    php: 5
  }

  has_many :watch_progresses, dependent: :destroy

  def self.genre_list(genre)
    if genre == "php"
      where(genre: Movie::PHP_GENRE_LIST)
    else
      where(genre: Movie::RAILS_GENRE_LIST)
    end
  end

  def watch_progressed_by?(user)
    watch_progresses.any? { |watch| watch.user_id == user.id }
  end
end
