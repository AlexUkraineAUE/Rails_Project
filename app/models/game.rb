class Game < ApplicationRecord
  has_and_belongs_to_many :genres
  has_and_belongs_to_many :teams
  has_many :reviews

  validates :title, :release_date, :rating, :summary, presence: true
  validates :title, uniqueness: true
  validates :rating, numericality: { greater_than_or_equal_to: 0,  less_than_or_equal_to: 5}

  def formatted_release_date
    release_date.strftime('%B %d, %Y') if release_date
  end
end
