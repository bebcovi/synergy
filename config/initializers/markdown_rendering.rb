require "redcarpet"

module MarkdownRendering
  module_function

  def markdown(text)
    options = {superscript: true}
    renderer = Redcarpet::Render::HTML
    result = Redcarpet::Markdown.new(renderer, options).render(text.to_s)
    smarty_pants(result)
  end

  def smarty_pants(text)
    Redcarpet::Render::SmartyPants.render(text.to_s).html_safe
  end
end
