# frozen_string_literal: true

module Dttp
  module CodeSets
    module CourseSubjects
      EARLY_YEARS_DTTP_ID = "f08274df-181e-e711-80c8-0050568902d3"
      MODERN_LANGUAGES_DTTP_ID = "6ca12838-b3cf-e911-a860-000d3ab1da01"
      RELIGIOUS_EDUCATION_DTTP_ID = "dc8274df-181e-e711-80c8-0050568902d3"

      MAPPING = {
        ::CourseSubjects::ANCIENT_HEBREW => { entity_id: "5fcd03f1-83ef-eb11-bacb-000d3ab62e3c" },
        ::CourseSubjects::APPLIED_BIOLOGY => { entity_id: "11a12838-b3cf-e911-a860-000d3ab1da01" },
        ::CourseSubjects::APPLIED_CHEMISTRY => { entity_id: "6a8274df-181e-e711-80c8-0050568902d3" },
        ::CourseSubjects::APPLIED_COMPUTING => { entity_id: "1ea12838-b3cf-e911-a860-000d3ab1da01" },
        ::CourseSubjects::APPLIED_PHYSICS => { entity_id: "20a12838-b3cf-e911-a860-000d3ab1da01" },
        ::CourseSubjects::ARABIC_LANGUAGES => { entity_id: "b7f49dcd-aaeb-eb11-bacb-0022489ad2a6" },
        ::CourseSubjects::BIOLOGY => { entity_id: "568274df-181e-e711-80c8-0050568902d3" },
        ::CourseSubjects::BUSINESS_MANAGEMENT => { entity_id: "24a12838-b3cf-e911-a860-000d3ab1da01" },
        ::CourseSubjects::BUSINESS_STUDIES => { entity_id: "a68274df-181e-e711-80c8-0050568902d3" },
        ::CourseSubjects::CHEMISTRY => { entity_id: "688274df-181e-e711-80c8-0050568902d3" },
        ::CourseSubjects::CHILD_DEVELOPMENT => { entity_id: EARLY_YEARS_DTTP_ID },
        ::CourseSubjects::CHINESE_LANGUAGES => { entity_id: "1e2ed06f-f303-eb11-a813-000d3ad82cac" },
        ::CourseSubjects::CITIZENSHIP => { entity_id: "3b1724c0-e5ee-eb11-bacb-000d3ab62638" },
        ::CourseSubjects::CLASSICAL_GREEK_STUDIES => { entity_id: "2aa12838-b3cf-e911-a860-000d3ab1da01" },
        ::CourseSubjects::CLASSICAL_STUDIES => { entity_id: "2ca12838-b3cf-e911-a860-000d3ab1da01" },
        ::CourseSubjects::COMPUTER_SCIENCE => { entity_id: "868274df-181e-e711-80c8-0050568902d3" },
        ::CourseSubjects::CONSTRUCTION_AND_THE_BUILT_ENVIRONMENT => { entity_id: "30a12838-b3cf-e911-a860-000d3ab1da01" },
        ::CourseSubjects::CREATIVE_ARTS_AND_DESIGN => { entity_id: "32a12838-b3cf-e911-a860-000d3ab1da01" },
        ::CourseSubjects::DANCE => { entity_id: "34a12838-b3cf-e911-a860-000d3ab1da01" },
        ::CourseSubjects::DESIGN => { entity_id: "36a12838-b3cf-e911-a860-000d3ab1da01" },
        ::CourseSubjects::DESIGN_AND_TECHNOLOGY => { entity_id: "e457b9e4-e5ee-eb11-bacb-000d3ab62638" },
        ::CourseSubjects::DRAMA => { entity_id: "e88274df-181e-e711-80c8-0050568902d3" },
        ::CourseSubjects::EARLY_YEARS_TEACHING => { entity_id: "3aa12838-b3cf-e911-a860-000d3ab1da01" },
        ::CourseSubjects::ECONOMICS => { entity_id: "928274df-181e-e711-80c8-0050568902d3" },
        ::CourseSubjects::ENGLISH_AS_A_FOREIGN_LANGUAGE => { entity_id: "231774a1-e5ee-eb11-bacb-000d3ab62638" },
        ::CourseSubjects::ENGLISH_STUDIES => { entity_id: "3ea12838-b3cf-e911-a860-000d3ab1da01" },
        ::CourseSubjects::ENVIRONMENTAL_SCIENCES => { entity_id: "40a12838-b3cf-e911-a860-000d3ab1da01" },
        ::CourseSubjects::FOOD_AND_BEVERAGE_STUDIES => { entity_id: "42a12838-b3cf-e911-a860-000d3ab1da01" },
        ::CourseSubjects::FRENCH_LANGUAGE => { entity_id: "44a12838-b3cf-e911-a860-000d3ab1da01" },
        ::CourseSubjects::GENERAL_OR_INTEGRATED_ENGINEERING => { entity_id: "46a12838-b3cf-e911-a860-000d3ab1da01" },
        ::CourseSubjects::GENERAL_SCIENCES => { entity_id: "48a12838-b3cf-e911-a860-000d3ab1da01" },
        ::CourseSubjects::GEOGRAPHY => { entity_id: "9c8274df-181e-e711-80c8-0050568902d3" },
        ::CourseSubjects::GERMAN_LANGUAGE => { entity_id: "4ca12838-b3cf-e911-a860-000d3ab1da01" },
        ::CourseSubjects::GRAPHIC_DESIGN => { entity_id: "4ea12838-b3cf-e911-a860-000d3ab1da01" },
        ::CourseSubjects::HAIR_AND_BEAUTY_SCIENCES => { entity_id: "50a12838-b3cf-e911-a860-000d3ab1da01" },
        ::CourseSubjects::HEALTH_AND_SOCIAL_CARE => { entity_id: "9a8274df-181e-e711-80c8-0050568902d3" },
        ::CourseSubjects::HEALTH_STUDIES => { entity_id: "54a12838-b3cf-e911-a860-000d3ab1da01" },
        ::CourseSubjects::HISTORICAL_LINGUISTICS => { entity_id: "56a12838-b3cf-e911-a860-000d3ab1da01" },
        ::CourseSubjects::HISTORY => { entity_id: "da8274df-181e-e711-80c8-0050568902d3" },
        ::CourseSubjects::HOSPITALITY => { entity_id: "5aa12838-b3cf-e911-a860-000d3ab1da01" },
        ::CourseSubjects::INFORMATION_TECHNOLOGY => { entity_id: "5ca12838-b3cf-e911-a860-000d3ab1da01" },
        ::CourseSubjects::ITALIAN_LANGUAGE => { entity_id: "5ea12838-b3cf-e911-a860-000d3ab1da01" },
        ::CourseSubjects::JAPANESE_LANGUAGE => { entity_id: "d8e0bcad-e5ee-eb11-bacb-000d3ab62638" },
        ::CourseSubjects::LATIN_LANGUAGE => { entity_id: "c68274df-181e-e711-80c8-0050568902d3" },
        ::CourseSubjects::LAW => { entity_id: "62a12838-b3cf-e911-a860-000d3ab1da01" },
        ::CourseSubjects::MANUFACTURING_ENGINEERING => { entity_id: "64a12838-b3cf-e911-a860-000d3ab1da01" },
        ::CourseSubjects::MATERIALS_SCIENCE => { entity_id: "66a12838-b3cf-e911-a860-000d3ab1da01" },
        ::CourseSubjects::MATHEMATICS => { entity_id: "768274df-181e-e711-80c8-0050568902d3" },
        ::CourseSubjects::MEDIA_AND_COMMUNICATION_STUDIES => { entity_id: "6aa12838-b3cf-e911-a860-000d3ab1da01" },
        ::CourseSubjects::MODERN_LANGUAGES => { entity_id: MODERN_LANGUAGES_DTTP_ID },
        ::CourseSubjects::MUSIC_EDUCATION_AND_TEACHING => { entity_id: "6ea12838-b3cf-e911-a860-000d3ab1da01" },
        ::CourseSubjects::PERFORMING_ARTS => { entity_id: "70a12838-b3cf-e911-a860-000d3ab1da01" },
        ::CourseSubjects::PHILOSOPHY => { entity_id: RELIGIOUS_EDUCATION_DTTP_ID },
        ::CourseSubjects::PHYSICAL_EDUCATION => { entity_id: "26353dcc-e5ee-eb11-bacb-000d3ab62638" },
        ::CourseSubjects::PHYSICS => { entity_id: "72a12838-b3cf-e911-a860-000d3ab1da01" },
        ::CourseSubjects::PORTUGUESE_LANGUAGE => { entity_id: "74a12838-b3cf-e911-a860-000d3ab1da01" },
        ::CourseSubjects::PRIMARY_TEACHING => { entity_id: "76a12838-b3cf-e911-a860-000d3ab1da01" },
        ::CourseSubjects::PRODUCTION_AND_MANUFACTURING_ENGINEERING => { entity_id: "7aa12838-b3cf-e911-a860-000d3ab1da01" },
        ::CourseSubjects::PRODUCT_DESIGN => { entity_id: "78a12838-b3cf-e911-a860-000d3ab1da01" },
        ::CourseSubjects::PSYCHOLOGY => { entity_id: "608274df-181e-e711-80c8-0050568902d3" },
        ::CourseSubjects::PUBLIC_SERVICES => { entity_id: "7ea12838-b3cf-e911-a860-000d3ab1da01" },
        ::CourseSubjects::RECREATION_AND_LEISURE_STUDIES => { entity_id: "80a12838-b3cf-e911-a860-000d3ab1da01" },
        ::CourseSubjects::RELIGIOUS_STUDIES => { entity_id: "82a12838-b3cf-e911-a860-000d3ab1da01" },
        ::CourseSubjects::RETAIL_MANAGEMENT => { entity_id: "84a12838-b3cf-e911-a860-000d3ab1da01" },
        ::CourseSubjects::RUSSIAN_LANGUAGES => { entity_id: "86a12838-b3cf-e911-a860-000d3ab1da01" },
        ::CourseSubjects::SOCIAL_SCIENCES => { entity_id: "88a12838-b3cf-e911-a860-000d3ab1da01" },
        ::CourseSubjects::SPANISH_LANGUAGE => { entity_id: "8aa12838-b3cf-e911-a860-000d3ab1da01" },
        ::CourseSubjects::SPECIALIST_TEACHING_PRIMARY_WITH_MATHEMETICS => { entity_id: "8ca12838-b3cf-e911-a860-000d3ab1da01" },
        ::CourseSubjects::SPORTS_MANAGEMENT => { entity_id: "90a12838-b3cf-e911-a860-000d3ab1da01" },
        ::CourseSubjects::SPORT_AND_EXERCISE_SCIENCES => { entity_id: "8ea12838-b3cf-e911-a860-000d3ab1da01" },
        ::CourseSubjects::STATISTICS => { entity_id: "a72916df-83ef-eb11-bacb-000d3ab62e3c" },
        ::CourseSubjects::TEXTILES_TECHNOLOGY => { entity_id: "92a12838-b3cf-e911-a860-000d3ab1da01" },
        ::CourseSubjects::TRAVEL_AND_TOURISM => { entity_id: "94a12838-b3cf-e911-a860-000d3ab1da01" },
        ::CourseSubjects::UK_GOVERNMENT_PARLIAMENTARY_STUDIES => { entity_id: "96a12838-b3cf-e911-a860-000d3ab1da01" },
        ::CourseSubjects::WELSH_LANGUAGE => { entity_id: "98a12838-b3cf-e911-a860-000d3ab1da01" },
      }.freeze
    end
  end
end
