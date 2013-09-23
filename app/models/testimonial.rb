require "squeel"

class Testimonial < ActiveRecord::Base
  belongs_to :project

  default_scope -> { order{created_at.desc} }

  required_locale_columns :content
  validates_presence_of :author

  def to_s
    "#{author}, #{project}"
  end
end
