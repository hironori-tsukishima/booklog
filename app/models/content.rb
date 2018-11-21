class Content < ApplicationRecord
  belongs_to :user
  has_many :comments

  has_attached_file :photo,
                      styles: { medium: "x300>", thumb: "x300>" },
                      styles: { medium: "x300", thumb: "x300" },
                      styles: { medium: "", thumb: "x300>" },
                      path: "#{Rails.root}/app/assets/images/:filename"
   validates_attachment_content_type :photo, content_type: /\Aimage\/.*\z/
   validates :photo_file_name, presence: true
end
