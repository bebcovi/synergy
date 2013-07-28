require "squeel"

class Testimonial < ActiveRecord::Base
  belongs_to :project

  required_locale_columns :content

  default_scope -> { order{created_at.desc} }

  validates_presence_of :author
end
