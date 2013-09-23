class Post < ActiveRecord::Base
  required_locale_columns :title, :body

  def to_s
    [title_en, title_hr].find(&:present?)
  end
end
