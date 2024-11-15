class Publication < ApplicationRecord
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
