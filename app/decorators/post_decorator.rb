class PostDecorator < Draper::Decorator
  delegate_all
  translates :title, :body

  def title
    h.smarty_pants super
  end

  def body
    h.markdown super
  end

  def to_s
    h.truncate(object.to_s, length: 60)
  end
end
