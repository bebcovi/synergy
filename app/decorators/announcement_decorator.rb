class AnnouncementDecorator < Draper::Decorator
  delegate_all
  translates :content
end
