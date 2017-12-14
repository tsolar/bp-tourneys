module ApplicationHelper
  def country_name(country_code = nil)
    c = ISO3166::Country.new(country_code)
    c.try(:name).to_s
  end

  def active_class(test_path)
    return 'active' if request.path == test_path
    ''
  end
end
