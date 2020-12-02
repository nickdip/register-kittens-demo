# frozen_string_literal: true

FactoryBot.define do
  factory :degree, class: Degree do
    association :trainee

    uk_degree_type

    trait :uk_degree_type do
      locale_code { :uk }
      uk_degree { HESA_DEGREE_TYPES.sample[2] }
    end

    trait :uk_degree_with_details do
      uk_degree_type

      subject { Dttp::CodeSets::DegreeSubjects::MAPPING.keys.sample }
      institution { Dttp::CodeSets::Institutions::MAPPING.keys.sample }
      grade { Dttp::CodeSets::Grades::MAPPING.keys.sample }
      graduation_year { (1900..Time.zone.today.year).to_a.sample }
    end

    trait :non_uk_degree_type do
      locale_code { :non_uk }
      uk_degree { nil }
      non_uk_degree { NARIC_NON_UK.sample }
    end

    trait :non_uk_degree_with_details do
      non_uk_degree_type

      subject { Dttp::CodeSets::DegreeSubjects::MAPPING.keys.sample }
      country { Dttp::CodeSets::Countries::MAPPING.keys.sample }
      grade { Dttp::CodeSets::Grades::MAPPING.keys.sample }
      graduation_year { (1900..Time.zone.today.year).to_a.sample }
    end
  end
end
