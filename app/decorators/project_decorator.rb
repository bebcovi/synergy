class ProjectDecorator < Draper::Decorator
  delegate_all
  translates :name, :description, :location, :age_restriction, :capacity
  decorates_association :category

  def title
    [name, category.try(:name), h.date_range(begins_on, ends_on)]
  end

  def duration
    (ends_on - begins_on).to_i + 1
  end

  def attachments
    object.attachments.available_in(I18n.locale).decorate
  end

  def summary
    description.split(/\n\n\s*/).first
  end
end
