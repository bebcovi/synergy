module SynergyHelper
  include MarkdownRendering

  def date_range(from, till)
    if from.year != till.year
      "#{from.strftime('%-d.%-m.%Y')}–#{till.strftime('%-d.%-m.%Y.')}"
    elsif from.month != till.month
      "#{from.strftime('%-d.%-m')}–#{till.strftime('%-d.%-m.%Y.')}"
    else
      "#{from.strftime('%-d')}–#{till.strftime('%-d.%-m.%Y.')}"
    end
  end

  def icon(name)
    content_tag :i, "", class: "icon-#{name}"
  end

  def croatian?
    I18n.locale == :hr
  end

  def english?
    I18n.locale == :en
  end

  def current_page_title(pages)
    result = pages.find { |page| current_page?(page[:path]) }
    result.try(:[], :title)
  end
end
