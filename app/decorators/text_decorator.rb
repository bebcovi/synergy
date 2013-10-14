class TextDecorator < Draper::Decorator
  delegate_all
  translates :body

  def body(options = {})
    html = h.markdown super()
    html = "#{h.toc_for(html)}#{html}".html_safe if options[:toc]
    html
  end

  def to_s
    I18n.t("#{controller}.#{action}.page_title")
  end
end
