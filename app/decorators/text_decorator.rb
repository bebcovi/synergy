class TextDecorator < Draper::Decorator
  delegate_all
  translates :body

  def body(options = {})
    h.markdown super(), options
  end

  def to_s
    I18n.t("#{controller}.#{action}.page_title")
  end
end
