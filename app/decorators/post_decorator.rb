class PostDecorator < Draper::Decorator
  delegate_all
  translates :title, :body
end
