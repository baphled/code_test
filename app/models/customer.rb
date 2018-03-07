class Customer < ActiveResource::Base
  self.site = 'http://mic-leads.dev-test.makeiteasy.com/api/v1'

  validates_presence_of :auth_token
  validates_presence_of :pGUID
  validates_presence_of :pAccName
  validates_presence_of :pPartner

  validates_presence_of :name
  validates_presence_of :business_name
  validates_presence_of :telephone_number

  schema do
    attribute :business_name, :string
    attribute :telephone_number, :string
    attribute :email, :string
    attribute :contact_name, :string
    attribute :notes, :string
    attribute :reference, :string
  end
end
