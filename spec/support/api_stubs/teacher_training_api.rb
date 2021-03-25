# frozen_string_literal: true

module ApiStubs
  module TeacherTrainingApi
    def self.subjects
      { "data": [subject] }.to_json
    end

    def self.subject(attrs = {})
      s = {
        "id": "3",
        "type": "subjects",
        "attributes": {
          "name": "Primary with science",
          "code": "07",
          "bursary_amount": "9000",
          "early_career_payments": "8388",
          "scholarship": "3500",
          "subject_knowledge_enhancement_course_available": true,
        },
      }
      attrs.each { |k, v| s[:attributes][k] = v }
      s.to_json
    end

    def self.courses
      { "data": [course] }.to_json
    end

    def self.course(attrs = {})
      course = {
        "id": "12944685",
        "type": "courses",
        "attributes": {
          "about_accredited_body": "UCL Institute of Education is the world’s leading centre for research and teaching in education and related social sciences.",
          "about_course": "The Secondary PGCE consists of three core modules: two Master's-level modules, which are assessed through written assignments, and the Professional Practice module, which is assessed by the observation of practical teaching in placement schools.",
          "accredited_body_code": "2FR",
          "age_minimum": 11,
          "age_maximum": 14,
          "applications_open_from": "2019-10-08",
          "bursary_amount": 9000,
          "bursary_requirements": [{}],
          "changed_at": "2019-06-13T10:44:31Z",
          "code": "3GTY",
          "course_length": "OneYear",
          "created_at": "2019-06-13T10:44:31Z",
          "fee_details": "For those wishing to top up their qualification to the full PGCE, a further £1800 will be payable.",
          "fee_international": 13_000,
          "fee_domestic": 9200,
          "financial_support": "You'll get a bursary of £9,000 if you have a degree of 2:2 or above in any subject. You may also be eligible for a loan while you study.",
          "findable": true,
          "funding_type": "apprenticeship",
          "gcse_subjects_required": [{}],
          "has_bursary": true,
          "has_early_career_payments": true,
          "has_scholarship": true,
          "has_vacancies": true,
          "how_school_placements_work": "You will spend two-thirds of your time (120 days) in schools, working with art and design mentors who support you through your two school placements.",
          "interview_process": "At your interview day you will take part in a combination of group and individual interviews with members of the programme team, and you may also be asked to undertake written or presentation tasks, depending on your subject.",
          "is_send": true,
          "last_published_at": "2019-06-13T10:44:31Z",
          "level": "secondary",
          "name": "Art and Design",
          "open_for_applications": true,
          "other_requirements": "You'll need to provide confirmation you have the health and physical capacity to commence training, and a Disclosure and Barring Service (DBS) certificate.",
          "personal_qualities": "We are looking for applicants who have the potential to become outstanding teachers, and who are able to work independently on their studies while training in a school context.",
          "program_type": "scitt_programme",
          "qualifications": [{}],
          "required_qualifications": "A first or second-class UK Bachelor's degree in an appropriate subject, or an overseas qualification of an equivalent standard from a recognised higher education institution.",
          "required_qualifications_english": "equivalence_test",
          "required_qualifications_maths": "equivalence_test",
          "required_qualifications_science": "equivalence_test",
          "running": true,
          "salary_details": "Successful applicants will be employed as unqualified teachers on at least Point 1 of the Unqualified Teachers' Pay Scale for the duration of the programme.",
          "scholarship_amount": 17_000,
          "start_date": "2020-09-01",
          "state": "published",
          "study_mode": "both",
          "summary": "PGCE with QTS full time",
          "subject_codes": %w[Q3],
        },
        "relationships": {
          "recruitment_cycle": {
            "meta": {
              "included": false,
            },
          },
          "accredited_body": {
            "meta": {
              "included": false,
            },
          },
          "provider": {
            "meta": {
              "included": false,
            },
          },
        },
      }

      attrs.each { |k, v| course[:attributes][k] = v }
      course.to_json
    end
  end
end
