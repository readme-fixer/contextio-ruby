require 'spec_helper'
require 'contextio'

describe ContextIO do
  subject { ContextIO.new(nil, nil) }

  describe ".new" do
    it "creates a new API handle" do
      expect(ContextIO.new(nil, nil).api).to be_a(ContextIO::API)
    end

    it "passes credentials to its API handle" do
      api = ContextIO.new('1234', '0987').api
      expect(api.key).to eq('1234')
      expect(api.secret).to eq('0987')
    end
  end

  describe "#oauth_providers" do
    it "returns a new OAuthProviderCollection" do
      expect(subject.oauth_providers).to be_a(ContextIO::OAuthProviderCollection)
    end

    it "passes its API handle to the OAuthProviderCollection" do
      expect(subject.oauth_providers.api).to eq(subject.api)
    end
  end

  describe "#email_settings_for" do
    subject { ContextIO.new(nil, nil).email_settings_for('email@address.com') }

    it "returns a new EmailSettings" do
      expect(subject).to be_a(ContextIO::EmailSettings)
    end

    it "passes its API handle to the EmailSettings" do
      expect(subject.api).to eq(subject.api)
    end

    it "passes the email address to the EmailSettings" do
      expect(subject.email).to eq('email@address.com')
    end
  end
end
