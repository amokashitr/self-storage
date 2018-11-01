class ApplicationController < ActionController::Base

  before_action :set_locale

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def default_url_options
    { locale: I18n.locale }
  end

  private

  def extract_locale_from_tld
    parsed_locale = request.host.split('/').last
    return parsed_locale if I18n.available_locales.map(&:to_s).include?(parsed_locale)
    parsed_locale = request.host.split('.').last
    I18n.available_locales.map(&:to_s).include?(parsed_locale) ? parsed_locale : nil
  end

end
