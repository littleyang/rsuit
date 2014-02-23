config.gererators do |g|
  g.test_framework :rspec,
    :fixtures => true,
    :view_specs => true,
    :helper_specs => true,
    :routing_specs => true,
    :controller_specs => true,
    :request_specs => true
  g.fixture_replacement :factory_girl,:dir=>"spec/factories"
end
