module ProgrammeDetailsHelper
  def subjects_options
    boilerplate(subjects.map)
  end

  def main_age_ranges
    age_ranges(options: :main)
  end

  def additional_age_ranges_options
    boilerplate(age_ranges(options: :additional))
  end

private

  def age_ranges(options:)
    AGE_RANGES.select { |age_range| age_range[:option] == options }
      .map { |s| s.values[0] }
  end

  def subjects
    PROGRAMME_SUBJECTS.map { |s| s.values[0] }
  end

  def boilerplate(array)
    result = array.map do |name|
      OpenStruct.new(name: name)
    end
    result.unshift(OpenStruct.new(name: nil))
    result
  end
end
