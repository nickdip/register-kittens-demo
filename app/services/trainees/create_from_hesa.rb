# frozen_string_literal: true

module Trainees
  class CreateFromHesa
    include ServicePattern
    include DiversityAttributes

    def initialize(student_node:)
      @hesa_trainee = Hesa::Parsers::IttRecord.to_attributes(student_node: student_node)
      @trainee = Trainee.find_or_initialize_by(hesa_id: hesa_trainee[:hesa_id])
    end

    def call
      trainee.assign_attributes(mapped_attributes)
      trainee.save!
      trainee
      add_multiple_disability_text!
    end

  private

    attr_reader :hesa_trainee, :trainee

    def mapped_attributes
      {
        created_from_hesa: trainee.id.blank?,
        trainee_id: hesa_trainee[:trainee_id],
        training_route: training_route,
      }.merge(personal_details_attributes)
       .merge(contact_attributes)
       .merge(provider_attributes)
       .merge(ethnicity_and_disability_attributes)
    end

    def personal_details_attributes
      {
        first_names: hesa_trainee[:first_names],
        last_name: hesa_trainee[:last_name],
        date_of_birth: hesa_trainee[:date_of_birth],
        gender: hesa_trainee[:gender].to_i,
        nationalities: nationalities,
      }
    end

    def contact_attributes
      {
        email: hesa_trainee[:email],
        address_line_one: hesa_trainee[:address_line_one],
        address_line_two: hesa_trainee[:address_line_two],
      }
    end

    def provider_attributes
      provider = Provider.find_by(ukprn: hesa_trainee[:ukprn])
      provider ? { provider: provider } : {}
    end

    def nationalities
      Nationality.where(name: nationality_name)
    end

    def nationality_name
      ApplyApi::CodeSets::Nationalities::MAPPING[hesa_trainee[:nationality]]
    end

    def training_route
      Hesa::CodeSets::TrainingRoutes::MAPPING[hesa_trainee[:training_route]]
    end

    def ethnic_background
      Hesa::CodeSets::Ethnicities::MAPPING[hesa_trainee[:ethnic_background]]
    end

    def disability
      Hesa::CodeSets::Disabilities::MAPPING[hesa_trainee[:disability]]
    end
  end
end