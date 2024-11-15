# spec/models/comment_spec.rb

require 'rails_helper'

RSpec.describe Comment, type: :model do
  let(:user) { User.find(1) }
  
  let(:publication) { Publication.create!(title: "Sample Publication", description: "Some description", category: "Accion", user: user) }
  

  let(:valid_comment) { Comment.new(content: "This is a valid comment", user: user, publication: publication) }
  let(:invalid_comment) { Comment.new(content: "   ", user: user, publication: publication) }

#Validaciones
  it "is valid with valid attributes" do
    expect(valid_comment).to be_valid
  end

  it "is not valid without content" do
    invalid_comment.content = nil
    expect(invalid_comment).to_not be_valid
  end

  it "is not valid with content less than 3 characters" do
    invalid_comment.content = "a" * 2
    expect(invalid_comment).to_not be_valid
  end

  it "is not valid with content longer than 500 characters" do
    invalid_comment.content = "a" * 501
    expect(invalid_comment).to_not be_valid
  end

 #Callbacks
  it "sanitizes the content before saving" do
    comment = Comment.create!(content: "<script>alert('bad')</script> This is a test", user: user, publication: publication)
    expect(comment.content).to_not include("<script>")
    expect(comment.content).to include("alert('bad')")
  end

#Scopes
  it "returns comments for a specific publication" do
    comment1 = Comment.create!(content: "First comment", user: user, publication: publication)
    comment2 = Comment.create!(content: "Second comment", user: user, publication: publication)
    comment3 = Comment.create!(content: "Third comment", user: user, publication: publication)

    comments = Comment.by_publication(publication.id)
    expect(comments).to include(comment1, comment2, comment3)
    expect(comments.count).to eq(3)
  end

  it "does not return comments for a different publication" do
    another_publication = Publication.create!(title: "Another Publication", description: "Different description", category: "Terror", user: user)
    comment = Comment.create!(content: "A comment", user: user, publication: another_publication)
    
    comments = Comment.by_publication(publication.id)
    expect(comments).to_not include(comment)
  end
end
