class SynergyController < ActionController::Base
  protect_from_forgery

  before_filter :set_locale
  before_filter :set_announcement

  protected

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def default_url_options(options = {})
    {locale: params[:locale]}
  end

  def set_announcement
    @announcement = Announcement.available_in(I18n.locale).first.try(:decorate)
  end
end
