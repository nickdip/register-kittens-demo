# frozen_string_literal: true

class UpdateDqt < ActiveRecord::Migration[6.1]
  TRAINEE_FIELDS = %w[
    itt_start_date
    itt_end_date
    training_route
    course_subject_one
    course_subject_two
    course_subject_three
    course_min_age
    course_max_age
  ].freeze

  def up
    trainees = AcademicCycle.current.trainees_starting.where.not(hesa_id: nil).where.not(trn: nil)

    trainees.find_in_batches(batch_size: 100).with_index do |group, batch|
      next if trns_to_ignore.include?(trainee.trn) || !trainee_changed?(trainee)

      group.each do |trainee|
        Dqt::UpdateTraineeJob.set(wait: 30.seconds * batch).perform_later(trainee)
      end
    end
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end

private

  def trainee_changed?(trainee)
    latest_changes = trainee.audits.last.audited_changes

    TRAINEE_FIELDS.any? { |field| latest_changes[field].is_a?(Array) }
  end

  def trns_to_ignore
    @trns_to_ignore ||= [
      4150222,
      4148667,
      4147806,
      4134037,
      3976398,
      2185245,
      2185244,
      2185238,
      2185190,
      2185189,
      2185188,
      2185176,
      2185124,
      2185123,
      2185122,
      2185121,
      2185117,
      2185058,
      2185015,
      2185002,
      2184963,
      2184955,
      2184954,
      2184953,
      2184946,
      2184945,
      2184898,
      2184887,
      2184886,
      2184847,
      2184839,
      2184838,
      2176111,
      2176110,
      2176109,
      2176108,
      2176107,
      2176106,
      2176105,
      2166360,
      2166315,
      2166313,
      2166312,
      2166311,
      2166309,
      2166308,
      2166307,
      2166306,
      2166305,
      2166304,
      2166303,
      2166300,
      2166299,
      2166298,
      2166296,
      2166295,
      2166294,
      2166293,
      2166292,
      2166291,
      2166290,
      2166289,
      2166288,
      2166287,
      2166286,
      2166285,
      2166284,
      2166282,
      2166281,
      2166280,
      2166279,
      2166278,
      2166277,
      2166276,
      2166275,
      2166274,
      2166273,
      2166272,
      2166271,
      2166270,
      2166269,
      2166268,
      2166267,
      2166266,
      2166265,
      2166264,
      2166263,
      2166262,
      2166261,
      2166260,
      2166259,
      2166258,
      2166257,
      2166256,
      2166255,
      2166253,
      2166252,
      2166251,
      2166250,
      2166249,
      2166248,
      2166247,
      2166245,
      2166244,
      2166243,
      2166242,
      2166241,
      2166240,
      2166239,
      2166238,
      2166237,
      2166236,
      2166234,
      2166233,
      2166232,
      2166231,
      2166230,
      2166229,
      2166228,
      2166227,
      2166226,
      2166225,
      2166224,
      2166223,
      2166222,
      2166221,
      2166220,
      2166219,
      2166218,
      2166217,
      2166216,
      2166214,
      2166213,
      2166211,
      2166210,
      2166209,
      2166208,
      2166207,
      2166206,
      2166205,
      2166204,
      2166203,
      2166202,
      2166201,
      2166200,
      2166199,
      2166198,
      2166197,
      2166196,
      2166195,
      2166194,
      2166193,
      2166192,
      2166191,
      2166190,
      2166189,
      2166188,
      2166187,
      2166186,
      2166185,
      2166184,
      2166183,
      2166182,
      2166181,
      2166180,
      2166179,
      2166178,
      2166177,
      2166176,
      2166175,
      2166174,
      2166173,
      2166172,
      2166171,
      2166170,
      2166169,
      2166167,
      2166166,
      2166165,
      2166164,
      2166163,
      2166162,
      2166161,
      2166158,
      2166157,
      2166156,
      2166155,
      2166154,
      2166153,
      2166152,
      2166151,
      2166150,
      2166149,
      2166148,
      2166147,
      2166146,
      2166145,
      2166144,
      2166143,
      2166142,
      2166141,
      2166140,
      2166139,
      2166138,
      2166137,
      2166136,
      2166135,
      2166134,
      2166133,
      2166132,
      2166131,
      2166130,
      2166129,
      2166128,
      2166127,
      2166126,
      2166125,
      2166124,
      2166123,
      2166122,
      2166121,
      2166120,
      2166119,
      2166118,
      2166117,
      2166116,
      2166115,
      2166114,
      2166113,
      2166112,
      2166111,
      2166110,
      2166109,
      2166108,
      2166107,
      2166106,
      2166105,
      2166104,
      2166103,
      2166102,
      2166101,
      2166100,
      2166099,
      2166098,
      2166097,
      2166096,
      2166095,
      2166094,
      2166093,
      2166092,
      2166091,
      2166090,
      2166089,
      2166088,
      2166087,
      2166086,
      2166085,
      2166084,
      2166083,
      2166082,
      2166081,
      2166080,
      2166079,
      2166078,
      2166077,
      2166076,
      2166075,
      2166074,
      2166073,
      2166072,
      2166071,
      2166070,
      2166069,
      2166068,
      2166067,
      2166066,
      2166065,
      2166064,
      2166063,
      2166062,
      2166061,
      2166060,
      2166059,
      2166058,
      2166056,
      2166055,
      2166054,
      2166053,
      2166052,
      2166050,
      2166049,
      2166048,
      2166047,
      2166046,
      2166045,
      2166044,
      2166043,
      2166042,
      2166041,
      2166040,
      2166039,
      2166038,
      2166037,
      2166036,
      2166035,
      2166034,
      2166033,
      2166032,
      2166031,
      2166030,
      2166029,
      2166028,
      2166027,
      2166026,
      2166025,
      2166024,
      2166023,
      2166021,
      2166020,
      2166019,
      2166018,
      2166017,
      2166016,
      2166015,
      2166014,
      2166013,
      2166012,
      2166011,
      2166010,
      2166009,
      2166008,
      2166007,
      2166006,
      2166004,
      2166003,
      2166002,
      2166001,
      2166000,
      2165999,
      2165998,
      2165997,
      2165996,
      2165995,
      2165994,
      2165993,
      2165992,
      2165991,
      2165990,
      2165989,
      2165987,
      2165986,
      2165985,
      2165984,
      2165983,
      2165982,
      2165981,
      2165980,
      2165979,
      2165978,
      2165977,
      2165976,
      2165975,
      2165974,
      2165973,
      2165972,
      2165971,
      2165970,
      2165969,
      2165968,
      2165967,
      2165966,
      2165965,
      2165964,
      2165963,
      2165962,
      2165960,
      2165959,
      2165958,
      2165957,
      2165955,
      2165954,
      2165953,
      2165952,
      2165951,
      2165950,
      2165949,
      2165948,
      2165947,
      2165946,
      2165945,
      2165943,
      2165942,
      2165941,
      2165940,
      2165939,
      2165938,
      2165937,
      2165936,
      2165935,
      2165934,
      2165933,
      2165932,
      2165931,
      2165930,
      2165929,
      2165928,
      2165927,
      2165926,
      2165925,
      2165924,
      2165923,
      2165922,
      2165921,
      2165920,
      2165919,
      2165918,
      2165917,
      2165916,
      2165915,
      2165914,
      2165913,
      2165912,
      2165911,
      2165910,
      2165908,
      2165907,
      2165906,
      2165905,
      2165904,
      2165903,
      2165902,
      2165901,
      2165900,
      2165899,
      2165898,
      2165897,
      2165896,
      2165895,
      2165894,
      2165893,
      2165892,
      2165891,
      2165890,
      2165889,
      2165888,
      2165887,
      2165886,
      2156788,
      2084061,
      2083990,
      2038029,
      1963340,
      1843563,
      1768281,
      1756250,
      1338901,
      1230039,
    ]
  end
end
