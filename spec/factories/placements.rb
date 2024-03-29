# frozen_string_literal: true

FactoryBot.define do
  factory :placement do
    trainee

    with_school

    slug { SecureRandom.base58(Sluggable::SLUG_LENGTH) }

    trait :with_school do
      school
    end

    trait :manual do
      school { nil }
      urn { Faker::Number.unique.number(digits: 6) }
      name { Faker::University.name }
      address { Faker::Address.street_address }
      postcode { Faker::Address.postcode }
    end

    trait :not_applicable_school do
      school { nil }
      urn { Trainees::CreateFromHesa::NOT_APPLICABLE_SCHOOL_URNS.sample }
      name { I18n.t("components.placement_detail.magic_urn.#{urn}") }
      address { nil }
      postcode { nil }
    end
  end
end
