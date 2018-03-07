class Customer < ActiveResource::Base
  self.site               = 'http://mic-leads.dev-test.makeiteasy.com/api/v1'

  headers['Content-Type'] = 'application/x-www-form-urlencoded'
  headers['Accept']       = 'application/json'

  schema do
    attribute :business_name, :string
    attribute :telephone_number, :string
    attribute :email, :string
    attribute :contact_name, :string
    attribute :notes, :string
    attribute :reference, :string
  end

  private

  def custom_method_new_element_url(method_name, options = {})
    "#{self.class.prefix(prefix_options)}#{method_name}#{self.class.__send__(:query_string, options)}"
  end
end
