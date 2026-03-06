class Customer < ApplicationRecord

  # def self.ransackable_attributes(auth_object = nil)
  # column_names
  # end
  has_one_attached :image

  validates :full_name, presence: true
  # permit filter attributes
  def self.ransackable_attributes(auth_object = nil)
    ["full_name", "phone_number", "email_address", "notes"]
  end

  def self.ransackable_associations(auth_object = nil)
    []
  end
end
