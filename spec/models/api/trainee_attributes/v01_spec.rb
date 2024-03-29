# frozen_string_literal: true

require "rails_helper"

RSpec.describe Api::TraineeAttributes::V01 do
  subject { described_class.new }

  Api::TraineeAttributes::V01::REQUIRED_ATTRIBUTES.each do |attribute|
    it "validates presence of #{attribute}" do
      subject.valid?
      expect(subject.errors.details[attribute]).to include(error: :blank)
    end
  end

  it "validates length of first_names" do
    subject.first_names = "a" * 51
    subject.valid?
    expect(subject.errors.details[:first_names]).to include(error: :too_long, count: 50)
  end

  it "validates length of last_name" do
    subject.last_name = "a" * 51
    subject.valid?
    expect(subject.errors.details[:last_name]).to include(error: :too_long, count: 50)
  end

  it "validates length of middle_names" do
    subject.middle_names = "a" * 51
    subject.valid?
    expect(subject.errors.details[:middle_names]).to include(error: :too_long, count: 50)
  end

  it "validates date_of_birth given as a string" do
    subject.date_of_birth = (Time.zone.today + 1.day).to_s
    subject.valid?
    expect(subject.errors.details[:date_of_birth]).to include(error: :future)
  end

  it "validates date_of_birth given as a date" do
    subject.date_of_birth = Time.zone.today + 1.day
    subject.valid?
    expect(subject.errors.details[:date_of_birth]).to include(error: :future)
  end

  it "validates inclusion of sex in Trainee.sexes.keys" do
    invalid_sex = "invalid"
    subject.sex = invalid_sex
    subject.valid?
    expect(subject.errors.details[:sex]).to include(error: :inclusion, value: invalid_sex)
  end

  it "derives course_allocation_subject from course_subject_one_name before validation" do
    subject.course_subject_one = "biology"
    create(:subject_specialism, name: subject.course_subject_one)
    subject.valid?
    expect(subject.course_allocation_subject).to be_present
  end
end
