require 'rails_helper'

RSpec.describe ContactDetails do
  let(:access_token) { '5bf520347a29d3e1a72898e01449120a' }
  let(:pGUID) { 'CFFBF53F-6D89-4B5B-8B36-67A97F18EDEB' }
  let(:pAccName) { 'MicDevtest' }
  let(:pPartner) { 'MicDevtest' }

  let(:name) { 'Joe Bloggs' }
  let(:business_name) { 'Some Business' }
  let(:telephone_number) { '0203 333 3333' }

  let(:email) { 'y@me.com' }
  let(:contact_name) { 'Joe Bloggs' }
  let(:notes) { 'My notes' }
  let(:reference) { 'My reference' }

  let(:params) do 
    {
      access_token: access_token,
      pGUID: pGUID,
      pAccName: pAccName,
      pPartner: pPartner,
      name: name,
      business_name: business_name,
      telephone_number: telephone_number,
      email: email,
      contact_name: contact_name,
      notes: notes,
      reference: reference,
    }
  end

  subject { described_class }

  context 'validation' do
    it 'must have a pGUID' do
      VCR.use_cassette 'POST without pGUID' do
        params.delete(:pGUID)

        expect(subject.post(params)['errors']).to include("Field 'pGUID' isn't present")
      end
    end

    it 'pGUID can not be blank' do
      VCR.use_cassette 'POST pGUID is blank' do
        params[:pGUID] = nil

        expect(subject.post(params)['errors']).to include("Field 'pGUID' is blank")
      end
    end

    it 'pGUID is the wrong format' do
      VCR.use_cassette 'POST with invalid pGUID' do
        params[:pGUID] = 'asbaas'

        expect(subject.post(params)['errors']).to include("Field 'pGUID' wrong format")
      end
    end

    it 'must have a pAccName' do
      VCR.use_cassette 'POST with without pAccName' do
        params.delete(:pAccName)

        expect(subject.post(params)['errors']).to include("Field 'pAccName' isn't present")
      end
    end

    it 'pAccName can not be blank' do
      VCR.use_cassette 'POST pAccName is blank' do
        params[:pAccName] = nil

        expect(subject.post(params)['errors']).to include("Field 'pAccName' is blank")
      end
    end

    it 'pPartner can not be blank' do
      VCR.use_cassette 'POST with pPartner blank' do
        params[:pPartner] = nil

        expect(subject.post(params)['errors']).to include("Field 'pPartner' is blank")
      end
    end

    it 'must have a pPartner' do
      VCR.use_cassette 'POST with without pPartner' do
        params.delete(:pPartner)

        expect(subject.post(params)['errors']).to include("Field 'pPartner' isn't present")
      end
    end

    it 'must have a name'
    it 'name can not be blank'

    it 'must have a business_name'
    it 'business_name can not be blank'
    it 'business_name can not be more than 100 characters'

    it 'must have a telephone_number'
    it 'telephone_number can not be blank'
    it 'telephone_number must be the correct format'

    it 'contact_time must be the correct format'

    it 'notes must be the correct format'

    it 'reference must be the correct format'
  end
end
