# frozen_string_literal: true

module Hesa
  module CodeSets
    module StudyModes
      # https://www.hesa.ac.uk/collection/c21053/xml/c21053/c21053codelists.xsd
      # https://www.hesa.ac.uk/collection/c21053/e/crmode
      MAPPING = {
        "1" => TRAINEE_STUDY_MODE_ENUMS["full_time"],
        "2" => TRAINEE_STUDY_MODE_ENUMS["part_time"],
      }.freeze
    end
  end
end