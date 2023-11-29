class Url < ApplicationRecord
  belongs_to :user
  validates_format_of :original, with: /\A(https?:\/\/)?([\da-z\.-]+)\.([a-z\.]{2,6})([\/\w \.-]*|%[0-9a-fA-F]{2,})*\/?\z/
  validates :hash_value, uniqueness: true

  before_create :generate_hash_value

  private

  def generate_hash_value
    self.hash_value = create_unique_hash_value
  end

  def create_unique_hash_value
    loop do
      hash = Digest::SHA256.hexdigest(original)[0...7]
      break hash unless Url.exists?(hash_value: hash)
    end
  end
end
