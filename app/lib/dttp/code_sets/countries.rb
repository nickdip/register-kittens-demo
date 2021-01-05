# frozen_string_literal: true

module Dttp
  module CodeSets
    module Countries
      # country_code is used to regenerate public/location-autocomplete-graph.json - see rake task
      MAPPING = {
        "Afghanistan" => { entity_id: "717a4b74-ea28-e711-80c8-0050568902d3", country_code: "AF" },
        "Albania" => { entity_id: "777a4b74-ea28-e711-80c8-0050568902d3", country_code: "AL" },
        "Algeria" => { entity_id: "e37a4b74-ea28-e711-80c8-0050568902d3", country_code: "DZ" },
        "Andorra" => { entity_id: "6d7a4b74-ea28-e711-80c8-0050568902d3", country_code: "AD" },
        "Angola" => { entity_id: "7d7a4b74-ea28-e711-80c8-0050568902d3", country_code: "AO" },
        "Antigua and Barbuda" => { entity_id: "737a4b74-ea28-e711-80c8-0050568902d3", country_code: "AG" },
        "Argentina" => { entity_id: "7f7a4b74-ea28-e711-80c8-0050568902d3", country_code: "AR" },
        "Armenia" => { entity_id: "797a4b74-ea28-e711-80c8-0050568902d3", country_code: "AM" },
        "Australia" => { entity_id: "857a4b74-ea28-e711-80c8-0050568902d3", country_code: "AU" },
        "Austria" => { entity_id: "837a4b74-ea28-e711-80c8-0050568902d3", country_code: "AT" },
        "Azerbaijan" => { entity_id: "8b7a4b74-ea28-e711-80c8-0050568902d3", country_code: "AZ" },
        "Bahrain" => { entity_id: "997a4b74-ea28-e711-80c8-0050568902d3", country_code: "BH" },
        "Bangladesh" => { entity_id: "917a4b74-ea28-e711-80c8-0050568902d3", country_code: "BD" },
        "Barbados" => { entity_id: "8f7a4b74-ea28-e711-80c8-0050568902d3", country_code: "BB" },
        "Belarus" => { entity_id: "b17a4b74-ea28-e711-80c8-0050568902d3", country_code: "BY" },
        "Belgium" => { entity_id: "937a4b74-ea28-e711-80c8-0050568902d3", country_code: "BE" },
        "Belize" => { entity_id: "b37a4b74-ea28-e711-80c8-0050568902d3", country_code: "BZ" },
        "Benin" => { entity_id: "9d7a4b74-ea28-e711-80c8-0050568902d3", country_code: "BJ" },
        "Bhutan" => { entity_id: "ad7a4b74-ea28-e711-80c8-0050568902d3", country_code: "BT" },
        "Bolivia" => { entity_id: "a57a4b74-ea28-e711-80c8-0050568902d3", country_code: "BO" },
        "Bosnia and Herzegovina" => { entity_id: "8d7a4b74-ea28-e711-80c8-0050568902d3", country_code: "BA" },
        "Botswana" => { entity_id: "af7a4b74-ea28-e711-80c8-0050568902d3", country_code: "BW" },
        "Brazil" => { entity_id: "a97a4b74-ea28-e711-80c8-0050568902d3", country_code: "BR" },
        "Brunei" => { entity_id: "a37a4b74-ea28-e711-80c8-0050568902d3", country_code: "BN" },
        "Bulgaria" => { entity_id: "977a4b74-ea28-e711-80c8-0050568902d3", country_code: "BG" },
        "Burkina Faso" => { entity_id: "957a4b74-ea28-e711-80c8-0050568902d3", country_code: "BF" },
        "Burundi" => { entity_id: "9b7a4b74-ea28-e711-80c8-0050568902d3", country_code: "BI" },
        "Cambodia" => { entity_id: "537b4b74-ea28-e711-80c8-0050568902d3", country_code: "KH" },
        "Cameroon" => { entity_id: "c77a4b74-ea28-e711-80c8-0050568902d3", country_code: "CM" },
        "Canada" => { entity_id: "b57a4b74-ea28-e711-80c8-0050568902d3", country_code: "CA" },
        "Cape Verde" => { entity_id: "d17a4b74-ea28-e711-80c8-0050568902d3", country_code: "CV" },
        "Central African Republic" => { entity_id: "bb7a4b74-ea28-e711-80c8-0050568902d3", country_code: "CF" },
        "Chad" => { entity_id: "1b7c4b74-ea28-e711-80c8-0050568902d3", country_code: "TD" },
        "Chile" => { entity_id: "c57a4b74-ea28-e711-80c8-0050568902d3", country_code: "CL" },
        "China" => { entity_id: "c97a4b74-ea28-e711-80c8-0050568902d3", country_code: "CN" },
        "Colombia" => { entity_id: "cb7a4b74-ea28-e711-80c8-0050568902d3", country_code: "CO" },
        "Comoros" => { entity_id: "577b4b74-ea28-e711-80c8-0050568902d3", country_code: "KM" },
        "Congo (Democratic Republic)" => { entity_id: "b97a4b74-ea28-e711-80c8-0050568902d3", country_code: "CD" },
        "Congo" => { entity_id: "bd7a4b74-ea28-e711-80c8-0050568902d3", country_code: "CD" },
        "Costa Rica" => { entity_id: "cd7a4b74-ea28-e711-80c8-0050568902d3", country_code: "CR" },
        "Croatia" => { entity_id: "2b7b4b74-ea28-e711-80c8-0050568902d3", country_code: "HR" },
        "Cuba" => { entity_id: "cf7a4b74-ea28-e711-80c8-0050568902d3", country_code: "CU" },
        "Cyprus" => { entity_id: "537c4b74-ea28-e711-80c8-0050568902d3", country_code: "CY" },
        "Czechia" => { entity_id: "d77a4b74-ea28-e711-80c8-0050568902d3", country_code: "CZ" },
        "Denmark" => { entity_id: "dd7a4b74-ea28-e711-80c8-0050568902d3", country_code: "DK" },
        "Djibouti" => { entity_id: "db7a4b74-ea28-e711-80c8-0050568902d3", country_code: "DJ" },
        "Dominica" => { entity_id: "df7a4b74-ea28-e711-80c8-0050568902d3", country_code: "DM" },
        "Dominican Republic" => { entity_id: "e17a4b74-ea28-e711-80c8-0050568902d3", country_code: "DO" },
        "East Timor" => { entity_id: "257c4b74-ea28-e711-80c8-0050568902d3", country_code: "TL" },
        "Ecuador" => { entity_id: "e57a4b74-ea28-e711-80c8-0050568902d3", country_code: "EC" },
        "Egypt" => { entity_id: "e97a4b74-ea28-e711-80c8-0050568902d3", country_code: "EG" },
        "El Salvador" => { entity_id: "117c4b74-ea28-e711-80c8-0050568902d3", country_code: "SV" },
        "Equatorial Guinea" => { entity_id: "197b4b74-ea28-e711-80c8-0050568902d3", country_code: "GQ" },
        "Eritrea" => { entity_id: "ed7a4b74-ea28-e711-80c8-0050568902d3", country_code: "ER" },
        "Estonia" => { entity_id: "e77a4b74-ea28-e711-80c8-0050568902d3", country_code: "EE" },
        "Eswatini" => { entity_id: "177c4b74-ea28-e711-80c8-0050568902d3", country_code: "SZ" }, # Using Swaziland entity ID
        "Ethiopia" => { entity_id: "f17a4b74-ea28-e711-80c8-0050568902d3", country_code: "ET" },
        "Fiji" => { entity_id: "f77a4b74-ea28-e711-80c8-0050568902d3", country_code: "FJ" },
        "Finland" => { entity_id: "f57a4b74-ea28-e711-80c8-0050568902d3", country_code: "FI" },
        "France" => { entity_id: "ff7a4b74-ea28-e711-80c8-0050568902d3", country_code: "FR" },
        "Gabon" => { entity_id: "017b4b74-ea28-e711-80c8-0050568902d3", country_code: "GA" },
        "Georgia" => { entity_id: "077b4b74-ea28-e711-80c8-0050568902d3", country_code: "GE" },
        "Germany" => { entity_id: "d97a4b74-ea28-e711-80c8-0050568902d3", country_code: "DE" },
        "Ghana" => { entity_id: "0d7b4b74-ea28-e711-80c8-0050568902d3", country_code: "GH" },
        "Greece" => { entity_id: "1b7b4b74-ea28-e711-80c8-0050568902d3", country_code: "GR" },
        "Grenada" => { entity_id: "057b4b74-ea28-e711-80c8-0050568902d3", country_code: "GD" },
        "Guatemala" => { entity_id: "1f7b4b74-ea28-e711-80c8-0050568902d3", country_code: "GT" },
        "Guinea" => { entity_id: "157b4b74-ea28-e711-80c8-0050568902d3", country_code: "GN" },
        "Guinea-Bissau" => { entity_id: "237b4b74-ea28-e711-80c8-0050568902d3", country_code: "GW" },
        "Guyana" => { entity_id: "257b4b74-ea28-e711-80c8-0050568902d3", country_code: "GY" },
        "Haiti" => { entity_id: "2d7b4b74-ea28-e711-80c8-0050568902d3", country_code: "HT" },
        "Honduras" => { entity_id: "297b4b74-ea28-e711-80c8-0050568902d3", country_code: "HN" },
        "Hungary" => { entity_id: "2f7b4b74-ea28-e711-80c8-0050568902d3", country_code: "HU" },
        "Iceland" => { entity_id: "437b4b74-ea28-e711-80c8-0050568902d3", country_code: "IS" },
        "India" => { entity_id: "3b7b4b74-ea28-e711-80c8-0050568902d3", country_code: "IN" },
        "Indonesia" => { entity_id: "337b4b74-ea28-e711-80c8-0050568902d3", country_code: "ID" },
        "Iran" => { entity_id: "417b4b74-ea28-e711-80c8-0050568902d3", country_code: "IR" },
        "Iraq" => { entity_id: "3f7b4b74-ea28-e711-80c8-0050568902d3", country_code: "IQ" },
        "Ireland" => { entity_id: "357b4b74-ea28-e711-80c8-0050568902d3", country_code: "IE" },
        "Israel" => { entity_id: "377b4b74-ea28-e711-80c8-0050568902d3", country_code: "IL" },
        "Italy" => { entity_id: "457b4b74-ea28-e711-80c8-0050568902d3", country_code: "IT" },
        "Ivory Coast" => { entity_id: "c17a4b74-ea28-e711-80c8-0050568902d3", country_code: "CI" },
        "Jamaica" => { entity_id: "497b4b74-ea28-e711-80c8-0050568902d3", country_code: "JM" },
        "Japan" => { entity_id: "4d7b4b74-ea28-e711-80c8-0050568902d3", country_code: "JP" },
        "Jordan" => { entity_id: "4b7b4b74-ea28-e711-80c8-0050568902d3", country_code: "JO" },
        "Kazakhstan" => { entity_id: "637b4b74-ea28-e711-80c8-0050568902d3", country_code: "KZ" },
        "Kenya" => { entity_id: "4f7b4b74-ea28-e711-80c8-0050568902d3", country_code: "KE" },
        "Kiribati" => { entity_id: "557b4b74-ea28-e711-80c8-0050568902d3", country_code: "KI" },
        "Kosovo" => { entity_id: "e37b4b74-ea28-e711-80c8-0050568902d3", country_code: "XK" },
        "Kuwait" => { entity_id: "5f7b4b74-ea28-e711-80c8-0050568902d3", country_code: "KW" },
        "Kyrgyzstan" => { entity_id: "517b4b74-ea28-e711-80c8-0050568902d3", country_code: "KG" },
        "Laos" => { entity_id: "657b4b74-ea28-e711-80c8-0050568902d3", country_code: "LA" },
        "Latvia" => { entity_id: "777b4b74-ea28-e711-80c8-0050568902d3", country_code: "LV" },
        "Lebanon" => { entity_id: "677b4b74-ea28-e711-80c8-0050568902d3", country_code: "LB" },
        "Lesotho" => { entity_id: "717b4b74-ea28-e711-80c8-0050568902d3", country_code: "LS" },
        "Liberia" => { entity_id: "6f7b4b74-ea28-e711-80c8-0050568902d3", country_code: "LR" },
        "Libya" => { entity_id: "797b4b74-ea28-e711-80c8-0050568902d3", country_code: "LY" },
        "Liechtenstein" => { entity_id: "6b7b4b74-ea28-e711-80c8-0050568902d3", country_code: "LI" },
        "Lithuania" => { entity_id: "737b4b74-ea28-e711-80c8-0050568902d3", country_code: "LT" },
        "Luxembourg" => { entity_id: "757b4b74-ea28-e711-80c8-0050568902d3", country_code: "LU" },
        "Madagascar" => { entity_id: "857b4b74-ea28-e711-80c8-0050568902d3", country_code: "MG" },
        "Malawi" => { entity_id: "a17b4b74-ea28-e711-80c8-0050568902d3", country_code: "MW" },
        "Malaysia" => { entity_id: "a57b4b74-ea28-e711-80c8-0050568902d3", country_code: "MY" },
        "Maldives" => { entity_id: "9f7b4b74-ea28-e711-80c8-0050568902d3", country_code: "MV" },
        "Mali" => { entity_id: "8b7b4b74-ea28-e711-80c8-0050568902d3", country_code: "ML" },
        "Malta" => { entity_id: "9b7b4b74-ea28-e711-80c8-0050568902d3", country_code: "MT" },
        "Marshall Islands" => { entity_id: "877b4b74-ea28-e711-80c8-0050568902d3", country_code: "MH" },
        "Mauritania" => { entity_id: "977b4b74-ea28-e711-80c8-0050568902d3", country_code: "MR" },
        "Mauritius" => { entity_id: "9d7b4b74-ea28-e711-80c8-0050568902d3", country_code: "MU" },
        "Mexico" => { entity_id: "a37b4b74-ea28-e711-80c8-0050568902d3", country_code: "MX" },
        "Micronesia" => { entity_id: "fb7a4b74-ea28-e711-80c8-0050568902d3", country_code: "FM" },
        "Moldova" => { entity_id: "7f7b4b74-ea28-e711-80c8-0050568902d3", country_code: "MD" },
        "Monaco" => { entity_id: "7d7b4b74-ea28-e711-80c8-0050568902d3", country_code: "MC" },
        "Mongolia" => { entity_id: "8f7b4b74-ea28-e711-80c8-0050568902d3", country_code: "MN" },
        "Montenegro" => { entity_id: "817b4b74-ea28-e711-80c8-0050568902d3", country_code: "ME" },
        "Morocco" => { entity_id: "7b7b4b74-ea28-e711-80c8-0050568902d3", country_code: "MA" },
        "Mozambique" => { entity_id: "a77b4b74-ea28-e711-80c8-0050568902d3", country_code: "MZ" },
        "Myanmar (Burma)" => { entity_id: "8d7b4b74-ea28-e711-80c8-0050568902d3", country_code: "MM" },
        "Namibia" => { entity_id: "a97b4b74-ea28-e711-80c8-0050568902d3", country_code: "NA" },
        "Nauru" => { entity_id: "bb7b4b74-ea28-e711-80c8-0050568902d3", country_code: "NR" },
        "Nepal" => { entity_id: "b97b4b74-ea28-e711-80c8-0050568902d3", country_code: "NP" },
        "Netherlands" => { entity_id: "b57b4b74-ea28-e711-80c8-0050568902d3", country_code: "NL" },
        "New Zealand" => { entity_id: "bf7b4b74-ea28-e711-80c8-0050568902d3", country_code: "NZ" },
        "Nicaragua" => { entity_id: "b37b4b74-ea28-e711-80c8-0050568902d3", country_code: "NI" },
        "Niger" => { entity_id: "ad7b4b74-ea28-e711-80c8-0050568902d3", country_code: "NE" },
        "Nigeria" => { entity_id: "b17b4b74-ea28-e711-80c8-0050568902d3", country_code: "NG" },
        "North Korea" => { entity_id: "5b7b4b74-ea28-e711-80c8-0050568902d3", country_code: "KP" },
        "North Macedonia" => { entity_id: "897b4b74-ea28-e711-80c8-0050568902d3", country_code: "MK" },
        "Norway" => { entity_id: "b77b4b74-ea28-e711-80c8-0050568902d3", country_code: "NO" },
        "Oman" => { entity_id: "c17b4b74-ea28-e711-80c8-0050568902d3", country_code: "OM" },
        "Pakistan" => { entity_id: "cd7b4b74-ea28-e711-80c8-0050568902d3", country_code: "PK" },
        "Palau" => { entity_id: "db7b4b74-ea28-e711-80c8-0050568902d3", country_code: "PW" },
        "Panama" => { entity_id: "c37b4b74-ea28-e711-80c8-0050568902d3", country_code: "PA" },
        "Papua New Guinea" => { entity_id: "c97b4b74-ea28-e711-80c8-0050568902d3", country_code: "PG" },
        "Paraguay" => { entity_id: "dd7b4b74-ea28-e711-80c8-0050568902d3", country_code: "PA" },
        "Peru" => { entity_id: "c57b4b74-ea28-e711-80c8-0050568902d3", country_code: "PE" },
        "Philippines" => { entity_id: "cb7b4b74-ea28-e711-80c8-0050568902d3", country_code: "PH" },
        "Poland" => { entity_id: "cf7b4b74-ea28-e711-80c8-0050568902d3", country_code: "PL" },
        "Portugal" => { entity_id: "d97b4b74-ea28-e711-80c8-0050568902d3", country_code: "PT" },
        "Qatar" => { entity_id: "df7b4b74-ea28-e711-80c8-0050568902d3", country_code: "QA" },
        "Romania" => { entity_id: "e77b4b74-ea28-e711-80c8-0050568902d3", country_code: "RO" },
        "Russia" => { entity_id: "eb7b4b74-ea28-e711-80c8-0050568902d3", country_code: "RU" },
        "Rwanda" => { entity_id: "ed7b4b74-ea28-e711-80c8-0050568902d3", country_code: "RW" },
        "Samoa" => { entity_id: "517c4b74-ea28-e711-80c8-0050568902d3", country_code: "WS" },
        "San Marino" => { entity_id: "057c4b74-ea28-e711-80c8-0050568902d3", country_code: "SM" },
        "Sao Tome and Principe" => { entity_id: "0f7c4b74-ea28-e711-80c8-0050568902d3", country_code: "ST" },
        "Saudi Arabia" => { entity_id: "ef7b4b74-ea28-e711-80c8-0050568902d3", country_code: "SA" },
        "Senegal" => { entity_id: "077c4b74-ea28-e711-80c8-0050568902d3", country_code: "SN" },
        "Serbia" => { entity_id: "e97b4b74-ea28-e711-80c8-0050568902d3", country_code: "RS" },
        "Seychelles" => { entity_id: "f37b4b74-ea28-e711-80c8-0050568902d3", country_code: "SC" },
        "Sierra Leone" => { entity_id: "037c4b74-ea28-e711-80c8-0050568902d3", country_code: "SL" },
        "Singapore" => { entity_id: "f97b4b74-ea28-e711-80c8-0050568902d3", country_code: "SG" },
        "Slovakia" => { entity_id: "017c4b74-ea28-e711-80c8-0050568902d3", country_code: "SK" },
        "Slovenia" => { entity_id: "fd7b4b74-ea28-e711-80c8-0050568902d3", country_code: "SI" },
        "Solomon Islands" => { entity_id: "f17b4b74-ea28-e711-80c8-0050568902d3", country_code: "SB" },
        "Somalia" => { entity_id: "097c4b74-ea28-e711-80c8-0050568902d3", country_code: "SO" },
        "South Africa" => { entity_id: "817c4b74-ea28-e711-80c8-0050568902d3", country_code: "ZA" },
        "South Korea" => { entity_id: "5d7b4b74-ea28-e711-80c8-0050568902d3", country_code: "KR" },
        "South Sudan" => { entity_id: "0d7c4b74-ea28-e711-80c8-0050568902d3", country_code: "SS" },
        "Spain" => { entity_id: "ef7a4b74-ea28-e711-80c8-0050568902d3", country_code: "ES" },
        "Sri Lanka" => { entity_id: "6d7b4b74-ea28-e711-80c8-0050568902d3", country_code: "LK" },
        "St Kitts and Nevis" => { entity_id: "597b4b74-ea28-e711-80c8-0050568902d3", country_code: "KN" },
        "St Lucia" => { entity_id: "697b4b74-ea28-e711-80c8-0050568902d3", country_code: "LC" },
        "St Vincent" => { entity_id: "437c4b74-ea28-e711-80c8-0050568902d3", country_code: "VC" },
        "Sudan" => { entity_id: "f57b4b74-ea28-e711-80c8-0050568902d3", country_code: "SD" },
        "Suriname" => { entity_id: "0b7c4b74-ea28-e711-80c8-0050568902d3", country_code: "SR" },
        "Sweden" => { entity_id: "f77b4b74-ea28-e711-80c8-0050568902d3", country_code: "SE" },
        "Switzerland" => { entity_id: "bf7a4b74-ea28-e711-80c8-0050568902d3", country_code: "CH" },
        "Syria" => { entity_id: "157c4b74-ea28-e711-80c8-0050568902d3", country_code: "SY" },
        "Tajikistan" => { entity_id: "217c4b74-ea28-e711-80c8-0050568902d3", country_code: "TJ" },
        "Tanzania" => { entity_id: "357c4b74-ea28-e711-80c8-0050568902d3", country_code: "TZ" },
        "Thailand" => { entity_id: "1f7c4b74-ea28-e711-80c8-0050568902d3", country_code: "TH" },
        "The Bahamas" => { entity_id: "ab7a4b74-ea28-e711-80c8-0050568902d3", country_code: "BS" },
        "The Gambia" => { entity_id: "137b4b74-ea28-e711-80c8-0050568902d3", country_code: "GM" },
        "Togo" => { entity_id: "1d7c4b74-ea28-e711-80c8-0050568902d3", country_code: "TG" },
        "Tonga" => { entity_id: "2b7c4b74-ea28-e711-80c8-0050568902d3", country_code: "TO" },
        "Trinidad and Tobago" => { entity_id: "2f7c4b74-ea28-e711-80c8-0050568902d3", country_code: "TT" },
        "Tunisia" => { entity_id: "297c4b74-ea28-e711-80c8-0050568902d3", country_code: "TN" },
        "Turkey" => { entity_id: "2d7c4b74-ea28-e711-80c8-0050568902d3", country_code: "TR" },
        "Turkmenistan" => { entity_id: "277c4b74-ea28-e711-80c8-0050568902d3", country_code: "TM" },
        "Tuvalu" => { entity_id: "317c4b74-ea28-e711-80c8-0050568902d3", country_code: "TV" },
        "Uganda" => { entity_id: "397c4b74-ea28-e711-80c8-0050568902d3", country_code: "UG" },
        "Ukraine" => { entity_id: "377c4b74-ea28-e711-80c8-0050568902d3", country_code: "UA" },
        "United Arab Emirates" => { entity_id: "6f7a4b74-ea28-e711-80c8-0050568902d3", country_code: "AE" },
        "United Kingdom" => { entity_id: "037b4b74-ea28-e711-80c8-0050568902d3", country_code: "GB" },
        "United States" => { entity_id: "3b7c4b74-ea28-e711-80c8-0050568902d3", country_code: "US" },
        "Uruguay" => { entity_id: "3d7c4b74-ea28-e711-80c8-0050568902d3", country_code: "UY" },
        "Uzbekistan" => { entity_id: "3f7c4b74-ea28-e711-80c8-0050568902d3", country_code: "UZ" },
        "Vanuatu" => { entity_id: "4d7c4b74-ea28-e711-80c8-0050568902d3", country_code: "VU" },
        "Vatican City" => { entity_id: "417c4b74-ea28-e711-80c8-0050568902d3", country_code: "VA" },
        "Venezuela" => { entity_id: "457c4b74-ea28-e711-80c8-0050568902d3", country_code: "VE" },
        "Vietnam" => { entity_id: "4b7c4b74-ea28-e711-80c8-0050568902d3", country_code: "VN" },
        "Yemen" => { entity_id: "7d7c4b74-ea28-e711-80c8-0050568902d3", country_code: "YE" },
        "Zambia" => { entity_id: "837c4b74-ea28-e711-80c8-0050568902d3", country_code: "ZM" },
        "Zimbabwe" => { entity_id: "857c4b74-ea28-e711-80c8-0050568902d3", country_code: "ZW" },
      }.freeze
    end
  end
end
