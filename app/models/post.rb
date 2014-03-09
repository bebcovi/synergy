class Post < ActiveRecord::Base
  mount_uploader :cover_photo, PhotoUploader
  store_in_background :cover_photo
  required_locale_columns :title, :body

  def to_s
    [title_en, title_hr].find(&:present?)
  end
end
