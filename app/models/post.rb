class Post < ApplicationRecord
  belongs_to :user
  validates :title, :body, :tags, presence: true
  validate :has_at_least_one_tag

  private

  def has_at_least_one_tag
    errors.add(:tags, "must have at least one tag") if tags.blank?
  end
end
