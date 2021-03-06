require 'rails_helper'

RSpec.describe Customer do
  let(:access_token) { '5bf520347a29d3e1a72898e01449120a' }
  let(:pGUID) { 'CFFBF53F-6D89-4B5B-8B36-67A97F18EDEB' }
  let(:pAccName) { 'MicDevtest' }
  let(:pPartner) { 'MicDevtest' }

  let(:name) { 'Joe Bloggs' }
  let(:business_name) { 'Some Business' }
  let(:telephone_number) { '0203 333 3333' }

  describe '#post' do
    let(:email) { 'y@me.com' }
    let(:contact_time) { '2018-09-09 12:12:12' }
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
        contact_time: contact_time,
        notes: notes,
        reference: reference,
      }
    end

    let(:expected) do
      {
        message: 'Enqueue success',
        errors: []
      }
    end

    it 'can handle a successful request' do
      VCR.use_cassette 'POST with correct params' do
        expect(subject.post(:create, params).body).to eql(JSON.generate(expected))
      end
    end

    context 'access token not passed' do
      let(:access_token) { nil }
      subject { described_class.new }

      it 'must have a access token' do
        VCR.use_cassette 'POST without access_token' do
          params.delete(:access_token)

          expect {
            subject.post(:create, params)
          }.to raise_error(ActiveResource::UnauthorizedAccess)
        end
      end
    end

    context 'pGUID not passed' do
      let(:pGUID) { nil }
      let(:expected) do
        {
          message: 'Format errors on validation',
          errors: [
            "Field 'pGUID' is blank",
            "Field 'pGUID' wrong format"
          ]
        }
      end

      subject { described_class.new }

      it 'must have a pGUID' do
        VCR.use_cassette 'POST pGUID is blank' do
          expect {
            subject.post(:create, params)
          }.to raise_error(ActiveResource::BadRequest)
        end
      end

      it 'has access to the request errors' do
        VCR.use_cassette 'POST pGUID is blank' do
          begin
            subject.post(:create, params)
          rescue ActiveResource::BadRequest => e
            expect(e.response.body).to eql(JSON.generate(expected))
          end
        end
      end
    end

    context 'pAccName not passed' do
      let(:pAccName) { nil }
      subject { described_class.new }

      it 'must have a pAccName' do
        VCR.use_cassette 'POST pAccName is blank' do
          expect {
            subject.post(:create, params)
          }.to raise_error(ActiveResource::BadRequest)
        end
      end
    end

    context 'pPartner not passed' do
      let(:pPartner) { nil }
      subject { described_class.new }

      it 'must have a pPartner' do
        VCR.use_cassette 'POST pPartner is blank' do
          expect {
            subject.post(:create, params)
          }.to raise_error(ActiveResource::BadRequest)
        end
      end
    end

    context 'name not passed' do
      let(:name) { nil }
      subject { described_class.new }

      it 'must have a name' do
        VCR.use_cassette 'POST name is blank' do
          expect {
            subject.post(:create, params)
          }.to raise_error(ActiveResource::BadRequest)
        end
      end
    end

    context 'business_name not passed' do
      let(:business_name) { nil }
      subject { described_class.new }

      it 'must have a business_name' do
        VCR.use_cassette 'POST business_name is blank' do
          expect {
            subject.post(:create, params)
          }.to raise_error(ActiveResource::BadRequest)
        end
      end
    end

    context 'telephone_number not passed' do
      let(:telephone_number) { nil }
      subject { described_class.new }

      it 'must have a telephone_number' do
        VCR.use_cassette 'POST telephone_number is blank' do
          expect {
            subject.post(:create, params)
          }.to raise_error(ActiveResource::BadRequest)
        end
      end
    end
  end
end
