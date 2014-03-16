require "pg_search"

class Post < ActiveRecord::Base
  include PgSearch

  mount_uploader :cover_photo, PhotoUploader
  store_in_background :cover_photo
  required_locale_columns :title, :body

  default_scope -> { order{created_at.desc} }

  pg_search_scope :search,
    against: {
      title_en: "A", title_hr: "A",
      body_en: "C", body_hr: "C",
    },
    using: {
      tsearch: {prefix: true},
      trigram: {},
    },
    ignoring: :accents

  def to_s
    [title_en, title_hr].find(&:present?)
  end
end
