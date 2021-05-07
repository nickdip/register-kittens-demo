# frozen_string_literal: true

FactoryBot.define do
  factory :course do
    sequence(:name) { |c| "Course #{c}" }
    code { Faker::Alphanumeric.alphanumeric(number: 4).upcase }
    accredited_body_code { Faker::Alphanumeric.alphanumeric(number: 3).upcase }
    start_date { Time.zone.today }
    level { :primary }
    min_age { 7 }
    max_age { 11 }
    duration_in_years { 1 }
    qualification { %i[qts pgce_with_qts pgde_with_qts pgce pgde].sample }
    course_length { %w[OneYear TwoYears].sample }
    route { TRAINING_ROUTES_FOR_COURSE.keys.sample }

    summary do |builder|
      qualifications = builder.qualification.to_s.gsub("_", " ").upcase.gsub("WITH", "with")
      time = ["full time", "part time"].sample
      [qualifications, time].join(" ")
    end
  end

  factory :course_with_a_subject do
    subjects { [association(:subject)] }
  end
end
