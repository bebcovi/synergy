class TestimonialDecorator < Draper::Decorator
  delegate_all
  translates :content
  decorates_association :project

  delegate :to_s
end
