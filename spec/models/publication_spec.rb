require 'rails_helper'

RSpec.describe Publication, type: :model do
  let(:user) { User.find(1) }

  # Validaciones
  it "es válido con un título, descripción y categoría válidos" do
    publication = Publication.new(
      title: "Mi primera publicación",
      description: "Una descripción corta",
      category: "Romantico",
      user: user 
    )
    expect(publication).to be_valid
  end

  it "no es válido sin un título" do
    publication = Publication.new(description: "Descripción sin título", category: "Comedia", user: user)
    expect(publication).not_to be_valid
  end

  it "no es válido sin una descripción" do
    publication = Publication.new(title: "Título válido", category: "Accion", user: user)
    expect(publication).not_to be_valid
  end

  it "no es válido si el título tiene menos de 3 caracteres" do
    publication = Publication.new(title: "Ab", description: "Descripción válida", category: "Terror", user: user)
    expect(publication).not_to be_valid
  end

  it "no es válido si la categoría no es válida" do
    publication = Publication.new(title: "Título válido", description: "Descripción válida", category: "Aventura", user: user)
    expect(publication).not_to be_valid
  end

  # Callbacks
  it "normaliza el título antes de la validación" do
    publication = Publication.create(title: "   mi publicación ", description: "Descripción válida", category: "Comedia", user: user)
    expect(publication.title).to eq("Mi Publicación")
  end

  # Scopes
  describe ".from_date_range" do
    it "filtra las publicaciones dentro del rango de fechas" do
      publication1 = Publication.create(title: "Publicación 1", description: "Descripción", category: "Romantico", created_at: 2.days.ago, user: user)
      publication2 = Publication.create(title: "Publicación 2", description: "Descripción", category: "Accion", created_at: 1.day.ago, user: user)
      publication3 = Publication.create(title: "Publicación 3", description: "Descripción", category: "Terror", created_at: 3.days.ago, user: user)
      
      publications = Publication.from_date_range(2.days.ago.to_s, 1.day.ago.to_s)
      expect(publications).to include(publication1, publication2)
      expect(publications).not_to include(publication3)
    end
  end

  describe ".by_category" do
    it "filtra las publicaciones por categoría" do
      publication1 = Publication.create(title: "Publicación Romántica", description: "Descripción", category: "Romantico", user: user)
      publication2 = Publication.create(title: "Publicación de Acción", description: "Descripción", category: "Accion", user: user)
      
      romantic_publications = Publication.by_category("Romantico")
      expect(romantic_publications).to include(publication1)
      expect(romantic_publications).not_to include(publication2)
    end
  end
end
