class Publication < ApplicationRecord
  belongs_to :user

  # Validaciones
  validates :title, presence: true, length: { in: 3..100 }
  validates :description, presence: true, length: { maximum: 500 }
  validates :category, presence: true, inclusion: { in: %w[Romantico Accion Terror Comedia],
    message: "%{value} no es una categoría válida" }

  # Callbacks
  before_validation :normalize_title
  after_save :log_publication_creation

  # Scopes
  scope :from_date_range, ->(start_date, end_date) {
  start_date = Date.parse(start_date) if start_date.is_a?(String)
  end_date = Date.parse(end_date) if end_date.is_a?(String)
  where(created_at: start_date.beginning_of_day..end_date.end_of_day)
}

  scope :by_category, ->(category) { where(category: category) }

  # Métodos privados
  private

  def normalize_title
    self.title = title.strip.titleize if title.present?
  end

  def log_publication_creation
    Rails.logger.info "Publication '#{title}' created successfully at #{created_at}."
  end
end
