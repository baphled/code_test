class Customer < ActiveResource::Base
  self.site               = "#{ENV['LEAD_API_URI']}/api/v1"

  headers['Content-Type'] = 'application/x-www-form-urlencoded'
  headers['Accept']       = 'application/json'

  private

  #
  # NOTE: API end-point is a non-standard REST API
  # 
  # POST should not accept query parameters and should expect parameter body instead.
  #
  # As this is not the case we overload the below method so that we can make the correct call to our external API
  #
  # "POST /api/v1/create? ..."
  #
  # A REST API would allow something like "POST /api/v1/leads.json"
  #
  # It seems that the API is not idempotent either, so duplicate entries would be an issue. In these cases we would
  # expect a HTTP status code of 409 though so far I've been unable to replicate this.
  #

  def custom_method_new_element_url(method_name, options = {})
    "#{self.class.prefix(prefix_options)}#{method_name}#{self.class.__send__(:query_string, options)}"
  end
end
