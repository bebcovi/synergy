class Post < ActiveRecord::Base
  required_locale_columns :title, :body
end
