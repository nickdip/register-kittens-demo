# frozen_string_literal: true

FactoryBot.define do
  factory :abstract_trainee, class: "Trainee" do
    sequence :trainee_id do |n|
      year = (course_start_date || Faker::Date.between(from: 10.years.ago, to: Time.zone.today)).strftime("%y").to_i

      "#{year}/#{year + 1}-#{n}"
    end

    provider

    training_route { TRAINING_ROUTE_ENUMS[:assessment_only] }

    first_names { Faker::Name.first_name }
    middle_names { Faker::Name.middle_name }
    last_name { Faker::Name.last_name }
    gender { Trainee.genders.keys.sample }
    slug { SecureRandom.base58(Sluggable::SLUG_LENGTH) }

    diversity_disclosure { Diversities::DIVERSITY_DISCLOSURE_ENUMS[:diversity_not_disclosed] }
    ethnic_group { nil }
    ethnic_background { nil }
    additional_ethnic_background { nil }
    disability_disclosure { Diversities::DISABILITY_DISCLOSURE_ENUMS[:not_provided] }

    address_line_one { Faker::Address.street_address }
    address_line_two { Faker::Address.street_name }
    town_city { Faker::Address.city }
    postcode { Faker::Address.postcode }
    international_address { nil }
    locale_code { :uk }
    email { "#{first_names}.#{last_name}@example.com" }
    applying_for_bursary { nil }

    factory :trainee do
      date_of_birth { Faker::Date.birthday(min_age: 18, max_age: 65) }
    end

    factory :trainee_for_form do
      transient do
        form_dob { Faker::Date.birthday(min_age: 18, max_age: 65) }
      end
      add_attribute("date_of_birth(3i)") { form_dob.day.to_s }
      add_attribute("date_of_birth(2i)") { form_dob.month.to_s }
      add_attribute("date_of_birth(1i)") { form_dob.year.to_s }
    end

    trait :incomplete do
      trainee_id { nil }
      first_names { nil }
      middle_names { nil }
      last_name { nil }
      gender { nil }
      date_of_birth { nil }

      diversity_disclosure { nil }
      ethnic_group { nil }
      ethnic_background { nil }
      additional_ethnic_background { nil }
      disability_disclosure { nil }

      address_line_one { nil }
      address_line_two { nil }
      town_city { nil }
      postcode { nil }
      international_address { nil }
      locale_code { nil }
      email { nil }
      commencement_date { nil }
    end

    trait :in_progress do
      with_course_details
      with_start_date
      with_degree
    end

    trait :with_degree do
      degrees { [build(:degree, :uk_degree_with_details)] }
    end

    trait :completed do
      in_progress
      nationalities { [build(:nationality)] }
      progress do
        Progress.new(
          personal_details: true,
          contact_details: true,
          diversity: true,
          degrees: true,
          course_details: true,
          training_details: true,
          placement_details: true,
          schools: true,
          funding: true,
        )
      end
    end

    trait :with_subject_specialism do
      transient do
        subject_name { nil }
      end

      course_subject_one { create(:subject_specialism, subject_name: subject_name).name }
    end

    trait :with_course_details do
      course_subject_one { Dttp::CodeSets::CourseSubjects::MAPPING.keys.sample }
      course_code { Faker::Alphanumeric.alphanumeric(number: 4).upcase }
      course_age_range { Dttp::CodeSets::AgeRanges::MAPPING.keys.sample }
      course_start_date { Faker::Date.between(from: 10.years.ago, to: 2.days.ago) }
      course_end_date { Faker::Date.between(from: course_start_date + 1.day, to: Time.zone.today) }
    end

    trait :with_start_date do
      commencement_date { Faker::Date.between(from: 6.months.from_now, to: Time.zone.today) }
    end

    trait :diversity_disclosed do
      diversity_disclosure { Diversities::DIVERSITY_DISCLOSURE_ENUMS[:diversity_disclosed] }
    end

    trait :diversity_not_disclosed do
      diversity_disclosure { Diversities::DIVERSITY_DISCLOSURE_ENUMS[:diversity_not_disclosed] }
    end

    trait :with_ethnic_group do
      ethnic_group { Diversities::ETHNIC_GROUP_ENUMS.values.sample }
    end

    trait :with_ethnic_background do
      ethnic_background { Dttp::CodeSets::Ethnicities::MAPPING.keys.sample }
    end

    trait :disabled do
      disability_disclosure { Diversities::DISABILITY_DISCLOSURE_ENUMS[:disabled] }
    end

    trait :with_diversity_information do
      diversity_disclosed
      with_ethnic_group
      with_ethnic_background
      disabled

      transient do
        disabilities_count { 1 }
      end

      after(:create) do |trainee, evaluator|
        create_list(:trainee_disability, evaluator.disabilities_count, trainee: trainee)
      end
    end

    trait :with_placement_assignment do
      placement_assignment_dttp_id { SecureRandom.uuid }
    end

    trait :with_outcome_date do
      outcome_date { Faker::Date.in_date_period }
    end

    trait :provider_led_postgrad do
      training_route { TRAINING_ROUTE_ENUMS[:provider_led_postgrad] }
    end

    trait :with_early_years_course_details do
      course_subject_one { CourseSubjects::EARLY_YEARS_TEACHING }
      course_age_range { AgeRange::ZERO_TO_FIVE }
    end

    trait :early_years_assessment_only do
      training_route { TRAINING_ROUTE_ENUMS[:early_years_assessment_only] }
      with_early_years_course_details
    end

    trait :early_years_salaried do
      training_route { TRAINING_ROUTE_ENUMS[:early_years_salaried] }
      with_early_years_course_details
    end

    trait :early_years_postgrad do
      training_route { TRAINING_ROUTE_ENUMS[:early_years_postgrad] }
      with_early_years_course_details
    end

    trait :early_years_undergrad do
      training_route { TRAINING_ROUTE_ENUMS[:early_years_undergrad] }
      with_early_years_course_details
    end

    trait :school_direct_tuition_fee do
      training_route { TRAINING_ROUTE_ENUMS[:school_direct_tuition_fee] }
    end

    trait :school_direct_salaried do
      training_route { TRAINING_ROUTE_ENUMS[:school_direct_salaried] }
    end

    trait :draft do
      state { "draft" }
    end

    trait :submitted_for_trn do
      completed
      dttp_id { SecureRandom.uuid }
      submitted_for_trn_at { Time.zone.now }
      state { "submitted_for_trn" }
    end

    trait :trn_received do
      submitted_for_trn
      trn { SecureRandom.uuid }
      state { "trn_received" }
    end

    trait :recommended_for_award do
      trn_received
      recommended_for_award_at { Time.zone.now }
      state { "recommended_for_award" }
    end

    trait :withdrawn do
      trn_received
      withdraw_date { Faker::Date.in_date_period }
      state { "withdrawn" }
    end

    trait :deferred do
      trn_received
      defer_date { Faker::Date.in_date_period }
      state { "deferred" }
    end

    trait :reinstated do
      completed
      defer_date { Faker::Date.in_date_period }
      reinstate_date { Faker::Date.in_date_period }
      state { "trn_received" }
    end

    trait :awarded do
      recommended_for_award
      state { "awarded" }
      awarded_at { Time.zone.now }
    end

    trait :eyts_awarded do
      training_route { EARLY_YEARS_ROUTES.sample }
      state { "awarded" }
    end

    trait :eyts_recommended do
      training_route { EARLY_YEARS_ROUTES.sample }
      state { "recommended_for_award" }
    end

    trait :qts_awarded do
      training_route { "school_direct_salaried" }
      state { "awarded" }
    end

    trait :qts_recommended do
      training_route { "school_direct_salaried" }
      state { "recommended_for_award" }
    end

    trait :with_dttp_dormancy do
      deferred
      dormancy_dttp_id { SecureRandom.uuid }
    end

    trait :withdrawn_on_another_day do
      withdraw_date { Faker::Date.in_date_period }
    end

    trait :withdrawn_for_specific_reason do
      withdraw_date { Time.zone.today }
      withdraw_reason { WithdrawalReasons::SPECIFIC.sample }
    end

    trait :withdrawn_for_another_reason do
      withdraw_date { Faker::Date.in_date_period }
      withdraw_reason { WithdrawalReasons::FOR_ANOTHER_REASON }
      additional_withdraw_reason { Faker::Lorem.paragraph }
    end

    trait :with_related_courses do
      training_route { (TRAINING_ROUTES_FOR_TRAINEE.keys & TRAINING_ROUTES_FOR_COURSE.keys).sample }

      transient do
        courses_count { 5 }
        subject_names { [] }
      end

      after(:create) do |trainee, evaluator|
        create_list(:course_with_subjects, evaluator.courses_count,
                    subject_names: evaluator.subject_names,
                    accredited_body_code: trainee.provider.code,
                    route: trainee.training_route)

        trainee.reload
      end
    end

    trait :with_lead_school do
      association :lead_school, factory: %i[school lead]
    end

    trait :with_employing_school do
      association :employing_school, factory: :school
    end

    trait :with_apply_application do
      apply_application
    end

    trait :with_funding do
      training_initiative { ROUTE_INITIATIVES_ENUMS.keys.sample }
      applying_for_bursary { Faker::Boolean.boolean }
    end

    trait :with_tiered_bursary do
      applying_for_bursary { true }
      bursary_tier { BURSARY_TIER_ENUMS[:tier_one] }
    end
  end
end
