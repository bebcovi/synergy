require "squeel"

class Category < ActiveRecord::Base
  has_many :projects

  def next_project
    projects.upcoming.order{begins_on.asc}.first
  end
end
