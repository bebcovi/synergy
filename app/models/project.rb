class Project < ActiveRecord::Base
  belongs_to :category
  has_many :testimonials, dependent: :destroy
  has_many :attachments, dependent: :destroy

  required_locale_columns :name, :description, :location

  default_scope      -> { order{created_at.desc} }
  scope :upcoming,   -> { where{begins_on > Date.today} }
  scope :forecoming, -> { where{ends_on < Date.today} }

  validates_presence_of :begins_on, :ends_on, :deadline
end
