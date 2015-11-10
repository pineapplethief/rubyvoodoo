SimpleCov.start 'rails' do
  add_group 'Presenters', 'app/presenters'
  add_group 'Policies', 'app/policies'
  add_group 'Services', 'app/services'

  add_filter '/spec/'
  add_filter '/lib/templates/'
  # any custom configs like groups and filters can be here at a central place
end
