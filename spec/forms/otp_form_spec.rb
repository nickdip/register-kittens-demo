# frozen_string_literal: true

require "rails_helper"

describe OtpForm, type: :model do
  let(:email) { Faker::Internet.email }
  let(:error_message) { form.errors.full_messages.first }
  let(:otp_form_attempts) { 0 }
  let(:otp_form_last_attempt) { Time.zone.now }

  let(:session) do
    {
      otp_form_attempts:,
      otp_form_last_attempt:,
    }
  end

  subject(:form) { described_class.new(session:, email:) }

  describe "#valid?" do
    context "with a blank email" do
      let(:email) { nil }

      it "returns the correct error message" do
        expect(form.valid?).to be false
        expect(error_message).to include "Enter your email address"
      end
    end

    context "with an invalid email" do
      let(:email) { "bad-email" }

      it "returns the correct error message" do
        expect(form.valid?).to be false
        expect(error_message).to include "Enter an email address in the correct format, like name@example.com"
      end
    end

    context "with a valid email" do
      it "returns valid" do
        expect(form.valid?).to be true
      end
    end

    context "with an email that is too long" do
      let(:email) { "a" * 256 }

      it "returns the correct error message" do
        expect(form.valid?).to be false
        expect(error_message).to include("is too long (maximum is 255 characters)")
      end
    end

    describe "validating cool down" do
      context "when should not cool down" do
        let(:otp_form_attempts) { 0 }

        it "is valid" do
          expect(form.valid?).to be true
        end
      end

      context "when should cool down" do
        let(:otp_form_attempts) { 5 }

        it "returns the correct error message" do
          expect(form.valid?).to be false
          expect(error_message).to include "Please wait 1 minute before trying again"
        end
      end
    end
  end

  describe "#email" do
    let(:email) { " email@example.com " }

    it "strips whitespace from the email" do
      expect(form.email).to eql("email@example.com")
    end
  end
end
