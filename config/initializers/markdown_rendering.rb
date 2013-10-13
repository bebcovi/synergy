require "redcarpet"
require "nokogiri"

module MarkdownRendering
  module_function

  def markdown(text, options = {})
    html = Redcarpet::Markdown.new(Redcarpet::Render::HTML, superscript: true).render(text.to_s)
    toc!(html) if options[:toc]
    smarty_pants(html)
  end

  def smarty_pants(text)
    Redcarpet::Render::SmartyPants.render(text.to_s).html_safe
  end

  private

  def toc!(html)
    doc = Nokogiri::HTML(html)
    h2s = doc.search(:h2)
    h2s.each { |h2| h2[:id] = h2.text.parameterize }
    toc = content_tag :ol, class: "toc" do
      h2s
        .map { |h2| content_tag(:li) { link_to(h2.text, "##{h2[:id]}") } }
        .join.html_safe
    end
    html.replace("#{toc}#{doc.to_html}")
  end
end
