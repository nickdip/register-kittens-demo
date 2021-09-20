# frozen_string_literal: true

module Dttp
  module CodeSets
    module DegreeTypes
      NON_UK = ["Degree equivalent", "Unknown"].freeze

      BACHELOR_OF_ARTS = "Bachelor of Arts"

      COMMON = [BACHELOR_OF_ARTS, "Bachelor of Science", "Master of Arts", "PhD"].freeze

      MAPPING = {
        BACHELOR_OF_ARTS => { entity_id: "db695652-c197-e711-80d8-005056ac45bb", abbreviation: "BA", hesa_code: "51" },
        "Bachelor of Arts Economics" => { entity_id: "dd695652-c197-e711-80d8-005056ac45bb", abbreviation: "BAEcon", hesa_code: "52" },
        "Bachelor of Arts in Architecture" => { entity_id: "df695652-c197-e711-80d8-005056ac45bb", abbreviation: "BAArch", hesa_code: "53" },
        "Bachelor of the Art of Obstetrics" => { entity_id: "e1695652-c197-e711-80d8-005056ac45bb", abbreviation: "BAO", hesa_code: "54" },
        "Bachelor of Architecture" => { entity_id: "e3695652-c197-e711-80d8-005056ac45bb", abbreviation: "BAArch", hesa_code: "55" },
        "Bachelor of Applied Science" => { entity_id: "e5695652-c197-e711-80d8-005056ac45bb", abbreviation: "BAsc", hesa_code: "56" },
        "Bachelor of Agriculture" => { entity_id: "e7695652-c197-e711-80d8-005056ac45bb", abbreviation: "BAg", hesa_code: "57" },
        "Bachelor of Accountancy" => { entity_id: "e9695652-c197-e711-80d8-005056ac45bb", abbreviation: "BAcc", hesa_code: "58" },
        "Bachelor of Administration" => { entity_id: "eb695652-c197-e711-80d8-005056ac45bb", abbreviation: "BAdmin", hesa_code: "59" },
        "Bachelor of Business Administration" => { entity_id: "ed695652-c197-e711-80d8-005056ac45bb", abbreviation: "BBA", hesa_code: "60" },
        "Bachelor of Combined Studies" => { entity_id: "ef695652-c197-e711-80d8-005056ac45bb", abbreviation: "BCS", hesa_code: "61" },
        "Bachelor of Commerce" => { entity_id: "f1695652-c197-e711-80d8-005056ac45bb", abbreviation: "BComm", hesa_code: "62" },
        "Bachelor of Divinity" => { entity_id: "f3695652-c197-e711-80d8-005056ac45bb", abbreviation: "BD", hesa_code: "63" },
        "Bachelor of Dental Surgery" => { entity_id: "f5695652-c197-e711-80d8-005056ac45bb", abbreviation: "BDS", hesa_code: "64" },
        "Bachelor of Engineering" => { entity_id: "f7695652-c197-e711-80d8-005056ac45bb", abbreviation: "BEng", hesa_code: "65" },
        "Bachelor of Engineering with Business Studies" => { entity_id: "f9695652-c197-e711-80d8-005056ac45bb", abbreviation: "BEng/BS", hesa_code: "66" },
        "Bachelor of Fine Art" => { entity_id: "fb695652-c197-e711-80d8-005056ac45bb", abbreviation: "BFA", hesa_code: "67" },
        "Bachelor of General Studies" => { entity_id: "fd695652-c197-e711-80d8-005056ac45bb", abbreviation: "BGS", hesa_code: "68" },
        "Bachelor of Humanities" => { entity_id: "ff695652-c197-e711-80d8-005056ac45bb", abbreviation: "BH", hesa_code: "69" },
        "Bachelor of Hygiene" => { entity_id: "016a5652-c197-e711-80d8-005056ac45bb", abbreviation: "BHyg", hesa_code: "70" },
        "Bachelor of Law" => { entity_id: "036a5652-c197-e711-80d8-005056ac45bb", abbreviation: "LLB", hesa_code: "71" },
        "Bachelor of Librarianship" => { entity_id: "056a5652-c197-e711-80d8-005056ac45bb", abbreviation: "BLib", hesa_code: "72" },
        "Bachelor of Librarianship and Information Studies" => { entity_id: "076a5652-c197-e711-80d8-005056ac45bb", abbreviation: "BLS", hesa_code: "73" },
        "Bachelor of Literature" => { entity_id: "096a5652-c197-e711-80d8-005056ac45bb", abbreviation: "BLitt", hesa_code: "74" },
        "Bachelor of Land Economy" => { entity_id: "0b6a5652-c197-e711-80d8-005056ac45bb", abbreviation: "BLEcon", hesa_code: "75" },
        "Bachelor of Medical Science" => { entity_id: "0d6a5652-c197-e711-80d8-005056ac45bb", abbreviation: "BMedSc", hesa_code: "76" },
        "Bachelor of Medicine" => { entity_id: "0f6a5652-c197-e711-80d8-005056ac45bb", abbreviation: "BM", hesa_code: "77" },
        "Bachelor of Metallurgy" => { entity_id: "116a5652-c197-e711-80d8-005056ac45bb", abbreviation: "BMet", hesa_code: "78" },
        "Bachelor of Metallurgy and Engineering" => { entity_id: "136a5652-c197-e711-80d8-005056ac45bb", abbreviation: "BMet/Eng", hesa_code: "79" },
        "Bachelor of Music" => { entity_id: "156a5652-c197-e711-80d8-005056ac45bb", abbreviation: "BMu", hesa_code: "80" },
        "Bachelor of Nursing" => { entity_id: "176a5652-c197-e711-80d8-005056ac45bb", abbreviation: "BN", hesa_code: "81" },
        "Bachelor of Pharmacy" => { entity_id: "196a5652-c197-e711-80d8-005056ac45bb", abbreviation: "BPharm", hesa_code: "82" },
        "Bachelor of Science" => { entity_id: "1b6a5652-c197-e711-80d8-005056ac45bb", abbreviation: "BSc", hesa_code: "83" },
        "Bachelor of Science Economics" => { entity_id: "1d6a5652-c197-e711-80d8-005056ac45bb", abbreviation: "BScEcon", hesa_code: "84" },
        "Bachelor of Science and Engineering" => { entity_id: "1f6a5652-c197-e711-80d8-005056ac45bb", abbreviation: "BScEng", hesa_code: "85" },
        "Bachelor of Science and Technology" => { entity_id: "216a5652-c197-e711-80d8-005056ac45bb", abbreviation: "BScTech", hesa_code: "86" },
        "Bachelor of Science in Social Science" => { entity_id: "236a5652-c197-e711-80d8-005056ac45bb", abbreviation: "BSc SS", hesa_code: "87" },
        "Bachelor of Science in Speech Therapy" => { entity_id: "256a5652-c197-e711-80d8-005056ac45bb", abbreviation: "BSc SPT", hesa_code: "88" },
        "Bachelor of Social Science" => { entity_id: "276a5652-c197-e711-80d8-005056ac45bb", abbreviation: "BSS", hesa_code: "89" },
        "Bachelor of Surgery" => { entity_id: "296a5652-c197-e711-80d8-005056ac45bb", abbreviation: "BS", hesa_code: "90" },
        "Bachelor of Chirurgiae" => { entity_id: "2b6a5652-c197-e711-80d8-005056ac45bb", abbreviation: "BCh", hesa_code: "91" },
        "Bachelor of Technology" => { entity_id: "2d6a5652-c197-e711-80d8-005056ac45bb", abbreviation: "BTech", hesa_code: "92" },
        "Bachelor of Theology" => { entity_id: "2f6a5652-c197-e711-80d8-005056ac45bb", abbreviation: "BTheol", hesa_code: "93" },
        "Bachelor of Veterinary Medicine" => { entity_id: "316a5652-c197-e711-80d8-005056ac45bb", abbreviation: "BVMed", hesa_code: "94" },
        "Bachelor of Veterinary Medicine and Surgery" => { entity_id: "336a5652-c197-e711-80d8-005056ac45bb", abbreviation: "BVMS", hesa_code: "95" },
        "Bachelor of Veterinary Science" => { entity_id: "356a5652-c197-e711-80d8-005056ac45bb", abbreviation: "BVsc", hesa_code: "96" },
        "Bachelor of Education Scotland and Northern Ireland" => { entity_id: "376a5652-c197-e711-80d8-005056ac45bb", abbreviation: "BEd", hesa_code: "97" },
        "Bachelor of Philosophy" => { entity_id: "396a5652-c197-e711-80d8-005056ac45bb", abbreviation: "BPhil", hesa_code: "98" },
        "BEd" => { entity_id: "c1695652-c197-e711-80d8-005056ac45bb", abbreviation: nil, hesa_code: "1" },
        "BSc/Education" => { entity_id: "c5695652-c197-e711-80d8-005056ac45bb", abbreviation: nil, hesa_code: "3" },
        "BTech/Education" => { entity_id: "c9695652-c197-e711-80d8-005056ac45bb", abbreviation: nil, hesa_code: "5" },
        "BA/Education" => { entity_id: "c9695652-c197-e711-80d8-005056ac45bb", abbreviation: nil, hesa_code: "7" },
        "BA Combined Studies/Education of the Deaf" => { entity_id: "d1695652-c197-e711-80d8-005056ac45bb", abbreviation: nil, hesa_code: "9" },
        "BA with intercalated PGCE" => { entity_id: "d5695652-c197-e711-80d8-005056ac45bb", abbreviation: nil, hesa_code: "12" },
        "Master of Arts" => {
          entity_id: "3b6a5652-c197-e711-80d8-005056ac45bb",
          abbreviation: "MA",
          synonyms: ["masters of arts"],
          hesa_code: "200",
        },
        "Master of Librarianship" => {
          entity_id: "3d6a5652-c197-e711-80d8-005056ac45bb",
          abbreviation: "MLib",
          synonyms: ["masters of librarianship"],
          hesa_code: "201",
        },
        "Master of Literature" => {
          entity_id: "3f6a5652-c197-e711-80d8-005056ac45bb",
          abbreviation: "MLitt",
          synonyms: ["masters of literature"],
          hesa_code: "202",
        },
        "Master of Music" => {
          entity_id: "416a5652-c197-e711-80d8-005056ac45bb",
          abbreviation: "MMus",
          synonyms: ["masters of music"],
          hesa_code: "203",
        },
        "Master of Philosophy" => {
          entity_id: "436a5652-c197-e711-80d8-005056ac45bb",
          abbreviation: "MPhil",
          synonyms: ["masters of philosophy"],
          hesa_code: "204",
        },
        "Master of Science" => {
          entity_id: "456a5652-c197-e711-80d8-005056ac45bb",
          abbreviation: "MSc",
          synonyms: ["masters of science"],
          hesa_code: "205",
        },
        "Master of Theology" => {
          entity_id: "476a5652-c197-e711-80d8-005056ac45bb",
          abbreviation: "MTheol",
          synonyms: ["masters of theology"],
          hesa_code: "206",
        },
        "Certificate of Membership of Cranfield Institute of Technology" => { entity_id: "496a5652-c197-e711-80d8-005056ac45bb", abbreviation: nil, hesa_code: "207" },
        "Master of Education" =>
        {
          entity_id: "4b6a5652-c197-e711-80d8-005056ac45bb",
          abbreviation: "MEd",
          synonyms: ["masters of education"],
          hesa_code: "208",
        },
        "Master of Business Studies" => {
          entity_id: "4d6a5652-c197-e711-80d8-005056ac45bb",
          abbreviation: "MBS",
          synonyms: ["masters of business studies"],
          hesa_code: "209",
        },
        "Master of Social Studies" => {
          entity_id: "4f6a5652-c197-e711-80d8-005056ac45bb",
          abbreviation: "MSS",
          synonyms: ["masters of social studies"],
          hesa_code: "210",
        },
        "Master of Engineering" => {
          entity_id: "516a5652-c197-e711-80d8-005056ac45bb",
          abbreviation: "MEng",
          synonyms: ["masters of engineering"],
          hesa_code: "211",
        },
        "Master of Law" => {
          entity_id: "536a5652-c197-e711-80d8-005056ac45bb",
          abbreviation: "MLaw",
          synonyms: ["masters of law"],
          hesa_code: "212",
        },
        "Master of Business Administration" => {
          entity_id: "556a5652-c197-e711-80d8-005056ac45bb",
          abbreviation: "MBA",
          synonyms: ["masters of business administration"],
          hesa_code: "213",
        },
        "Master of Chemistry" => {
          entity_id: "576a5652-c197-e711-80d8-005056ac45bb",
          abbreviation: "MChem",
          synonyms: ["masters of chemistry"],
          hesa_code: "214",
        },
        "Master of Physics" => {
          entity_id: "596a5652-c197-e711-80d8-005056ac45bb",
          abbreviation: "MPhys",
          synonyms: ["masters of physics"],
          hesa_code: "215",
        },
        "Doctor of Divinity" => { entity_id: "5b6a5652-c197-e711-80d8-005056ac45bb", abbreviation: "DD", hesa_code: "300" },
        "Doctor of Civil Law" => { entity_id: "5d6a5652-c197-e711-80d8-005056ac45bb", abbreviation: "DCL", hesa_code: "301" },
        "Doctor of Medicine" => { entity_id: "5f6a5652-c197-e711-80d8-005056ac45bb", abbreviation: "MD", hesa_code: "302" },
        "Doctor of Music" => { entity_id: "616a5652-c197-e711-80d8-005056ac45bb", abbreviation: "DMu", hesa_code: "303" },
        "Doctor of Science" => { entity_id: "636a5652-c197-e711-80d8-005056ac45bb", abbreviation: "DSc", hesa_code: "304" },
        "Doctor of Philosophy" => { entity_id: "656a5652-c197-e711-80d8-005056ac45bb", abbreviation: "DPhil", hesa_code: "305" },
        "PhD" => { entity_id: "676a5652-c197-e711-80d8-005056ac45bb", abbreviation: nil, hesa_code: "306" },
        "First Degree" => { entity_id: "696a5652-c197-e711-80d8-005056ac45bb", abbreviation: nil, hesa_code: "400" },
        "Higher Degree" => { entity_id: "6b6a5652-c197-e711-80d8-005056ac45bb", abbreviation: nil, hesa_code: "401" },
        "Degree equivalent" => { entity_id: "6d6a5652-c197-e711-80d8-005056ac45bb", abbreviation: nil, hesa_code: "402" },
        "Unknown" => { entity_id: "6f6a5652-c197-e711-80d8-005056ac45bb", abbreviation: nil },
      }.freeze
    end
  end
end
