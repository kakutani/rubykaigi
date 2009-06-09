# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def registration_open_at
    @registration_open_at = Time.parse(configatron.paypal.open_at)
  end

  def registration_open?(now = Time.now)
    registration_open_at <= now
  end

  # TODO support :scope
  def t_required(locale_name)
    "#{t(locale_name)}&nbsp;<span class='required'>(#{t(:required)})</span>"
  end
end
