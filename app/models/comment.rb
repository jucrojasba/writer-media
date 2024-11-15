class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :publication

  # Validaciones
  validates :content, presence: true, length: { minimum: 3, maximum: 500 }

  # Scopes
  scope :by_publication, ->(publication_id) { where(publication_id: publication_id) }

  # Callbacks
  before_save :sanitize_content

  private

  def sanitize_content
    self.content = ActionController::Base.helpers.sanitize(content)
  end
end
