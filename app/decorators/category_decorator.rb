class CategoryDecorator < Draper::Decorator
  delegate_all
  translates :name
end
