require "pg_search"

class Project < ActiveRecord::Base
  include PgSearch

  belongs_to :category
  has_many :attachments, dependent: :destroy

  mount_uploader :cover_photo, PhotoUploader
  store_in_background :cover_photo
  required_locale_columns :description, :summary, validations: false
  accepts_nested_attributes_for :attachments, allow_destroy: true

  default_scope      -> { order{created_at.desc} }
  scope :upcoming,   -> { where{begins_on > Date.today} }
  scope :forecoming, -> { where{ends_on < Date.today} }

  validates_presence_of :name_en, :name_hr, :location_en, :location_hr,
    :begins_on, :ends_on, :deadline
  validates_presence_of :summary_en, if: :description_en?
  validates_presence_of :summary_hr, if: :description_hr?

  pg_search_scope :search,
    against: {
      name_en: "A", name_hr: "A",
      location_en: "A", location_hr: "A",
      description_en: "C", description_en: "C",
    },
    associated_against: {
      category: {name_en: "B", name_hr: "B"}
    },
    using: {
      tsearch: {prefix: true},
      trigram: {},
    },
    ignoring: :accents

  def to_s
    [name_en, name_hr].find(&:present?)
  end
end
