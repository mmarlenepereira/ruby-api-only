class Article < ApplicationRecord
  # attributes: title (string), body (text), and published (boolean)
  # published attribute should default to false when a new article is created
  attribute :title, :string
  attribute :body, :text
  attribute :published, :boolean, default: false
end
