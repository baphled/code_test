require 'rails_helper'

RSpec.describe Customer do
  let(:auth_token) { '5bf520347a29d3e1a72898e01449120a' }
  let(:pGUID) { 'CFFBF53F-6D89-4B5B-8B36-67A97F18EDEB' }
  let(:pAccName) { 'MicDevtest' }
  let(:pPartner) { 'MicDevtest' }

  let(:name) { 'Joe Bloggs' }
  let(:business_name) { 'Some Business' }
  let(:telephone_number) { '0203 333 3333' }

  subject do
    described_class.new(
      auth_token: auth_token,
      pGUID: pGUID,
      pAccName: pAccName,
      pPartner: pPartner,
      name: name,
      business_name: business_name,
      telephone_number: telephone_number,
    )
  end

  context 'validation' do
    it 'must have a access token' do
      subject.auth_token = nil

      expect(subject).not_to be_valid
      expect(subject.errors.messages[:auth_token]).to eql(["can't be blank"])
    end

    it 'must have a pGUID' do
      subject.pGUID = nil

      expect(subject).not_to be_valid
      expect(subject.errors.messages[:pGUID]).to eql(["can't be blank"])
    end

    it 'must have a pAccName' do
      subject.pAccName = nil

      expect(subject).not_to be_valid
      expect(subject.errors.messages[:pAccName]).to eql(["can't be blank"])
    end

    it 'must have a pPartner' do
      subject.pPartner = nil

      expect(subject).not_to be_valid
      expect(subject.errors.messages[:pPartner]).to eql(["can't be blank"])
    end

    it 'must have a name' do
      subject.name = nil

      expect(subject).not_to be_valid
      expect(subject.errors.messages[:name]).to eql(["can't be blank"])
    end

    it 'must have a business name' do
      subject.business_name = nil

      expect(subject).not_to be_valid
      expect(subject.errors.messages[:business_name]).to eql(["can't be blank"])
    end

    it 'must have a telephone_number' do
      subject.telephone_number = nil

      expect(subject).not_to be_valid
      expect(subject.errors.messages[:telephone_number]).to eql(["can't be blank"])
    end
  end

  describe '#new' do
    subject do 
      described_class.new(
        auth_token: auth_token,
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
      )
    end

    let(:business_name) { 'Some Business' }
    let(:telephone_number) { '0203 333 3333' }
    let(:email) { 'y@me.com' }
    let(:contact_name) { 'Joe Bloggs' }
    let(:notes) { 'My notes' }
    let(:reference) { 'My reference' }

    it 'has a name' do
      expect(subject.name).to eql(name)
    end

    it 'has a business name' do
      expect(subject.business_name).to eql(business_name)
    end

    it 'has a telephone number' do
      expect(subject.telephone_number).to eql(telephone_number)
    end

    it 'has a email' do
      expect(subject.email).to eql(email)
    end

    it 'has a contact name' do
      expect(subject.contact_name).to eql(contact_name)
    end

    it 'has a reference' do
      expect(subject.reference).to eql(reference)
    end

    it 'has a notes' do
      expect(subject.notes).to eql(notes)
    end
  end
end
