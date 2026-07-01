addon.name    = 'mission'
addon.author  = 'Lexia'
addon.version = '1.0'
addon.desc    = 'Displays condensed FFXI mission steps in the chat log'

require('common')

------------------------------------------------------------------------
-- Mission data
-- Add steps for each mission as short strings.
-- Nation missions use 'rank-num' keys (e.g. '1-1', '2-3').
-- Expansion missions use the mission number as a string (e.g. '1', '10').
------------------------------------------------------------------------

local MISSIONS = {

    ---------------------------------------------------------------------------
    -- San d'Oria
    ---------------------------------------------------------------------------
    sandy = {
        ['1-1'] = { name="Smash the Orcish Scouts", steps={
            "Talk to any Gate Guard",
            "Kill Orcish Fodders until an Orcish Axe drops",
            "Trade the Orcish Axe to any Gate Guard",
        }},
        ['1-2'] = { name="Bat Hunt", steps={
            "Talk to any Gate Guard",
            "Kill Ding Bats in King Ranperre's Tomb (night only) until Orcish Mail Scales drop",
            "Touch the Tombstone at H/I-10 in KRT for a CS",
            "(Bats and tombstone can be done in either order)",
            "Trade the Orcish Mail Scales to any Gate Guard",
        }},
        ['1-3'] = { name="Save the Children", steps={
            "Talk to any Gate Guard",
            "Talk to Arnau in Northern San d'Oria (M-6)",
            "Go to Ghelsba Outpost, examine Hut Door at G-9",
            "Fight 3 orcs, then CS at the Hut Door",
            "Return to any Gate Guard",
        }},
        ['2-1'] = { name="The Rescue Drill", steps={
            "Talk to any Gate Guard",
            "Talk to Galaihaurat in La Theine Plateau (E-6)",
            "Talk to Ruillont in Ordelle's Caves (G-3)",
            "In La Theine, check Deaufrain/Equesobillot/Galaihaurat - one holds a Bronze Sword",
            "Trade the Bronze Sword to Ruillont in Ordelle's Caves (G-3)",
            "Talk to Vicorpass in La Theine Plateau (F-6)",
            "Return to any Gate Guard",
        }},
        ['2-2'] = { name="The Davoi Report", steps={
            "Talk to any Gate Guard",
            "Go to Davoi, talk to Zantaviat",
            "Examine ! at J-8 in Davoi",
            "Talk to Zantaviat again",
            "Return to any Gate Guard",
            "Go to Northern San d'Oria, enter Door: Papal Chambers for CS",
        }},
        ['2-3'] = { name="Journey Abroad", steps={
            "Talk to Halver in Chateau d'Oraguille (I-9)",
            "-- BASTOK FIRST PATH --",
            "Talk to Savae E. Paleade in Metalworks, top floor (I-9)",
            "Talk to Pius (J-8), then Grohm (G-9)",
            "Palborough Mines: trade a Pickaxe to Mythril Seam at F-7 or I-8 to get Mine Gravel",
            "3rd floor: trade Gravel into Refiner lid, pull lever, walk off ledge, pull lever again - get Mythril Sand",
            "Return to Metalworks, talk to Savae E. Paleade",
            "Windurst Woods: talk to Mourices (F/G-10)",
            "Heaven's Tower: talk to Kupipi",
            "Fight at Balga's Dais",
            "Return to Mourices in Windurst Woods",
            "-- WINDURST FIRST PATH --",
            "Talk to Mourices in Windurst Woods",
            "Talk to Kupipi in Heaven's Tower",
            "Giddeus: kill Zhuu Buxu the Silent x2 for 2 Parana Shields",
            "Trade 1 Parana Shield to Uu Zhoumo",
            "Trade the other Parana Shield to Mourices in Windurst Woods",
            "Metalworks: talk to Savae E. Paleade",
            "Talk to Pius, then Grohm",
            "Fight at Waughroon Shrine",
            "Talk to Savae E. Paleade in Metalworks",
            "-- BOTH PATHS END HERE --",
            "Return to Halver in Chateau d'Oraguille (I-9)",
        }},
        ['3-1'] = { name="Infiltrate Davoi", steps={
            "Talk to any Gate Guard",
            "Chateau d'Oraguille: enter Door: Prince's Royal Room (G/H-7) for CS",
            "Go to Davoi for CS",
            "Talk to Quemaricond (H-7)",
            "Return to Door: Prince's Royal Room in Chateau d'Oraguille",
        }},
        ['3-2'] = { name="The Crystal Spring", steps={
            "Talk to any Gate Guard",
            "Fish a Crystal Bass from J-9 in Jugner Forest (no fishing skill needed)",
            "Trade the Crystal Bass to any Gate Guard",
            "Chateau d'Oraguille: CS",
            "Talk to Chalvatot (F-7)",
        }},
        ['3-3'] = { name="Appointment to Jeuno", steps={
            "Talk to any Gate Guard",
            "Talk to Halver, then enter Door: Great Hall",
            "Ru'Lude Gardens: talk to Nelcabrit (H-9)",
            "Using Delkfutt's Key, enter Cermet Door at L-8 in Delkfutt's Tower basement",
        }},
        ['4-1'] = { name="Magicite", steps={
            "Ru'Lude Gardens: talk to Nelcabrit",
            "Enter Door: San d'Orian Embassy",
            "Enter Door: Audience Chamber",
            "Lower Jeuno: talk to Aldo",
            "-- IF YOU HAVEN'T DONE A MAGICITE MISSION BEFORE --",
            "Upper Jeuno: talk to Paya-Sabya",
            "(The following 3 trades can be done in any order)",
            "Lower Jeuno: talk to Muckvis for a Yagudo Torch",
            "Lower Jeuno: trade a Quadav Charm to Sattal-Mansal (receive Coruscant Rosary)",
            "Lower Jeuno: trade a Quadav Augury Shell to Sattal-Mansal (receive Black Matinee Necklace)",
            "Upper Jeuno: trade Coeurl Meat to Baudin (receive Crest of Davoi)",
            "(The 3 magicite locations can be visited in any order)",
            "Davoi (G-7): go through the Wall of Dark Arts > Monastic Cavern - get Magicite",
            "Castle Oztroja: Brass Door (I-8) > upstairs to G-7 > next map I-7 > next map H-9 light torch > south then right to Brass Door > Altar Room - get Magicite",
            "Beadeaux: hug left wall to tunnel at H-7 > left into Qulun Dome > get Magicite",
            "Ru'Lude Gardens: Audience Chamber (H-5) > talk to Nelcabrit",
        }},
        ['5-1'] = { name="Ruins of Fei'Yin", steps={
            "Chateau d'Oraguille: CS",
            "Talk to any Gate Guard",
            "Talk to Halver in Chateau d'Oraguille",
            "Fei'Yin: CS",
            "Fight in Qu'Bia Arena",
            "Return to Halver",
        }},
        ['5-2'] = { name="The Shadow Lord", steps={
            "Talk to Halver in Chateau d'Oraguille",
            "Enter Door: Prince's Royal Room",
            "Enter Door: Throne Room for CS",
            "Fight the Shadow Lord",
            "Return to Halver",
            "Enter Door: Great Hall",
            "Enter Door: Prince's Royal Room (receive Trust: Trion)",
        }},
        ['6-1'] = { name="Leaute's Last Wishes", steps={
            "Talk to Halver in Chateau d'Oraguille",
            "Enter Door: Great Hall",
            "Talk to Halver again",
            "Western Altepa Desert (G-7): fight Dreamrose",
            "Check G-7 again for Dreamrose",
            "Return to Halver",
            "Chateau d'Oraguille (F-8): CS",
        }},
        ['6-2'] = { name="Ranperre's Final Rest", steps={
            "Talk to any Gate Guard",
            "Enter Door: Prince's Royal Room in Chateau d'Oraguille",
            "King Ranperre's Tomb (H-8): fight at Heavy Stone Door",
            "Go through Heavy Stone Door and touch the Tombstone",
            "Talk to any Gate Guard (x2)",
            "Zone out and talk to Gate Guard again",
            "Chateau d'Oraguille: enter Door: Prince's Royal Room",
            "King Ranperre's Tomb: examine Heavy Stone Door",
            "Return to any Gate Guard",
        }},
        ['7-1'] = { name="Prestige of the Papsque", steps={
            "Talk to any Gate Guard",
            "Northern San d'Oria: enter Door: Papal Chambers",
            "Bostounieux Oubliette (E-7): drop into sewer lid, follow right wall to exit to East Ronfaure",
            "Examine ??? for a fight",
            "Examine ??? to receive Ancient Stone Tablet",
            "Northern San d'Oria: enter Door: Papal Chambers",
        }},
        ['7-2'] = { name="The Secret Weapon", steps={
            "Talk to any Gate Guard",
            "Chateau d'Oraguille: CS",
            "Talk to any Gate Guard",
            "Horlais Peak: fight",
            "Return to any Gate Guard",
        }},
        ['8-1'] = { name="Coming of Age", steps={
            "Talk to any Gate Guard",
            "Chateau d'Oraguille: CS",
            "Talk to Halver",
            "Eastern Altepa Desert (H-10)",
            "Quicksand Caves: drop down at E-11, go to Fountain of Kings (G-14) for a fight",
            "Examine Fountain of Kings for Drops of Amnio",
            "Return to Halver",
            "Wait 1 minute, then exit to Northern San d'Oria for CS",
        }},
        ['8-2'] = { name="Lightbringer", steps={
            "Talk to any Gate Guard",
            "Chateau d'Oraguille: enter Door: Great Hall",
            "Talk to Rahal (H-9)",
            "Get Prelate Key from Tonberry Stabbers in Temple of Uggalepih, or Slashers/Choppers in Den of Rancor",
            "Temple of Uggalepih Map 2: go upstairs to J-10",
            "Go up the stairs and examine ??? for 3 pieces of Broken Key",
            "Check the other door for a fight",
            "Check again for CS",
            "Return to Chateau d'Oraguille: enter Door: Great Hall",
        }},
        ['9-1'] = { name="Breaking Barriers", steps={
            "Talk to any Gate Guard",
            "Chateau d'Oraguille: enter Door: Great Hall",
            "Valley of Sorrows (I-8): examine ???",
            "Xarcabard (H-7) upper level: examine ???",
            "Necropolis: south room (G-9), drop through center hole, head east to exit at J-9",
            "Batallia Downs (J-11): examine ??? for a fight",
            "Examine ??? for CS",
            "Return to Chateau d'Oraguille: enter Door: Great Hall",
        }},
        ['9-2'] = { name="Heir to the Light", steps={
            "Talk to any Gate Guard",
            "Zone into Northern San d'Oria for CS",
            "Chateau d'Oraguille: CS",
            "Fei'Yin: CS",
            "Qu'Bia Arena: fight",
            "Northern San d'Oria: CS",
            "Chateau d'Oraguille: enter Door: Great Hall",
            "King Ranperre's Tomb (H-8): examine Heavy Stone Door",
            "Chateau d'Oraguille: talk to Halver",
            "Southern San d'Oria",
        }},
    },

    ---------------------------------------------------------------------------
    -- Bastok
    ---------------------------------------------------------------------------
    bastok = {
        ['1-1'] = { name="The Zeruhn Report", steps={
            "Talk to any Gate Guard",
            "Zeruhn Mines (H-11): talk to Makarim",
            "Metalworks top floor: talk to Naji (J-8)",
        }},
        ['1-2'] = { name="A Geological Survey", steps={
            "Talk to any Gate Guard",
            "Metalworks top floor (G-8): talk to Cid",
            "Dangruf Wadi (I-8): step on geyser",
            "Return to Cid",
        }},
        ['1-3'] = { name="Fetichism", steps={
            "Talk to any Gate Guard",
            "Palborough Mines: kill Quadav to get one Fetich piece of each type",
            "Trade all Fetich pieces to any Gate Guard",
        }},
        ['2-1'] = { name="The Crystal Line", steps={
            "Talk to any Gate Guard",
            "Metalworks: trade Cid a Faded Crystal",
            "Talk to Ayame (K-7)",
        }},
        ['2-2'] = { name="Wading Beasts", steps={
            "Talk to any Gate Guard",
            "Metalworks (J-8): trade Alois a Lizard Egg",
        }},
        ['2-3'] = { name="The Emissary", steps={
            "Talk to any Gate Guard",
            "Metalworks: talk to Naji",
            "-- SANDY FIRST PATH --",
            "Northern San d'Oria: talk to Baraka",
            "Talk to Helaku (K-10)",
            "Chateau d'Oraguille: talk to Halver",
            "Ghelsba Outpost (H-7): fight Warchief Vatgit",
            "Northern San d'Oria: talk to Helaku",
            "Port Windurst (F-6): talk to Melek",
            "Heaven's Tower: talk to Kupipi",
            "Giddeus: fight",
            "Port Windurst: talk to Melek",
            "-- WINDURST FIRST PATH --",
            "Talk to Melek in Port Windurst (F-6)",
            "Talk to Kupipi in Heaven's Tower",
            "Talk to Gold Skull in Port Windurst (F-6)",
            "Giddeus: Kill Eyy Mon the Ironbreaker (G-7)",
            "Trade Aspir Knife to Uu Zhoumo",
            "Talk to Melek in Port Windurst",
            "Northern San d'Oria: talk to Helaku (K-10)",
            "Chateau d'Oraguille: talk to Halver",
            "Horlais Peak: fight",
            "-- BOTH PATHS END HERE --",
            "Metalworks: talk to Naji",
        }},
        ['3-1'] = { name="The Four Musketeers", steps={
            "Talk to any Gate Guard",
            "Metalworks (J-8): talk to Iron Eater",
            "Beadeaux: kill 20 Copper Quadavs",
            "Pashhow Marshlands: CS",
        }},
        ['3-2'] = { name="To the Forsaken Mines", steps={
            "Talk to any Gate Guard",
            "Bastok Mines: talk to Davyad (K-6)",
            "Gusgen Mines (J-7): trade Hare Meat to ??? to fight Blind Moby",
            "Obtain Glocolite from Blind Moby",
            "Trade Glocolite to any Gate Guard",
        }},
        ['3-3'] = { name="Jeuno", steps={
            "Talk to any Gate Guard",
            "Metalworks (J-9): talk to Lucius",
            "Ru'Lude Gardens (H-10): talk to Goggehn",
            "Using Delkfutt's Key, enter Cermet Door at K-9 in Delkfutt's Tower basement",
            "Ru'Lude Gardens: enter Door: Bastokan Embassy",
        }},
        ['4-1'] = { name="Magicite", steps={
            "Ru'Lude Gardens: talk to Goggehn",
            "Enter Door: Bastokan Embassy",
            "Enter Door: Audience Chamber",
            "Lower Jeuno: talk to Aldo",
            "-- IF YOU HAVEN'T DONE A MAGICITE MISSION BEFORE --",
            "Upper Jeuno: talk to Paya-Sabya",
            "(The following 3 trades can be done in any order)",
            "Lower Jeuno: talk to Muckvis for a Yagudo Torch",
            "Lower Jeuno: trade a Quadav Charm to Sattal-Mansal (receive Coruscant Rosary)",
            "Lower Jeuno: trade a Quadav Augury Shell to Sattal-Mansal (receive Black Matinee Necklace)",
            "Upper Jeuno: trade Coeurl Meat to Baudin (receive Crest of Davoi)",
            "(The 3 magicite locations can be visited in any order)",
            "Davoi (G-7): go through the Wall of Dark Arts > Monastic Cavern - get Magicite",
            "Castle Oztroja: Brass Door (I-8) > upstairs to G-7 > next map I-7 > next map H-9 light torch > south then right to Brass Door > Altar Room - get Magicite",
            "Beadeaux: hug left wall to tunnel at H-7 > left into Qulun Dome > get Magicite",
            "Ru'Lude Gardens: Audience Chamber (H-5) > talk to Goggehn",
        }},
        ['5-1'] = { name="Darkness Rising", steps={
            "Talk to any Gate Guard",
            "Talk to Naji in Metalworks",
            "Fei'Yin: CS",
            "Fight in Qu'Bia Arena",
            "Return to Naji",
        }},
        ['5-2'] = { name="Xarcabard, Land of Truths", steps={
            "Enter Door: President's Office in Metalworks",
            "Talk to Karst",
            "Enter Door: Throne Room for CS",
            "Fight the Shadow Lord",
            "Return to Karst",
            "Talk to Lucius in Metalworks (receive Trust: Volker)",
        }},
        ['6-1'] = { name="Return of the Talekeeper", steps={
            "Talk to any Gate Guard",
            "Bastok Mines (G/H-6): talk to Medicine Eagle",
            "Zeruhn Mines (H-6): talk to Drake Fang",
            "Western Altepa Desert (G-8): examine ??? for a fight",
            "Check ??? again",
            "Bastok Mines (J-7): talk to Tall Mountain",
        }},
        ['6-2'] = { name="The Pirates' Cove", steps={
            "Talk to any Gate Guard",
            "Metalworks: talk to Naji",
            "Norg (K-8): talk to Gilgamesh",
            "Bring Adaman Ore to Ifrit's Cauldron via Yhoator Jungle (I-5) entrance",
            "Trade Adaman Ore to ??? at (H-7) in the lava for a fight",
            "Norg: trade Gilgamesh a Frag Rock",
            "Metalworks: talk to Naji",
        }},
        ['7-1'] = { name="The Final Image", steps={
            "Talk to any Gate Guard",
            "Metalworks: talk to Cid",
            "Ro'Maeve: examine ??? (may be at D-10, E-9, E-10/11, G-9, I-8, J-8, K-10, K-11, L-10, or L-7) for a fight",
            "Check ??? again (may have moved) to receive Reinforced Cermet",
            "Metalworks: talk to Cid",
        }},
        ['7-2'] = { name="On My Way", steps={
            "Talk to any Gate Guard",
            "Metalworks: talk to Karst",
            "Port Bastok (E-6): talk to Hilda",
            "Waughroon Shrine: fight",
            "Metalworks: talk to Karst",
            "Bastok Mines (J-7): talk to Gumbah - CS reading a letter",
        }},
        ['8-1'] = { name="The Chains that Bind Us", steps={
            "Talk to any Gate Guard",
            "Metalworks: talk to Iron Eater",
            "Western Altepa Desert (G-5): enter Quicksand Caves",
            "Quicksand Caves: open Weighted Door at H-8",
            "Quicksand Caves: Weighted Door at I-10",
            "Quicksand Caves (G-11): examine ??? for a fight",
            "Galka Statue: CS with Zeid",
            "Western Altepa Desert (D-12): enter Quicksand Caves",
            "Go east to Weighted Doors at K-8",
            "Go east to Weighted Door at G-8",
            "Go east to ??? at H-8",
            "Metalworks: talk to Iron Eater",
        }},
        ['8-2'] = { name="Enter the Talekeeper", steps={
            "Talk to any Gate Guard",
            "Zeruhn Mines: talk to Drake Fang",
            "Kuftal Tunnel (south entrance): examine ??? at H-8 on upper level",
            "Head to lower level and examine ??? for a fight",
            "Examine ??? again to receive Old Piece of Wood",
            "Zeruhn Mines: talk to Drake Fang",
        }},
        ['9-1'] = { name="The Salt of the Earth", steps={
            "Talk to any Gate Guard",
            "Metalworks (J-8): talk to Alois",
            "Rabao (G-7): talk to Dancing Wolf - CS about Miraclesalt",
            "Gustav Tunnel Map 2 (G-6): examine ??? in pond - fight Gigaplasm",
            "Examine ??? to receive Miraclesalt",
            "Rabao: talk to Dancing Wolf",
            "Metalworks: talk to Alois",
        }},
        ['9-2'] = { name="Where Two Paths Converge", steps={
            "Talk to any Gate Guard",
            "Metalworks: talk to Iron Eater",
            "Throne Room: fight",
            "Metalworks: talk to Iron Eater",
        }},
    },

    ---------------------------------------------------------------------------
    -- Windurst
    ---------------------------------------------------------------------------
    windurst = {
        ['1-1'] = { name="The Horutoto Ruins Experiment", steps={
            "Talk to any Gate Guard",
            "Port Windurst (3-7): talk to Hakkuru-Rinkuru",
            "East Sarutabaruta (J-7): enter Inner Horutoto Ruins",
            "Inner Horutoto Ruins (H-9): examine Cracked Wall",
            "Examine Magical Gizmo at I-9",
            "Check the Ancient Magical Gizmos to receive Cracked Mana Orb",
            "Port Windurst: talk to Hakkuru-Rinkuru",
        }},
        ['1-2'] = { name="The Heart of the Matter", steps={
            "Talk to any Gate Guard",
            "Windurst Woods (H-9): talk to Apururu",
            "East Sarutabaruta (J-11): talk to Pore-Ohre",
            "Check all 6 pedestals",
            "Examine Cracked Wall on the east side, then Gate: Magical Gizmo",
            "Check the pedestals again",
            "Windurst Woods: talk to Apururu",
        }},
        ['1-3'] = { name="The Price of Peace", steps={
            "Talk to any Gate Guard",
            "Windurst Waters (south roof, J-8): talk to Leepe-Hoppe",
            "Giddeus (H-7): talk to Laa Mozi",
            "Giddeus (G-7): talk to Ghoo Pakya",
            "Talk to Leepe-Hoppe",
            "Talk to any Gate Guard",
        }},
        ['2-1'] = { name="Lost for Words", steps={
            "Talk to any Gate Guard",
            "Windurst Waters (G-8): talk to Tosuka-Poruka",
            "Windurst Woods (J-3): talk to Nanaa Mihgo",
            "Maze of Shakhrami Map 1 (G-6) to Map 2 (H-5): check Fossil Rocks for Lapis Coral",
            "Windurst Woods: talk to Nanaa Mihgo",
            "East Sarutabaruta (J-7): enter Inner Horutoto Ruins via Cracked Wall at G-9",
            "Inner Horutoto Ruins Map 2 (G-8): examine Mahogany Door",
            "Windurst Walls: enter House of the Hero (G-3)",
            "Windurst Waters: talk to Tosuka-Poruka",
        }},
        ['2-2'] = { name="A Testing Time", steps={
            "Talk to any Gate Guard",
            "Windurst Waters (L-6): talk to Moreno-Toeno",
            "Tahrongi Canyon: kill 30 monsters within the time limit",
            "In the final game hour of the time limit, speak to Moreno-Toeno",
        }},
        ['2-3'] = { name="The Three Kingdoms", steps={
            "Talk to any Gate Guard",
            "Heaven's Tower: talk to Kupipi",
            "-- BASTOK FIRST PATH --",
            "Metalworks (I-7): talk to Patt-Pott",
            "Talk to Pius (J-8), then Grohm (G-9)",
            "Palborough Mines: trade a Pickaxe to Mythril Seam at F-7 or I-8 to get Mine Gravel",
            "3rd floor: trade Gravel into Refiner lid, pull lever, walk off ledge, pull lever again - get Mythril Sand",
            "Return to Metalworks, trade Mythril sand to Patt-Pott",
            "Northern San d'Oria: talk to Kasaroro (H-9)",
            "Chateau d'Oraguille: talk to Halver",
            "Horlais Peak: fight",
            "Northern San d'Oria: talk to Kasaroro (H-9)",
             "-- SANDY FIRST PATH --",
            "Northern San d'Oria: talk to Heruze-Moruze then Helaku (K-10)",
            "Chateau d'Oraguille: talk to Halver",
            "Ghelsba Outpost (H-7): fight Warchief Vatgit",
            "Northern San d'Oria: talk to Kasaroro",
            "Metalworks (I-7): talk to Patt-Pott",
            "Talk to Pius (J-8), then Grohm (G-9)",
            "Waughroon Shrine: Fight",
            "Metalworks (I-7): talk to Patt-Pott",                  
            "-- BOTH PATHS END HERE --",
            "Return to Kupipi in Heaven's Tower",
        }},
        ['3-1'] = { name="To Each His Own Right", steps={
            "Talk to any Gate Guard",
            "Heaven's Tower: talk to Kupipi, then top floor Rhy Epocan",
            "Port Windurst (E-7): talk to Hakkuru-Rinkuru",
            "Castle Oztroja (I-8): go through trap door",
            "Heaven's Tower: talk to Rhy Epocan",
        }},
        ['3-2'] = { name="Written in the Stars", steps={
            "Talk to any Gate Guard",
            "Heaven's Tower (2nd floor): talk to Zubaba",
            "East Sarutabaruta (J-7): enter Inner Horutoto Ruins",
            "Pass through 3 Mage Gates to reach Gate of Light at G-7",
            "Heaven's Tower: talk to Zubaba",
        }},
        ['3-3'] = { name="A New Journey", steps={
            "Talk to any Gate Guard",
            "Heaven's Tower: enter Door: Vestal Chamber",
            "Ru'Lude Gardens (I-9): talk to Pakh-Jatalfih",
            "Using Delkfutt's Key, enter Cermet Door at L-7 in Delkfutt's Tower basement",
            "Ru'Lude Gardens: talk to Pakh-Jatalfih",
            "Enter Door: Windurstian Embassy",
        }},
        ['4-1'] = { name="Magicite", steps={
            "Ru'Lude Gardens: talk to Pakh-Jatalfih",
            "Enter Door: Windurstian Embassy",
            "Enter Door: Audience Chamber",
            "Lower Jeuno: talk to Aldo",
            "-- IF YOU HAVEN'T DONE A MAGICITE MISSION BEFORE --",
            "Upper Jeuno: talk to Paya-Sabya",
            "(The following 3 trades can be done in any order)",
            "Lower Jeuno: talk to Muckvis for a Yagudo Torch",
            "Lower Jeuno: trade a Quadav Charm to Sattal-Mansal (receive Coruscant Rosary)",
            "Lower Jeuno: trade a Quadav Augury Shell to Sattal-Mansal (receive Black Matinee Necklace)",
            "Upper Jeuno: trade Coeurl Meat to Baudin (receive Crest of Davoi)",
            "(The 3 magicite locations can be visited in any order)",
            "Davoi (G-7): go through the Wall of Dark Arts > Monastic Cavern - get Magicite",
            "Castle Oztroja: Brass Door (I-8) > upstairs to G-7 > next map I-7 > next map H-9 light torch > south then right to Brass Door > Altar Room - get Magicite",
            "Beadeaux: hug left wall to tunnel at H-7 > left into Qulun Dome > get Magicite",
            "Ru'Lude Gardens: Audience Chamber (H-5) > talk to Pakh-Jatalfih",
        }},
        ['5-1'] = { name="The Final Seal", steps={
            "Talk to any Gate Guard",
            "Heaven's Tower: enter Door: Vestal Chamber",
            "Fei'Yin: CS",
            "Fight in Qu'Bia Arena",
            "Heaven's Tower: enter Door: Vestal Chamber",
        }},
        ['5-2'] = { name="The Shadow Awaits", steps={
            "Heaven's Tower: enter Door: Vestal Chamber",
            "Enter Door: Throne Room for CS",
            "Fight the Shadow Lord",
            "Heaven's Tower: enter Door: Vestal Chamber",
        }},
        ['6-1'] = { name="Full Moon Fountain", steps={
            "Talk to any Gate Guard",
            "Port Windurst: talk to Hakkuru-Rinkuru",
            "West Sarutabaruta (F-11): enter Outer Horutoto Ruins",
            "Map 4: Cracked Wall at I-8 > Cracked Wall at J-8 > Magical Gizmo - fight 4 Jack Cardians",
            "Check the door",
            "Enter Full Moon Fountain",
        }},
        ['6-2'] = { name="Saintly Invitation", steps={
            "Talk to any Gate Guard",
            "Heaven's Tower: enter Door: Vestal Chamber",
            "Giddeus: fight",
            "Castle Oztroja Map 4 (H-5): obtain Judgment Key from Flagellants",
            "Go through Password trap door",
            "Trade Judgment Key to Brass Door at far side of the room",
            "Talk to Kaa Toru the Just",
            "Heaven's Tower: enter Door: Vestal Chamber",
        }},
        ['7-1'] = { name="The Sixth Ministry", steps={
            "Talk to any Gate Guard",
            "Windurst Waters (G-8): talk to Tosuka-Poruka",
            "Toraimarai Canal Map 2 (G-8): fight Hinge Oils",
            "Go through Marble Door at H-8",
            "Examine Tome of Magic",
            "Windurst Waters: talk to Tosuka-Poruka",
        }},
        ['7-2'] = { name="Awakening of the Gods", steps={
            "Talk to any Gate Guard",
            "Windurst Waters South: talk to Leepe-Hoppe",
            "Talk to Kerutoto",
            "Kazham (H-11): talk to Romaa Mihgo",
            "Temple of Uggalepih Map 3 (J-9): kill Bonze Marberry for Cursed Key",
            "Temple of Uggalepih (J-6): Granite Door",
            "Windurst Waters South: talk to Leepe-Hoppe",
        }},
        ['8-1'] = { name="Vain", steps={
            "Talk to any Gate Guard",
            "Windurst Waters (L-6): talk to Moreno-Toeno",
            "Ro'Maeve (H-6): examine Gu'Hau Spring",
            "Davoi (H-8) via Monastic Cavern entrance 2: kill Dirtyhanded Gochakzuk for Curse Wand",
            "Talk to Sedal-Godjal (J-8), then trade him the Curse Wand",
            "Windurst Waters: talk to Moreno-Toeno",
        }},
        ['8-2'] = { name="The Jester Who'd Be King", steps={
            "Talk to any Gate Guard",
            "Windurst Woods: talk to Apururu",
            "(The following 3 can be done in any order)",
            "Fei'Yin Map 2 (F-6): talk to Rukususu",
            "Davoi (J-8): talk to Sedal-Godjal",
            "Windurst Waters: talk to Tosuka-Poruka",
            "Windurst Woods: talk to Apururu",
            "Heaven's Tower: talk to Kupipi",
            "West Sarutabaruta (R-4): enter Outer Horutoto Ruins",
            "Cracked Wall at I-6",
            "Cracked Wall at G-8 - fight",
            "Check Cracked Wall for CS",
            "Windurst Woods: talk to Apururu",
            "Windurst Walls (K-7): talk to Shantotto",
            "Windurst Woods: talk to Apururu",
            "Inner Horutoto Ruins: pass 3 Mage Gates to Gate of Darkness at I-7 (Map 4)",
            "Windurst Woods: talk to Apururu",
        }},
        ['9-1'] = { name="Doll of the Dead", steps={
            "Talk to any Gate Guard",
            "Windurst Woods: talk to Apururu",
            "Heaven's Tower: CS",
            "Heaven's Tower: enter Door: Vestal Chamber",
            "Windurst Woods: talk to Apururu",
            "The Boyahda Tree Map 1 (F-4): trade Goobbue Humus to Mandragora Warden",
            "Windurst Woods: talk to Apururu",
            "Zone into Full Moon Fountain for CS",
        }},
        ['9-2'] = { name="Moon Reading", steps={
            "Talk to any Gate Guard",
            "Heaven's Tower: enter Door: Vestal Chamber",
            "(The following 3 can be done in any order)",
            "Ro'Maeve (H-6): examine Qu'Hua Spring",
            "Chamber of Oracles",
            "Temple of Uggalepih Map 2 (E-8): requires Uggalepih Key",
            "Heaven's Tower: enter Door: Vestal Chamber",
            "Full Moon Fountain: fight",
            "Heaven's Tower: enter Door: Vestal Chamber (x2)",
        }},
    },

    ---------------------------------------------------------------------------
    -- Rise of the Zilart
    ---------------------------------------------------------------------------
    roz = {
        ['1']  = { name="The New Frontier", steps={
            "Norg: CS",
        }},
        ['2']  = { name="Welcome t'Norg", steps={
            "Norg (L-8): enter Oaken Door for CS",
        }},
        ['3']  = { name="Kazham's Chieftainness", steps={
            "Kazham (J-9): talk to Jakoh Wahcondalo",
        }},
        ['4']  = { name="The Temple of Uggalepih", steps={
            "Need Paintbrush of Souls + at least one Unlit Lantern in party, OR someone who can open the Den of Rancor door",
            "Den of Rancor: enter Sacrificial Chamber",
            "Fight 3 Tonberries",
        }},
        ['5']  = { name="Headstone Pilgrimage", steps={
            "Check Cermet Headstones in any order:",
            "Western Altepa (H-8): via Quicksand Caves",
            "La Theine Plateau (G-11): via Ordelle's Caves",
            "Cloister of Frost",
            "Yuhtunga Jungle (L-6/7): via Ifrit's Cauldron - fight",
            "Behemoth's Dominion (G-9): fight",
            "Cape Terrigan (H-5): fight",
            "Sanctuary of Zi'Tah (I-7): fight",
        }},
        ['6']  = { name="Through the Quicksand Caves", steps={
            "Get Loadstone first (Open Sesame quest) to enter solo",
            "Western Altepa (D-12): enter Quicksand Caves",
            "Quicksand Caves (I-9): Weighted Door",
            "Quicksand Caves (H-7): Weighted Door",
            "Drop into next room",
            "D-4: enter Chamber of Oracles - fight",
        }},
        ['7']  = { name="The Chamber of Oracles", steps={
            "Place the fragments in the 8 parts of the device",
        }},
        ['8']  = { name="Return to Delkfutt's Tower", steps={
            "Lower Delkfutt's Tower: CS",
            "Stellar Fulcrum: CS",
            "Qe'love Gate: fight",
        }},
        ['9']  = { name="Ro'Maeve", steps={
            "Norg: talk to Gilgamesh",
        }},
        ['10'] = { name="The Temple of Desolation", steps={
            "Hall of the Gods: check Cermet Grate (x2)",
        }},
        ['11'] = { name="The Hall of the Gods", steps={
            "Norg: talk to Gilgamesh",
        }},
        ['12'] = { name="The Mithra and the Crystal", steps={
            "Rabao (G-7): talk to Maryoh Comyujah",
            "Western Altepa (D-12): enter Quicksand Caves",
            "Quicksand Caves (K-8): Weighted Door",
            "Quicksand Caves (G-8): Weighted Door",
            "Drop down, examine ??? for a fight",
            "Examine ??? to receive Scrap of Papyrus",
            "Rabao: talk to Maryoh Comyujah",
            "Hall of the Gods: examine Cermet Gate (x2)",
            "Shimmering Circle",
        }},
        ['13'] = { name="The Gate of the Gods", steps={
            "Ru'Aun Gardens: CS",
        }},
        ['14'] = { name="Ark Angels", steps={
            "Shrine of Ru'Avitau (G-11)",
            "Fight all 5 Ark Angels in Ru'Aun Gardens - either individually or all at once via quest: Divine Might",
        }},
        ['15'] = { name="The Sealed Shrine", steps={
            "Norg: talk to Gilgamesh",
            "Shrine of Ru'Avitau",
        }},
        ['16'] = { name="The Celestial Nexus", steps={
            "May need someone to open the Yellow Door",
            "Ru'Aun Gardens (I-6): enter Shrine of Ru'Avitau",
            "Go south past J-7 through Yellow Door",
            "Go west to H-7",
            "Go south around square hallway to H-10",
            "Go north to Celestial Nexus at H-9: fight",
        }},
        ['17'] = { name="Awakening", steps={
            "Norg: talk to Gilgamesh",
            "Lower Jeuno: talk to Aldo",
        }},
    },

    ---------------------------------------------------------------------------
    -- Chains of Promathia
    ---------------------------------------------------------------------------
    cop = {
        ['1-1'] = { name="The Rites of Life", steps={
            "Travel to Lower Delkfutt's Tower in Qufim Island for opening cutscene (Chapter 1 begins)",
            "Zone into Upper Jeuno for another cutscene",
            "Speak with Monberaux at the Infirmary, Upper Jeuno (G-10, near Home Point #3) — receive Mysterious Amulet",
        }},
        ['1-2'] = { name="Below the Arks", steps={
            "Speak with Pherimociel at Ru'Lude Gardens (G-6) palace for cutscene",
            "Enter each of the three Promyvions via Hall of Transference: Dem (Konschtat), Mea (Tahrongi), Holla (La Theine)",
            "Click the Large Apparatus on first visit to each; progress through floors defeating Memory Receptacles",
            "(Optional) Trade Recollection drops + 2,000 gil to Harith at Ru'Lude Gardens (H-5) for Animas to weaken bosses",
        }},
        ['1-3'] = { name="The Mothercrystals", steps={
            "Enter Promyvion-Dem, Mea, and Holla via Shattered Telepoints at respective crags",
            "Navigate 4 floors in each, defeating Memory Receptacles to open Memory Stream portals upward",
            "Zone into Spire of Dem and defeat Progenerator for Light of Dem",
            "Zone into Spire of Holla and defeat Wreaker for Light of Holla",
            "Zone into Spire of Mea and defeat Delver for Light of Mea",
            "After third boss, mission completes — Tavnazian Archipelago access unlocked",
        }},
        ['2-1'] = { name="An Invitation West", steps={
            "Trigger cutscene at (K-9) in Lufaise Meadows upon arrival",
            "Travel west to Tavnazian Safehold entrance at (F-10) — avoid Orcs, Gigas, Bugards (lv45+ recommended)",
            "Zone into Tavnazian Safehold for final cutscene — mission complete",
        }},
        ['2-2'] = { name="The Lost City", steps={
            "Speak with Despachiaire through Walnut Door at (K-10) top floor of Tavnazian Safehold for cutscene",
            "(Optional) Speak with Justinius at (J-6) for additional dialogue",
            "Travel to bottom floor and examine Sewer Entrance at (I-7) — mission complete",
        }},
        ['2-3'] = { name="Distant Beliefs", steps={
            "Enter Phomiuna Aqueducts via sewer entrance in Tavnazian Safehold",
            "Use Sneak+Invisible; navigate to Minotaur at Map 2 (J-2) via ladder (F-6) Map 1, drop at (K-10)",
            "Defeat Minotaur boss (uses Mortal Ray -> Doom; avoid facing tanks directly toward it)",
            "Obtain Bronze Key from Fomors (or use Skeleton Key) to open Iron Gate at Map 2 (G-8)",
            "Click Wooden Ladder at (E-8) for cutscene with Nag'molada",
            "Locate ??? on southwest bookshelf to open wall-door; light oil lamps matching current Vana'diel day element to open west door",
            "Proceed to second Ornate Gate for cutscene",
            "Exit and speak with Justinius at (J-6) top floor of Tavnazian Safehold — mission complete",
        }},
        ['2-4'] = { name="An Eternal Melody", steps={
            "Check north Walnut Door at (K-7) top floor of Tavnazian Safehold — cutscene, receive Mysterious Amulet",
            "(Optional) Speak with Justinius at (J-6) for Ulmia's location",
            "Travel to Dilapidated Gate at (I-11) in Misareaux Coast (Snowmint Point) for cutscene",
            "Return to Tavnazian Safehold and approach bridge at (H/I-8) main floor for final cutscene — mission complete",
        }},
        ['2-5'] = { name="Ancient Vows", steps={
            "Check Dilapidated Gate at Misareaux Coast (F-7) for cutscene",
            "Check Spatial Displacement ahead — transport to Riverne - Site #A01",
            "Defeat Firedrakes for 2x Giant Scales (use Prism Powder; avoid True-Sight Hippogryphs)",
            "Trade 1 Giant Scale to Unstable Displacement at (G-10) to pass through (time-limited)",
            "Trade 2nd Giant Scale to Unstable Displacement at (E-10) to pass through",
            "Head north through displacement into Monarch Linn",
            "Enter battlefield 'Ancient Vows'; defeat 3 Mammett-19 Epsilon bosses (~3,800 HP each, form-changing)",
        }},
        ['3-1'] = { name="The Call of the Wyrmking", steps={
            "After Mammett fight, arrive at South Gustaberg near Lighthouse",
            "Travel to Port Bastok Airship Dock and approach Departures Entrance (F-7) for cutscene",
            "Speak with Cid on 2nd floor of Metalworks (H-8) for final cutscene — mission complete",
        }},
        ['3-2'] = { name="A Vessel Without a Captain", steps={
            "Click the door to Tenshodo HQ in Neptune's Spire, Lower Jeuno (F-7) for cutscene",
            "Travel to Ru'Lude Gardens (H-7) and approach Audience Chamber stairs for cutscene — mission complete",
        }},
        ['3-3'] = { name="The Road Forks", steps={
            "[San d'Oria] Speak with Arnau at Cathedral altar (M-6), then Chasalvige in Manuscript Room (L-6) for cutscene",
            "[San d'Oria] Travel to Carpenters' Landing via Jugner Forest (E-6); speak with Guilloud (H-10) to spawn NM Overgrown Ivy",
            "[San d'Oria] Defeat Overgrown Ivy (Malboro-type, uses Hundred Fists); speak with Guilloud, then Hinaree at S.San d'Oria Count's Manor (B-6) upstairs",
            "[Windurst] Speak with Ohbiru-Dohbiru at Rhinostery (J-9), then Yoran-Oran at Windurst Walls (E-5), then Kyume-Romeh at Tavern (F-10)",
            "[Windurst] Obtain Cracked Mimeo Mirror from Honoi-Gomoi at Windurst Waters (E-7) upstairs; return to Yoran-Oran",
            "[Windurst] In Attohwa Chasm, click Loose Sand at (K-8) to spawn NM Lioumere (lv55 Antlion); defeat for Mimeo Jewel",
            "[Windurst] Climb Parradamo Tor within 30 min to Cradle of Rebirth; collect 3 Mimeo Feathers",
            "[Windurst] Return to Yoran-Oran (E-5) -> Yujuju at Port Windurst (M-6) -> Tosuka-Porika at Optistery (G-8) -> Yoran-Oran again",
            "Speak with Cid at Metalworks (Home Point #1) — mission complete",
        }},
        ['3-4'] = { name="Tending Aged Wounds", steps={
            "Zone into Lower Jeuno for cutscene",
            "Enter Neptune's Spire and click door to Tenshodo HQ for cutscene — mission complete",
        }},
        ['3-5'] = { name="Darkness Named", steps={
            "Speak with Monberaux at Infirmary, Upper Jeuno (G-10)",
            "Speak with Ghebi Damomohe inside Neptune's Spire, Lower Jeuno",
            "Farm colored chips (Gray/Cyan/Carmine) from Pso'Xja monsters; trade to Ghebi for 500 gil + Pso'Xja Pass",
            "Enter Pso'Xja at Beaucedine Glacier (H-8); pass colored walls Red->Black->Red->Black at (H-7)/(I-7)",
            "Take elevator at (H-8) down; follow northwest path to Stone Gate leading to The Shrouded Maw",
            "Register Home Point inside; check Memento Circle and enter battlefield 'Darkness Named'",
            "Defeat Diabolos; return to Monberaux in Upper Jeuno — mission complete",
        }},
        ['4-1'] = { name="Sheltering Doubt", steps={
            "Zone into Tavnazian Safehold (Home Point #3) for opening cutscene (Chapter 4 begins)",
            "Speak with Despachiaire behind Walnut Door at (K-10) top floor",
            "Travel to Misareaux Coast and check Dilapidated Gate at (I-11) SW corner for cutscene — mission complete",
        }},
        ['4-2'] = { name="The Savage", steps={
            "Check Dilapidated Gate at Misareaux Coast (F-7) — cutscene, transport to Riverne - Site B01",
            "Farm 1 Giant Scale from wyverns in the area if not already held",
            "Travel SW through Riverne B01; trade Giant Scale to Unstable Displacement at (G-8) to pass",
            "Navigate NW then south through displacements into uncapped Monarch Linn",
            "Examine Spatial Displacement and enter battlefield 'The Savage'; buff inside",
            "Defeat Ouryu — use Mistmelts to ground her when she flies (highly recommended)",
            "Speak with Justinius at (J-6) in Tavnazian Safehold — mission complete",
        }},
        ['4-3'] = { name="The Secrets of Worship", steps={
            "Check Walnut Door at (K-7) in Tavnazian Safehold for cutscene",
            "Travel to Misareaux Coast (G-4) and check Iron Gate to enter Sacrarium",
            "On Map 2: obtain 2x Coral Crest Keys from Fomors + 1x Sealion Crest Key from NM Keremet (spawns 20:00-04:00)",
            "Trade both keys to double-keyhole door at Map 2 (H-7) to open it",
            "Check Wooden Gate at (G-8) for cutscene; return through keyhole door",
            "Locate Old Professor Mariselle via ??? on desks in six classrooms; defeat her and 2 Pupil adds",
            "All party members check ??? for Reliquiarium key",
            "Return to Wooden Gate at (G-8) for final cutscene — mission complete",
        }},
        ['4-4'] = { name="Slanderous Utterings", steps={
            "Approach Despachiaire through Walnut Door at (K-10) top floor of Tavnazian Safehold for cutscene",
            "Travel to bottom floor (Home Point #2) and zone into Sealion's Den",
            "Check Iron Gate in Sealion's Den for cutscene — mission complete",
        }},
        ['5-1'] = { name="The Enduring Tumult of War", steps={
            "(Optional) Speak with Despachiaire (K-10), Parelbriaux (K-7), and Odeya (J-10) in Tavnazian Safehold",
            "Zone into Port Bastok for cutscene; speak with Cid in Metalworks (H-8) for cutscene",
            "Travel to Nue Tower at Beaucedine Glacier (F-7) and enter uncapped Pso'Xja",
            "Check Stone Door at (H-8) — spawns NM Nunyunuwi (Golem, ~3,800 HP, high Regen); defeat it",
            "Check stone door again; take elevator down in next room",
            "Follow path to another Stone Door — cutscene, zone into Promyvion-Vahzl — mission complete",
        }},
        ['5-2'] = { name="Desires of Emptiness", steps={
            "Navigate Promyvion-Vahzl floors 1-2 via Memory Receptacles as normal",
            "Floor 3: defeat NM Propagator at Memory Flux (J-8); check Flux for cutscene; find Receptacle for floor 4",
            "Floor 4: defeat NM Solicitor at Memory Flux (M-6); check Flux; advance to floor 5",
            "Floor 5: defeat NM Ponderer at Memory Flux (D-6); check Flux for cutscene",
            "Zone into Spire of Vahzl at (F-8); rest and prepare",
            "Enter battlefield 'Desires of Emptiness'; defeat Procreator, Cumulator, and Agonizer",
            "Return to Metalworks and speak with Cid — receive Light of Vahzl, mission complete",
        }},
        ['5-3'] = { name="Three Paths", steps={
            "Speak with Cid in Bastok Metalworks to begin; complete all three paths in any order",
            "[Past Sins] Speak with Despachiaire (Tavnazia K-10), then Perih Vashai (Windurst Woods K-7); interact with ??? Warmachine on Purgonorgo Isle (H-11)",
            "[Past Sins] Zone into Oldton Movalpolos; register HP outside Mine Shaft #2716; enter BCNM 'A Century of Hardship' — defeat 5 Moblin bosses + Bugbby",
            "[Past Sins] Farm Gold Keys from Moblins in Newton Movalpolos; trade at Mine Shaft #2716 entrance; report to Cid",
            "[Pursuit of Paradise] Check ??? at La Theine Plateau (G-6) for Carbuncle cutscene; enter Pso'Xja tower at Beaucedine Glacier (J-8) and clear 16 Stone Doors (defeat Gargoyles)",
            "[Pursuit of Paradise] Check Avatar Gate at bottom for cutscene; speak with Monberaux (Upper Jeuno G-10) for Envelope; speak with Pherimociel (Ru'Lude Gardens G-6)",
            "[Pursuit of Paradise] Check ??? at Batallia Downs (K-8/9) for Delkfutt recognition device; defeat Disaster Idol at Lower Delkfutt Tower (H-5) cermet door",
            "[Pursuit of Paradise] Enter Pso'Xja tower (Beaucedine Glacier H-10) and reach second Avatar Gate for cutscene; report to Cid",
            "[Where Messengers Gather] Speak with Hinaree at S.San d'Oria (A-6) 2F; zone into Port San d'Oria for cutscene; speak with Chasalvige at N.San d'Oria Cathedral (L-6)",
            "[Where Messengers Gather] Speak with Kerutoto at Windurst Rhinostery (J-8); enter Boneyard Gully at Attohwa Chasm (H-6) for BCNM 'Head Wind' — defeat Shikaree X/Y/Z and their pets",
            "[Where Messengers Gather] Jump into hole at Uleguerand Range (J-9) to enter Bearclaw Pinnacle; enter BCNM 'Flames for the Dead' — defeat Snoll Tzar (use Shu'Meyo Salt to extend time)",
            "After all three paths complete, speak with Cid in Metalworks for final cutscene — mission complete",
        }},
        ['6-1'] = { name="For Whom the Verse is Sung", steps={
            "Speak with Pherimociel at Ru'Lude Gardens (G-6) for cutscene",
            "Travel to Marble Bridge at Upper Jeuno (F-7) and interact with door for cutscene",
            "Return to Ru'Lude Gardens for final cutscene — mission complete",
        }},
        ['6-2'] = { name="A Place to Return", steps={
            "Visit Palace in Ru'Lude Gardens (H-7) for cutscene; speak with Pherimociel at (G-6)",
            "Travel to Misareaux Coast (I-11) and examine Dilapidated Gate — spawns Warder Thalia, Warder Aglaia, Warder Euphrosyne",
            "Defeat all three Warder Detectors (Sleep to isolate is viable; all three must die)",
            "Check Dilapidated Gate again for cutscene — mission complete",
        }},
        ['6-3'] = { name="More Questions than Answers", steps={
            "Speak with Pherimociel at Ru'Lude Gardens (G-6) for cutscene",
            "Examine Audience Chamber upstairs for another cutscene",
            "Travel to Selbina (H-9) and speak with Mathilde in the Weaver's Guild office — mission complete",
        }},
        ['6-4'] = { name="One to be Feared", steps={
            "Visit Cid at Metalworks for cutscene",
            "Zone into Sealion's Den (bottom of stone ramps in Tavnazia) for cutscene",
            "Click Iron Gate in Sealion's Den for cutscene; board airship via cutscene",
            "Click airship door for cutscene; enter battlefield 'One to be Feared' (45-min limit, 3 stages)",
            "Stage 1: Defeat 5 Mammett-22 Zeta; return to deck and rebuff",
            "Stage 2: Defeat Omega; return to deck and rebuff",
            "Stage 3: Defeat Ultima — receive Ducal Guard's Ring, cutscene in Lufaise Meadows, mission complete",
        }},
        ['7-1'] = { name="Chains and Bonds", steps={
            "Zone into Tavnazian Safehold after Lufaise Meadows scene for cutscene",
            "Zone into Sealion's Den for cutscene",
            "Click Phomiuna Aqueducts entrance on bottom floor for cutscene with Louverance",
            "Check Walnut Door at (K-7) top floor of Tavnazian Safehold — cutscene with Ulmia, mission complete",
        }},
        ['7-2'] = { name="Flames in the Darkness", steps={
            "Visit north Dilapidated Gate at Misareaux Coast (F-7) for cutscene",
            "Return to Sealion's Den and speak with Sueleen",
            "Travel to Ru'Lude Gardens and approach Palace for cutscene",
            "Go to Upper Jeuno and check door of Marble Bridge Tavern for final cutscene — mission complete",
        }},
        ['7-3'] = { name="Fire in the Eyes of Men", steps={
            "Travel to Mine Shaft #2716 in Oldton Movalpolos and check Shaft Entrance for cutscene",
            "(Route: use Oldton Movalpolos Home Point; trade Snow Lily to Tarnotik K-10 for warp; or gamble with Twinkbrix at E-13)",
            "Speak with Cid in Metalworks",
            "Wait one Vana'diel day and speak with Cid again — mission complete",
        }},
        ['7-4'] = { name="Calm Before the Storm", steps={
            "Speak with Cid in Metalworks (H-8) for briefing",
            "Check Storage Compartment at Misareaux Coast (E-7) — spawns NM Boggelmann (Bugard); defeat; check again for Vessel of Light",
            "Click ??? at Carpenters' Landing (I-9) — spawns NM Cryptonberry Executor (NIN) + 3 Assassins; defeat all; check ??? for cutscene",
            "Click ??? inside cave at Bibiki Bay (F-6) — spawns NM Dalham (Kraken-type); defeat; check ??? for cutscene",
            "Return to Cid in Metalworks; obtain Letters from Ulmia and Prishe key item",
            "Speak with Sueleen in Sealion's Den (H-6) near Tavnazian Home Point #2 — mission complete",
        }},
        ['7-5'] = { name="The Warrior's Path", steps={
            "Click Iron Gate in Sealion's Den for cutscene",
            "Click Iron Gate again to enter BCNM 'The Warrior's Path' (cannot leave until victory or defeat)",
            "Pull boss away from elevated platform adds; use Stun/Bind/Shadowbind to interrupt WSs",
            "Defeat boss — cutscene, appear in Al'Taieu, mission complete",
        }},
        ['8-1'] = { name="Garden of Antiquity", steps={
            "Examine Crystalline Field at Al'Taieu (H-11) for cutscene",
            "Examine Rubious Crystal at (D-10) — defeat Ru'aern NM trio; examine again for cutscene",
            "Examine Rubious Crystal at (H-13) — defeat Ru'aern NM trio; examine again for cutscene",
            "Examine Rubious Crystal at (L-10) — defeat Ru'aern NM trio; examine again for cutscene",
            "Return to Crystalline Field (H-11); examine to enter Grand Palace of Hu'Xzoi",
            "Examine Gate of the Gods inside for cutscene + Tavnazian Ring reward",
            "Touch east Particle Gate at (H-8) for final cutscene — mission complete",
        }},
        ['8-2'] = { name="A Fate Decided", steps={
            "Examine east Particle Gate at (H-8) in Grand Palace of Hu'Xzoi for cutscene; examine again to enter",
            "Escort Quasilumin NPC from Map 1 upper level (J-8) within 5-min limit; use transporter at (L-7)",
            "Escort Quasilumin from Map 2 basement (L-8) within 30-min limit",
            "Escort Quasilumin from Map 2 (I-10) within 30-min limit; use transporter at (G-12)",
            "Escort Quasilumin from Map 1 (G-10) within 40-min limit; use transporter at (G-4)",
            "Examine Cermet Portal at Map 2 (H-8) and defeat Ix'ghrah (4 forms: ball, bird, spider, humanoid)",
            "Examine Cermet Portal after defeat for cutscene; return to Gate of the Gods to enter Garden of Ru'Hmet — mission complete",
        }},
        ['8-3'] = { name="When Angels Fall", steps={
            "Check Gate of the Gods (by Home Point in Garden of Ru'Hmet) for cutscene to access upper floors",
            "Ascend to 4th floor of your race's tower (Elvaan=E, Mithra=W, Tarutaru=SW, Humes=N, Galka=SE); check Ebon Panel twice for race key item",
            "Navigate to central 1F elevator (run East->North->West); avoid or defeat 4 True-Sight Qn'zdei guards",
            "Ascend to 2F; collect Brand of Twilight (south) and Brand of Dawn (north) via Warp Distortions",
            "Return via Home Point; use both brands to ascend elevator to 3F",
            "Check Particle Gate on 3F for cutscene; check again to enter Burning Circle battlefield",
            "Defeat 4 Ix'zdei NMs (2 large RDM-type pots, 2 small BLM-type pots)",
            "Check Luminous Convergence for cutscene; exit south via Particle Gate back to grand palace",
            "Zone south into Al'Taieu for mission-ending cutscene — mission complete",
        }},
        ['8-4'] = { name="Dawn", steps={
            "Zone into Garden of Ru'Hmet; use Home Point #1 and descend elevator to zone into Empyreal Paradox",
            "Check Transcendental Radiance for cutscene; check again to enter battlefield 'Dawn'",
            "Defeat Promathia (2-phase fight) with Prishe and Selh'teus as allies — protect Selh'teus from KO",
            "(Optional) Check Dilapidated Gate at Misareaux Coast (I-11) to unlock Ulmia Trust",
            "(Epilogue) Speak with Hinaree at S.San d'Oria (B-6); zone into Uleguerand Range; approach Count Caffaule's Manor (B-6)",
            "(Epilogue) Speak with Chipmy-Popmy at Port Windurst Fishing Guild (C-8); visit ??? Warmachine on Purgonorgo Isle (H-11) for colored drop reward",
            "(Epilogue) Zone into Mhaura for Shikarees cutscene; zone into Oldton Movalpolos for Jabbos cutscene",
            "(Epilogue) Speak with Cid in Metalworks (H-8); approach Palace in Ru'Lude Gardens; click Marble Bridge door in Upper Jeuno twice — select reward ring (Rajas/Sattva/Tamas)",
            "Check Walnut Door at Tavnazian Safehold (K-7) for final cutscene — mission complete",
            "(Optional) Check Walnut Door again post-epilogue to unlock Prishe Trust",
        }},
        ['8-5'] = { name="The Last Verse", steps={
            "Completion marker — appears in mission log automatically after finishing Apocalypse Nigh; no steps required",
        }},
    },

    ---------------------------------------------------------------------------
    -- Treasures of Aht Urhgan
    ---------------------------------------------------------------------------
    toau = {
        ['1']  = { name="Land of Sacred Serpents", steps={
            "Aht Urhgan Whitegate (I-10) top floor: talk to Naja Salaheem",
        }},
        ['2']  = { name="Immortal Sentries", steps={
            "Deliver supplies to a Staging Point",
            "Aht Urhgan Whitegate: talk to Naja Salaheem",
        }},
        ['3']  = { name="President Salaheem", steps={
            "Zone after previous mission",
            "Aht Urhgan Whitegate (K-10): talk to Rytaal",
            "Talk to Naja Salaheem (x2)",
        }},
        ['4']  = { name="Knight of Gold", steps={
            "Aht Urhgan Whitegate (G-11): talk to Cacaroon",
            "Trade him 1000 gil or an Imperial Bronze Piece",
            "Walahra Temple (K-8)",
            "Shararat Teahouse (K-12)",
        }},
        ['5']  = { name="Confessions of Royalty", steps={
            "Chateau d'Oraguille (I-9): talk to Halver",
        }},
        ['6']  = { name="Easterly Winds", steps={
            "Ru'Lude Gardens: approach the Palace (choose yes to receive 10 Imperial Bronze Pieces)",
        }},
        ['7']  = { name="Westerly Winds", steps={
            "Aht Urhgan Whitegate: Shararat Teahouse",
            "Talk to Naja Salaheem",
        }},
        ['8']  = { name="A Mercenary Life", steps={
            "Zone and return to Naja Salaheem",
        }},
        ['9']  = { name="Undersea Scouting", steps={
            "Alzadaal Undersea Ruins Map 8 (H-8)",
        }},
        ['10'] = { name="Astral Waves", steps={
            "Talk to Naja Salaheem",
        }},
        ['11'] = { name="Imperial Schemes", steps={
            "Wait one game day",
            "Talk to Naja Salaheem",
        }},
        ['12'] = { name="Royal Puppeteer", steps={
            "Get Jody's Acid from Ameretats in Bhaflau Thickets or Wajaom Woodlands",
            "Talk to Naja Salaheem",
            "Nashmau (H-7): talk to Pyopyoroon",
            "Trade Jody's Acid to Pyopyoroon",
        }},
        ['13'] = { name="Lost Kingdom", steps={
            "Take west exit from Nashmau",
            "Caedarva Mire (E-10): examine Jazaratt's Headstone",
            "Check again for a fight",
            "Check again",
        }},
        ['14'] = { name="The Dolphin Crest", steps={
            "Talk to Naja Salaheem",
        }},
        ['15'] = { name="The Black Coffin", steps={
            "Need Imperial Silver Piece",
            "Caedarva Mire: from Dvucca Isle Staging Point go west to F-9",
            "Arrapago Reef (H-8): examine Cutter for CS",
            "Cutter: fight",
            "Bring Ashu Talif Captain to 20% HP to win",
        }},
        ['16'] = { name="Ghosts of the Past", steps={
            "Talk to Naja Salaheem",
        }},
        ['17'] = { name="Guests of the Empire", steps={
            "Talk to Naja Salaheem",
            "Have 1 free inventory space and wear appropriate chest gear:",
            "  Adaman Cuirass, Aketon, Amir Korazin, Arhat's Gi, Barone Corazza, Black Cloak,",
            "  Black Cotehardie, Blessed Bliaut, Bloody Aketon, Blue Cotehardie, Brigandine, Byrnie,",
            "  Cardinal Vest, Chasuble, Dragon Harness, Dusk Jerkin, Errant Houppelande,",
            "  Hachiman Domaru, Haubergeon, Hauberk, Holy Breastplate, Homam Corazza,",
            "  Igqira Weskit, Jaridah Peti, Justaucorps, Nashira Manteel, Noble's Tunic,",
            "  Pahluwan Khazagand, Plastron, Rasetsu Samue, Scorpion Harness, Sha'ir Manteel,",
            "  Sipahi Jawshan, Vermillion Cloak, Yigit Gomlek",
            "Aht Urhgan Whitegate (L-8): check Imperial Gate Door",
        }},
        ['18'] = { name="Passing Glory", steps={
            "Talk to Naja Salaheem",
        }},
        ['19'] = { name="Sweets for the Soul", steps={
            "Shararat Teahouse",
        }},
        ['20'] = { name="Teahouse Tumult", steps={
            "Wajaom Woodlands (G-7): enter Aydeewa Subterrane",
            "Aydeewa Subterrane: CS",
            "F/G-9 west: go down ramp",
            "F/G-8: examine blank target",
        }},
        ['21'] = { name="Finders Keepers", steps={
            "Salaheem's Sentinels",
        }},
        ['22'] = { name="Shield of Diplomacy", steps={
            "Navukgo Execution Chamber: examine Decorative Bronze Gate",
            "Check again for fight - Khimaira 13",
            "Keep Karababa alive or the mission fails",
        }},
        ['23'] = { name="Social Graces", steps={
            "Salaheem's Sentinels",
        }},
        ['24'] = { name="Foiled Ambition", steps={
            "Zone and wait one game day",
            "Salaheem's Sentinels",
        }},
        ['25'] = { name="Playing the Part", steps={
            "Zone and wait one game day",
            "Talk to Naja Salaheem, choose Aphmau",
        }},
        ['26'] = { name="Seal of the Serpent", steps={
            "Unequip weapon",
            "Aht Urhgan Whitegate: check Imperial Gate Door",
        }},
        ['27'] = { name="Misplaced Nobility", steps={
            "Wajaom Woodlands (G-7): enter Aydeewa Subterrane",
            "Aydeewa Subterrane (E/F-9) west: go down ramp",
            "F/G-8: examine blank target",
        }},
        ['28'] = { name="Bastion of Knowledge", steps={
            "Aht Urhgan Whitegate: Walahra Temple",
        }},
        ['29'] = { name="Puppet in Peril", steps={
            "From Mamool Ja Staging Point: go north to Jade Sepulcher",
            "Jade Sepulcher: examine Ornamental Door",
            "Examine again for a fight",
        }},
        ['30'] = { name="Prevalence of Pirates", steps={
            "Arrapago Reef: CS",
            "Cutter: CS",
        }},
        ['31'] = { name="Shades of Vengeance", steps={
            "Periqia: fight 10 Lamia",
            "(If you fail, get another permit from Nahsib after one game day)",
        }},
        ['32'] = { name="In the Blood", steps={
            "Talk to Naja Salaheem",
        }},
        ['33'] = { name="Sentinels' Honor", steps={
            "Zone and wait one game day",
            "(While waiting, can get another Ephramadian Coin from Jazaratt's Headstone)",
        }},
        ['34'] = { name="Testing the Waters", steps={
            "Arrapago Reef: board Cutter for CS",
            "(CS lands you at the start of the next mission)",
        }},
        ['35'] = { name="Legacy of the Lost", steps={
            "Check Rock Slab for a fight with Gessho",
            "(Win when Gessho is at 15% HP)",
        }},
        ['36'] = { name="Gaze of the Saboteur", steps={
            "Caedarva Mire Map 1 (D-9): enter Hazhalm Testing Grounds",
            "Entry Gate: CS",
        }},
        ['37'] = { name="Path of Blood", steps={
            "Salaheem's Sentinels",
        }},
        ['38'] = { name="Stirrings of War", steps={
            "Wait until the end of the current game day and zone",
            "Shararat Teahouse",
        }},
        ['39'] = { name="Allied Rumblings", steps={
            "Ru'Lude Gardens: approach the Palace",
        }},
        ['40'] = { name="Unraveling Reason", steps={
            "Zone and wait one game day",
            "Talk to Pherimociel",
        }},
        ['41'] = { name="Light of Judgment", steps={
            "Aht Urhgan Whitegate (I-7): talk to Rodin-Comidin",
        }},
        ['42'] = { name="Path of Darkness", steps={
            "Nyzul Isle Staging Point (J-9): examine blank target",
            "(I-9): examine Runic Seal for a fight",
            "Keep Naja alive",
            "(If you fail, talk to Rodin-Comidin to try again)",
        }},
        ['43'] = { name="Fangs of the Lion", steps={
            "Talk to Naja Salaheem",
        }},
        ['44'] = { name="Nashmeira's Plea", steps={
            "Nyzul Isle Staging Point: examine blank target",
            "Examine Runic Seal for a fight",
            "(If you fail, get a new key item from Naja Salaheem)",
        }},
        ['45'] = { name="Ragnarok", steps={
            "Talk to Naja Salaheem",
        }},
        ['46'] = { name="Imperial Coronation", steps={
            "Equip appropriate chest armor (same list as mission 17)",
            "Hands, legs, and feet must not be empty (no match required)",
            "Main hand and off hand must be empty",
            "Aht Urhgan Whitegate: check Imperial Gate Door",
        }},
        ['47'] = { name="The Empress Crowned", steps={
            "May choose a ring as a reward",
            "Receive Imperial Standard",
        }},
        ['48'] = { name="Eternal Mercenary", steps={
            "Talk to Naja Salaheem",
        }},
    },

    ---------------------------------------------------------------------------
    -- Wings of the Goddess
    ---------------------------------------------------------------------------
    wotg = {
        ['1']  = { name="Cavernous Maws", steps={
            "Examine any one Cavernous Maw:",
            "Sauromugue Champaign (J-10)",
            "Batallia Downs (H-5)",
            "Rolanberry Fields (H-6)",
        }},
        ['2']  = { name="Back to the Beginning", steps={
            "Complete your nation's alliance quest — use /mission quest 1 for steps",
        }},
        ['3']  = { name="Cait Sith", steps={
            "Complete nation quests: Bastok (Light in the Darkness, Burden of Suspicion), San d'Oria (Boy and the Beast, Wrath of the Griffon), or Windurst (Knot Quite There, A Manifest Problem)",
            "Enter Southern San d'Oria [S] by walking from East Ronfaure [S] — cannot use Home Point or Survival Guide",
            "Cutscene triggers upon zoning in; mission complete",
        }},
        ['4']  = { name="The Queen of the Dance", steps={
            "Auto-triggered at end of Cait Sith",
            "Touch the door of Lion Springs Tavern (K-6) in Southern San d'Oria [S] for a cutscene",
            "If door is locked: zone in via East Ronfaure [S] or complete Nation Quests 3 and 4",
            "Travel to Upper Jeuno and speak with Turlough (G-7) to receive Mayakov show ticket (key item)",
            "Return to Lion Springs Tavern (K-6) in Southern San d'Oria [S] and touch door again for final cutscene",
        }},
        ['5']  = { name="While the Cat is Away", steps={
            "Auto-triggered at end of The Queen of the Dance",
            "Travel to East Ronfaure [S] from Southern San d'Oria [S] to trigger cutscene",
            "Cutscene only — mission completes at end of sequence",
        }},
        ['6']  = { name="A Timeswept Butterfly", steps={
            "Zone into La Vaule [S] for a cutscene — mission completes automatically",
            "Fastest route: Survival Guide to Jugner Forest [S], then zone at (G-11); or use Campaign Arbiter warp",
        }},
        ['7']  = { name="Purple, The New Black", steps={
            "Cutscene triggers upon entering La Vaule [S]",
            "Navigate to Reinforced Gateway at (F-9) in La Vaule [S] and examine for a cutscene",
            "Examine Reinforced Gateway again to enter BCNM battle vs. Galarhigg",
            "All buffs expire on entry — summon Trusts after zoning in",
            "Defeat Galarhigg; can inflict Petro Eyes (petrify) — mission completes on victory",
        }},
        ['8']  = { name="In the Name of the Father", steps={
            "Auto-triggered after completing Purple, The New Black BCNM",
            "Complete nation quests: Bastok (Storm on the Horizon + Fire in the Hole), San d'Oria (Perils of the Griffon + In a Haze of Glory), Windurst (When One Man Is Not Enough + A Feast for Gnats)",
            "Examine door of Lion Springs Tavern (K-6) in Southern San d'Oria [S] for cutscene",
        }},
        ['9']  = { name="Dancers in Distress", steps={
            "Speak to Raustigne in Southern San d'Oria [S] at (I-7/8) for a cutscene",
            "Examine Elegant Footprints in Jugner Forest [S] at (I-6) for a cutscene",
            "Retrieve one item based on cutscene choice: Gold Beastcoin, Lynx Meat, or Nyumomo Doll (farm in Batallia Downs)",
            "Zone out, then trade the retrieved item to the Elegant Footprints for final cutscene",
        }},
        ['10'] = { name="Daughter of a Knight", steps={
            "Speak to Amaura in Southern San d'Oria [S] HP #4 at (G-6); she requests a Cernunnos Bulb",
            "Kill Wandering Saplings in Jugner Forest [S] to obtain a Cernunnos Bulb if needed",
            "Trade the Cernunnos Bulb to Amaura for a cutscene",
            "Trade the Cernunnos Bulb to Humus-rich Earth in Jugner Forest [S] at (E-6) to plant it",
            "Travel to present-day Jugner Forest and examine the Humus-rich Earth at same location for cutscene",
            "Examine Humus-rich Earth again to spawn Treant NM Cernunnos (uses Protect IV, Shell IV, Stone IV, Stonega III)",
            "Defeat Cernunnos, then examine Humus-rich Earth to obtain Cernunnos resin (key item)",
            "Return to Amaura with key item for cutscene",
            "Wait one game day, zone, then speak to Amaura to receive Bottle of treant tonic and complete mission",
        }},
        ['11'] = { name="A Spoonful of Sugar", steps={
            "Head to Victory Gate at (I-7) in Southern San d'Oria [S] and speak with Raustigne for a cutscene",
        }},
        ['12'] = { name="Affairs of State", steps={
            "Travel to Bastok Markets [S] and speak to Radford near the Metalworks at (H-6)",
            "Travel to Windurst Waters [S] and speak to Velda-Galda in the northern section at (K-9) near the Windurst Walls zoneline",
            "After speaking with both, automatically receive Count Borel's letter (key item) — mission complete",
        }},
        ['13'] = { name="Borne by the Wind", steps={
            "Go to Sauromugue Champaign [S] and examine the Bulwark Gate at (E-6/F-6) for a cutscene",
            "Receive the Underpass hatch key (key item) — mission complete",
            "Route: Campaign Arbiter warp or Survival Guide warp to Rolanberry Fields, then head to gate",
            "Choose the first dialogue option to progress (second option is optional text only)",
        }},
        ['14'] = { name="A Nation on the Brink", steps={
            "Examine the Underpass Hatch in Batallia Downs [S] at (J-9/K-9) for a cutscene; hatch is on a rampart inside a tower",
            "Examine the Underpass Hatch again to enter Everbloom Hollow (instance battlefield, max 6 players; leader must hold the key)",
            "Defeat three beastmen waves: Quadavs (NW), Orcs (NE), Yagudo (S)",
            "Defeat One-eyed Gwajboj (Paladin boss, uses Invincible multiple times)",
            "Receive cutscene and Jeunoan Flag reward; if inventory full, retrieve from ??? on barrels north of entrance",
        }},
        ['15'] = { name="Crossroads of Time", steps={
            "Complete prerequisite national quest for your nation (Bastok, San d'Oria, or Windurst)",
            "Zone into Southern San d'Oria [S] from East Ronfaure [S] for a cutscene — no further action required",
        }},
        ['16'] = { name="Sandswept Memories", steps={
            "Interact with the door of Lion Springs Tavern at (K-6) in Southern San d'Oria [S] for a cutscene",
        }},
        ['17'] = { name="Northland Exposure", steps={
            "Zone into Beaucedine Glacier [S] for a cutscene — mission completes automatically",
            "Route: Walk NW through Batallia Downs [S] and enter tunnel at (E-4), or use Campaign Arbiter warp",
        }},
        ['18'] = { name="Traitor in the Midst", steps={
            "Plant shadow bugs on 5 Cait Siths in Beaucedine Glacier [S] via minigames at each tower",
            "Cait Sith Coig (J-8): Hit with blow dart while it moves in a random pattern",
            "Cait Sith Seachd (I-7): Direct Lilisette in Red Light/Green Light until she can plant the bug",
            "Cait Sith Ceithir (G-9): Direct Portia in Red Light/Green Light until she can plant the bug",
            "Cait Sith Aon (H-8): Play Red Light/Green Light in first-person view",
            "Cait Sith Tri (F-7): Transform into baby chocobo, sneak within 1 minute; chirp/wiggle to attract, then Stun",
            "Return to Regal Pawprints at (H-10) under broken tree branch near tower after all 5 bugs planted",
        }},
        ['19'] = { name="Betrayal at Beaucedine", steps={
            "Examine Regal Pawprints at (H-9) in Beaucedine Glacier [S] for a cutscene",
            "Examine Regal Pawprints a second time to spawn Count Halphas and 4 Dark Demons",
            "Defeat Count Halphas — Dark Demons vanish when he falls; can be slept, but Halphas is immune to sleep",
            "Examine Regal Pawprints again for final cutscene",
        }},
        ['20'] = { name="On Thin Ice", steps={
            "Speak to Raustigne at (I-7) in Southern San d'Oria [S] for a cutscene",
        }},
        ['21'] = { name="Proof of Valor", steps={
            "Collect signatures from NPCs in Southern San d'Oria [S]: Aissaville (I-7), Illeuse (H-9), Daigraffeaux (I-11), Andagge (H-9), Louxiard (G-7), Machionage (C-6), Remiotte (L-10), Elnonde (K-9), Loillie (K-9), Mailleronce (M-6)",
            "Answer questions from Farouel (K-7) about Smilodons/Tauri/Ghosts for up to 6 signatures",
            "Answer questions from Vichauxdat (I-8) about Gutrenders/Grradhod for up to 6 signatures",
            "Answer questions from Aurfet (G-9, upper level) about noble names/knight groups for up to 6 signatures",
            "Answer questions from Corseihaut (F-6) about war topics for up to 6 signatures",
            "Trade Orcish Axe (5 sigs), Orc Helm (10 sigs), or Gold Orcmask (15 sigs) to Coucheutand (I-8)",
            "Trade 1-4 stacks of Crossbow Bolts to Hauberliond (H-9) for up to 12 signatures",
            "Trade 3-8 stacks of Gysahl Greens to Sabiliont (I-11) for up to 12 signatures",
            "Obtain Gnole Claw, trade to Rongelouts N Distaud (I-9) for 35 sigs, then win 3 rounds of Rock-Paper-Scissors",
            "Once you have at least 20 signatures, speak to Raustigne (I-7) for cutscene confirmation",
        }},
        ['22'] = { name="A Sanguinary Prelude", steps={
            "Zone into Beaucedine Glacier [S] for a cutscene — mission completes automatically",
        }},
        ['23'] = { name="Dungeons and Dancers", steps={
            "Examine Regal Pawprints at (G-9, east side, high ground) in Beaucedine Glacier [S] for a cutscene",
            "Examine Regal Pawprints again to enter Everbloom Hollow battlefield (30-minute time limit)",
            "Each party member receives 2 Ratstail Explosives and jars of Firesand at start",
            "From NW start, hug right wall and blow up wall at (H/I-9); proceed north to (H-8) wall",
            "Kill Goblin Reaver to get 3 more Ratstail Explosives from the ??? it leaves",
            "Blow up SE wall at (I-9); proceed NE to dead-end at (J-7)",
            "Examine ??? at (J-7) for cutscene; place Firesand jar at dead-end",
            "Return to (H-8) opening, go to (H-7/I-7) and trigger the green switch",
            "Return to (J-7) and pass through where wall was to enter Map 2 (keep at least 2 explosives)",
            "On Map 2: blow up SE wall at (G-8/9), travel east, blow up wall at (I-9)",
            "Continue SE and examine blue warp ??? to exit and complete mission",
        }},
        ['24'] = { name="Distorter of Time", steps={
            "Head north from Beaucedine Glacier [S] Campaign Arbiter to (H-7)",
            "Find and enter the hole in the ground at bottom-right of the H-7 square (transports to Ruhotz Silvermines)",
            "Examine the Regal Pawprints to initiate the battle (30-minute time limit)",
            "Defeat Cait Sith Ceithir with Lilisette assisting — she must survive",
            "If you fail: obtain another Umbra bug (key item) from Regal Pawprint at H-10 (once per game day)",
        }},
        ['25'] = { name="The Will of the World", steps={
            "Speak to Raustigne at (I-7) in Southern San d'Oria [S] for a cutscene",
        }},
        ['26'] = { name="Fate in Haze", steps={
            "Complete a national storyline quest: Bastok (Beneath the Mask or What Price Loyalty), San d'Oria (Songbirds in a Snowstorm or Blood of Heroes), Windurst (Sins of the Mothers or Howl from the Heavens)",
            "Examine the door of Lion Springs Tavern at (K-6) in Southern San d'Oria [S] for a cutscene",
        }},
        ['27'] = { name="The Scent of Battle", steps={
            "Examine the door of Lion Springs Tavern at (K-6) in Southern San d'Oria [S] for a cutscene",
            "Examine the Bulwark Gate in Sauromugue Champaign [S] at (F-6) for a second cutscene",
        }},
        ['28'] = { name="Another World", steps={
            "Zone into Southern San d'Oria (present day) from East Ronfaure for a cutscene",
            "Travel to Chateau d'Oraguille at (I-9) and speak with Halver",
            "If Halver sends you to Rahal first, complete The Voracious Resurgence Mission 3-1 then return",
        }},
        ['29'] = { name="A Hawk in Repose", steps={
            "Buy a Lilac (120 gil) from Areebah at M&P's Market in Upper Jeuno HP #1 (E-6) — buy two for later",
            "Travel to Batallia Downs and examine the Weathered Gravestone at (I-10) on the hill for a cutscene",
            "Trade the Lilac to the Weathered Gravestone to complete the mission",
        }},
        ['30'] = { name="The Battle of Xarcabard", steps={
            "Zone into Xarcabard [S] for a cutscene",
            "Examine the Rally Point: Red at (F-8) near the sparkling blank target spot",
        }},
        ['31'] = { name="Prelude to a Storm", steps={
            "Examine Rally Point: Green at (G-9) in Xarcabard [S] for a cutscene; receive Magelight signal flare (key item)",
            "Examine Spell-worked Snow SE of Rally Point to enter the battlefield",
            "Speak to Pesoso inside to begin three waves of weak mobs",
            "Defeat Wave 1 — last mob flees and detonates",
            "Defeat Wave 2 — last mob flees and detonates",
            "Defeat Wave 3 — contains three Arch Demons plus weaker enemies; eliminate all",
            "Return to Pesoso in the third room to exit; reward type depends on completion time",
        }},
        ['32'] = { name="Storm's Crescendo", steps={
            "Examine Rally Point: Blue at (H-8) in Xarcabard [S] to receive Alchemical signal flare (key item; once per Vana'diel day)",
            "Examine Excavated Snow to enter the Storm's Crescendo battlefield",
            "Speak to Antje inside to begin the operation",
            "Reach all 24 Republic Operatives while maintaining Flee status and let each detonate their charge",
            "Refresh Flee by speaking to each operative; or use Powder Boots/Flee job ability if it expires",
            "Avoid fighting Tiger mobs — they do not strip Flee",
            "Follow a counter-clockwise circuit; watch for smoke flashes to locate next operative",
            "After all 24 charges detonate, report to Captain Antje to complete the mission",
            "Check Rally Point: Red at (F-8) for a final cutscene",
        }},
        ['33'] = { name="Into the Beast's Maw", steps={
            "Examine Rally Point: Red at (F-8) in Xarcabard [S] for a cutscene",
            "Enter Castle Zvahl Baileys [S] for a cutscene; pick up the Survival Guide inside",
            "Examine Peculiar Glint at (G-7) for a cutscene; receive Distress signal flare (key item)",
            "Examine Peculiar Glint again to enter the battlefield vs. Count Bifrons and 4 Orcs",
            "Defeat Count Bifrons (sleep the Orcs first if desired) to complete mission",
        }},
        ['34'] = { name="The Hunter Ensnared", steps={
            "Examine the Rally Point: Red at (F-8) in Xarcabard [S] — cutscene only, no battle required",
        }},
        ['35'] = { name="Flight of the Lion", steps={
            "Examine the Bulwark Gate in Sauromugue Champaign [S] at (F-6) for a cutscene with Operation Snowstorm survivors",
        }},
        ['36'] = { name="Fall of the Hawk", steps={
            "Enter Castle Zvahl Baileys [S] for a cutscene (use the Survival Guide warp for fastest access)",
        }},
        ['37'] = { name="Darkness Descends", steps={
            "Progress through Castle Zvahl Baileys [S] and Castle Zvahl Keep [S], then zone into Throne Room [S] for a cutscene",
            "Click the Throne Room door to initiate the BCNM 'Darkness Descends'",
            "Fight Aquila and Haudrale — Lilisette joins automatically after ~3 minutes",
            "Defeat both enemies; mission fails if Lilisette falls in combat",
        }},
        ['38'] = { name="Adieu, Lilisette", steps={
            "Complete national quest pairs: Bastok (The Truth Lies Hid + Bonds of Mythril), San d'Oria (Chasing Shadows + Face of the Future), Windurst (Manifest Destiny + At Journey's End)",
            "Examine the door of Lion Springs Tavern at (K-6) in Southern San d'Oria [S] for a cutscene",
        }},
        ['39'] = { name="By the Fading Light", steps={
            "Examine Rally Point: Red at (F-8) in Xarcabard [S] for a cutscene",
        }},
        ['40'] = { name="Edge of Existence", steps={
            "Examine a Cavernous Maw in Sauromugue Champaign (J-10) for a cutscene",
            "Examine a Cavernous Maw in Batallia Downs (H-5) for a cutscene",
            "Examine a Cavernous Maw in Rolanberry Fields (H-6) for a cutscene",
        }},
        ['41'] = { name="Her Memories", steps={
            "Complete sub-quest chain 'Her Memories: Homecoming Queen' (Old Bean, The Faux Pas, Grave Resolve) for 1st Large memory fragment",
            "Complete 'Her Memories: Of Malign Maladies' for 2nd Large memory fragment (requires waiting one in-game day)",
            "Complete 'Her Memories: Operation Cupid' for 3rd Large memory fragment",
            "Complete nation quest: Carnelian Footfalls (San d'Oria), Azure Footfalls (Bastok), or Verdure Footfalls (Windurst) for 4th fragment",
            "Return to Cait Sith with all four Large memory fragments to complete the mission",
        }},
        ['42'] = { name="Forget Me Not", steps={
            "Examine a Cavernous Maw in Sauromugue Champaign (J-10) for a cutscene",
            "Examine a Cavernous Maw in Batallia Downs (H-5) for a cutscene",
            "Examine a Cavernous Maw in Rolanberry Fields (H-6) for a cutscene",
        }},
        ['43'] = { name="Pillar of Hope", steps={
            "Unequip all weapons before proceeding",
            "Travel to Grauberg [S] at (F-5) — Witchfire Glen — via Survival Guide or Campaign warp, then run northwest",
            "Examine the Veridical Conflux at (F-5) for a cutscene",
        }},
        ['44'] = { name="Glimmer of Life", steps={
            "Auto-triggered after the Pillar of Hope cutscene",
            "Wait one in-game day, then zone and return to the Veridical Conflux in Grauberg [S] at (F-5) for a cutscene",
            "While waiting, optionally farm Punch Bug for the next mission (Lou Carcolhs/Quadavs in Pashhow Marshlands [S] or Beadeaux [S])",
        }},
        ['45'] = { name="Time Slips Away", steps={
            "Obtain a Punch Bug by defeating Lou Carcolhs, Ancient Quadavs, Gold Quadavs, or Vajra Quadavs in Pashhow Marshlands [S] or Beadeaux [S]",
            "Travel to Grauberg [S] and examine the Veridical Conflux at (F-5)",
            "Trade the Punch Bug to the Veridical Conflux for a cutscene; receive Bottled punch bug (key item)",
        }},
        ['46'] = { name="When Wills Collide", steps={
            "Examine the Veridical Conflux in Grauberg [S] at (F-5) to enter Walk of Echoes",
            "Examine the Ornate Door north of the conflux for a cutscene, then examine again to enter the battlefield",
            "Defeat four Spitewardens: Monk (Hundred Fists), Paladin (Invincible + Banish), Dancer (Trance + heals), and weaponless mimic (Essence Jack)",
            "Use Gravity to kite; prioritize the Dancer — it can dispel Gravity",
            "If you fail, obtain another Punch Bug from the usual sources to retry",
        }},
        ['47'] = { name="Whispers of Dawn", steps={
            "Unequip all weapons, then examine the Veridical Conflux in Grauberg [S] at (F-5) for a cutscene",
            "Wait one game day, zone out, then return to the same Conflux for the next cutscene",
        }},
        ['48'] = { name="A Dreamy Interlude", steps={
            "Examine the Veridical Conflux in Grauberg [S] at (F-5) for a cutscene",
            "Wait until the next game day, then change zones and return for the follow-up cutscene",
        }},
        ['49'] = { name="Cait in the Woods", steps={
            "Examine the Blank Target at (H-7) in the northwest corner of East Ronfaure [S] for a cutscene",
            "Receive Ronfaure dawndrop (key item) upon completion",
        }},
        ['50'] = { name="Fork in the Road", steps={
            "Ronfaure dawndrop is obtained automatically at mission start",
            "Examine Blank Target in Jugner Forest [S] at (I-6) for Jugner dawndrop",
            "Examine Blank Target in La Vaule [S] at (K-9) for La Vaule dawndrop",
            "Examine Blank Target in Southern San d'Oria [S] at (K-6) near Lion Springs Tavern for San d'Oria dawndrop",
            "Examine Blank Target in Beaucedine Glacier [S] at (H-9) for Beaucedine dawndrop",
            "Examine Blank Target in Xarcabard [S] at (F-8) near Rally Point: Red for Xarcabard dawndrop",
            "Examine Blank Target in Throne Room [S] (Castle Zvahl Keep [S] HP #1) for Throne Room dawndrop",
            "Examine Blank Target in Walk of Echoes south of the conflux for Walk of Echoes dawndrop",
            "All 8 dawndrops auto-combine into the Primal glow (key item) — mission complete",
        }},
        ['51'] = { name="Maiden of the Dusk", steps={
            "Examine the Veridical Conflux in Grauberg [S] at (F-5) to enter Walk of Echoes (if Walk of Echoes was your last dawndrop, exit first then re-examine)",
            "Examine the Ornate Door north of the conflux in Walk of Echoes for a cutscene, then examine again to enter Maiden of the Dusk battlechamber",
            "Defeat Lilith (Form 1): AoE melee with knockback, enfeebling spells, Fatal Attraction charm during Trance",
            "Cutscene plays after Form 1 — return to entry point to rest and rebuff",
            "Defeat Lilith Ascendant (Form 2): summons Elemental Gyves with status effects, conal dark weaponskills",
            "Avoid Dark Sun two-hour ability (announces before casting; ~15 yalm AoE death effect)",
            "Watch 10-minute cutscene to complete the mission",
            "After completion: purchase Maiden phantom gem (10 Merit Points) to access High-Tier Mission Battlefields version",
        }},
        ['52'] = { name="Where It All Began", steps={
            "Examine the door of Lion Springs Tavern at (K-6) in Southern San d'Oria [S] for a cutscene",
            "Receive Wedding invitation (key item)",
        }},
        ['53'] = { name="A Token of Troth", steps={
            "Unequip your weapon, then examine the Bulwark Gate in Sauromugue Champaign [S] at (E-6) for a cutscene",
            "Examine the Bulwark Gate again for a second cutscene — mission complete",
        }},
        ['54'] = { name="Lest We Forget", steps={
            "Examine the Veridical Conflux in Grauberg [S] at (F-5) for a cutscene and receive your reward",
        }},
    },
}

------------------------------------------------------------------------
-- WotG nation quest chains
------------------------------------------------------------------------

local QUESTS = {
    ---------------------------------------------------------------------------
    sandy = {
        [1] = { name="Steamed Rams", steps={
            "Talk to Mainchelite in Southern San d'Oria (S) at I-9, turn in Red recommendation letter",
            "East Ronfaure (S): collect Charred propeller (H-8 dirt hole), Oxidized plate (I-8 near waterfall), Piece of shattered lumber (J-7 bush by tree)",
            "Return to Mainchelite",
        }},
        [2] = { name="Gifts of the Griffon", steps={
            "Talk to Louxiard in Southern San d'Oria (S) at G-7 for a cutscene",
            "Leave the area and return to Louxiard for another cutscene",
            "Talk to Rholont at E-7",
            "Trade Plumes d'Or to 7 NPCs: Machionage (C-6), Louxiard (G-7), Illeuse (H-9), Rongelouts N Distaud (I-9), Sabiliont (I-11), Elnonde (K-9), Loillie (K-9 via stairs at L-8)",
            "Return to Rholont",
        }},
        [3] = { name="Claws of the Griffon", steps={
            "Wait one game day after Gifts of the Griffon",
            "Talk to Rholont in Southern San d'Oria (S) at E-7 for a cutscene",
            "Leave and return, speak with Rholont again",
            "Travel to Jugner Forest (S) via East Ronfaure (S) — cutscene on entry",
            "Go to I-6, examine ??? on tree stump for a cutscene",
            "Defeat Fingerfilcher Dradzad (Orc Warrior — immune to sleep)",
            "Examine ??? again for final cutscene",
        }},
        [4] = { name="Boy and the Beast", steps={
            "Speak to Raustigne (I-7) in Southern San d'Oria (S) for a cutscene",
            "Talk to Rholont (E-7) in Southern San d'Oria (S)",
            "Go to Vunkerl Inlet (S) (H-6) and examine ??? near the bridge; receive Vunkerl herb memo",
            "Color key by in-game time: Red/Sandy 00:00-07:59, Blue/Bastok 08:00-15:59, Green/Windurst 16:00-23:59",
            "Travel to Vunkerl Inlet (S) (F-5), find Leafy Patch, select correct color for current time",
            "Obtain the Vunkerl herb from the Leafy Patch",
            "Return to Vunkerl Inlet (S) (H-6) and examine ??? near the bridge to complete",
        }},
        [5] = { name="Wrath of the Griffon", steps={
            "Talk to Rholont (E-7) in Southern San d'Oria (S)",
            "Travel to Jugner Forest (S) and find ??? at (H-10) near a watch platform; watch cutscene",
            "Touch ??? again to battle Cobraclaw Buchzvotch; defeat him",
            "Click ??? once more for final cutscene",
            "Return to Rholont in Southern San d'Oria (S) to complete; receive Military Scrip",
        }},
        [6] = { name="Perils of the Griffon", steps={
            "Wait one game day after Wrath of the Griffon, then zone and speak to Rholont (E-7) in Southern San d'Oria (S)",
            "Zone out and speak to Rholont again for another cutscene",
            "Speak with Daigraffeaux at (I-11) in Southern San d'Oria (S)",
            "Return to Rholont for an additional cutscene (no zoning required)",
            "Head to Jugner Forest (S) at (I-6) and examine ??? tree stump; obtain Orcish warmachine body key item",
            "Return to Rholont in Southern San d'Oria (S) to complete",
        }},
        [7] = { name="In a Haze of Glory", steps={
            "Speak with Diordinne at (I-6) in Garlaige Citadel (S) Map 1; receive Number eight shelter key",
            "Travel east to Map 2 and examine Wooden Crates at (H-9); have party leader examine to enter battlefield in Ghoyu's Reverie",
            "Locate and defeat Orcish Turret at approximately (H-10) on Map 15 within 30 minutes",
            "Manage Goblin Effluvial Grenade attacks and poison effects during fight",
            "Return to Southern San d'Oria (S) during nighttime hours (18:00-0:00)",
            "Speak with Rholont at (E-7) in Southern San d'Oria (S) to complete; receive Fullmetal Bullet",
        }},
        [8] = { name="Songbirds in a Snowstorm", steps={
            "Talk to Rholont at (E-7) in Southern San d'Oria (S)",
            "Speak with Daigraffeaux at (I-11) in Southern San d'Oria (S)",
            "Enter Beaucedine Glacier (S) for a cutscene; examine Colossal Footprint at (I-7) behind the tower",
            "Examine Rocky Perch at lake (G-10) at least 3 times to obtain Goliath Worm items",
            "Fish for Paladin lobster at pond (G-10), Scutum crab at pond (J-7), Lance fish at pond (H-9)",
            "Return to Colossal Footprint (I-7) and submit key items via cutscene",
            "Trade a Flint Stone to Charred Firewood two levels above and north of I-7 tower",
            "Examine Compressed Snow at (H-10) near the tower; examine again to spawn Orcish Bloodletter NM",
            "Defeat Orcish Bloodletter; examine Compressed Snow a third time to complete",
        }, alt={ name="Blood of Heroes", steps={
            "Examine Animal Spoor at (J-9) in Xarcabard (S); grab Home Point at (H-9)",
            "Examine Wheel Rut at (I-9) in the dead-end tunnel to the south",
            "Examine Animal Spoor at (J-9) again to obtain Vial of military prism powder key item",
            "Examine Forbidding Portal at (I-7) in Xarcabard (S) for cutscene; examine again to enter battlefield",
            "Defeat 2 Bloodwing Deathrainers (BLM), 4 Bloodwing Maimers (WAR), Gherrmoga (Bugard), Kingslayer Doggvdegg (PLD); Excenmille assists; killing Doggvdegg ends battle",
            "Examine Wheel Rut at (I-9) for cutscene; receive Ram Staff",
        }}},
        [9] = { name="Chasing Shadows", steps={
            "Talk to Rongelouts N Distaud in Southern San d'Oria (S) at (I-9)",
            "Zone into Xarcabard (S) from Beaucedine Glacier (S) for opening cutscene",
            "Examine Backfilled Pit in Xarcabard (S) at (F-8)",
            "Examine Compact Footprint at (H-8) in Xarcabard (S)",
            "Examine Sunken Footprint at (H-6)/(H-7) up the northwest ramp",
            "Re-examine Compact Footprint at (H-8)",
            "Zone into Batallia Downs (S) from Beaucedine Glacier (S) for cutscene",
            "Examine Fresh Snowmelt at (H-5) in Batallia Downs (S) for a cutscene",
            "Re-examine Fresh Snowmelt to spawn NM Menechme; defeat it with Excenmille within 30 minutes",
            "Examine Fresh Snowmelt a final time for reward",
        }},
        [10] = { name="Face of the Future", steps={
            "Zone into Jugner Forest from Batallia Downs (present) for a cutscene",
            "Examine Metallic Hodgepodge in Jugner Forest at (F-9) for a cutscene",
            "Zone into Ghelsba Outpost to receive Orcish infiltration kit key item",
            "Travel to Yughott Grotto Map 1 and examine Scrape Mark at (G-9) for a cutscene",
            "Examine Scrape Mark again to enter the Face of the Future battlefield",
            "Defeat Fangmonger Colossus (killing Tombstones weakens its damage resistance); NPC allies assist",
            "Examine Cavernous Maw in Batallia Downs at (H-5) for cutscene; receive Griffon Ring",
            "(Optional) Speak to Rholont in Southern San d'Oria (S) with Bundle of half-inscribed scrolls for Trust: Excenmille (S)",
        }},
    },
    ---------------------------------------------------------------------------
    bastok = {
        [1] = { name="The Fighting Fourth", steps={
            "Talk to Adelbrecht in Bastok Markets (S) at E-9, turn in Blue recommendation letter to get Battle rations",
            "North Gustaberg (S): ascend Zegham Hill around I-8, talk to Gebhardt at I-6 for a cutscene",
            "Head to E-11, speak with Roderich",
            "Go to E-7, interact with the Barricade for a cutscene",
            "Return to Adelbrecht",
        }},
        [2] = { name="Better Part of Valor", steps={
            "Exit Bastok Markets (S) into North Gustaberg (S) at G-4 for a cutscene — receive Clump of animal hair",
            "Deliver it to Engelhart at the Music Shop in Bastok Markets (S) at K-10",
            "Go to the waterfall in North Gustaberg (S) at F-8, examine ??? on the right side",
            "Obtain a Gnole Claw from the Auction House (Materials > Bonecraft)",
            "Vunkerl Inlet (S): trade Gnole Claw to goblin Leadavox at J-6 for Xhifhut key item",
            "Return to Engelhart in Bastok Markets (S)",
        }},
        [3] = { name="Fires of Discontent", steps={
            "Talk to Engelhart in Bastok Markets (S) at K-10",
            "Speak with Pagdako in Bastok Markets (S) at H-9",
            "Go to present-day Metalworks, speak with Iron Eater in the President's Office at J-8 (possibly multiple times)",
            "Return to the past and speak with Engelhart again",
            "Grauberg (S): find ??? inside the cave at I-6 for a cutscene",
            "Return to Bastok Markets (S) and speak with Engelhart",
            "Head to the Metalworks gate area and speak with Gentle Tiger",
            "Return to Engelhart to complete",
        }},
        [4] = { name="Light in the Darkness", steps={
            "Speak to Gentle Tiger in Bastok Markets (S) at (H-6) for opening cutscene",
            "Speak to Pagdako at (H-9)",
            "Trade Blatherix at (F-8) either 30 Gob. Chocolate or 5,000 gil for Mine shaft key",
            "Zone into Pashhow Marshlands (S) from Grauberg (S) for brief cutscene",
            "Examine Corroded Door at Pashhow Marshlands (S) (F-5) to enter battlefield",
            "Defeat 1 Sapphire Quadav and 10 Sapphirine Quadav (recommend defeating 6 Sapphirine before the boss)",
            "Speak to Gentle Tiger for cutscene; answer three questions correctly (ventilation shafts, lanterns, distraction)",
            "Receive Adaman Ingot reward",
        }},
        [5] = { name="Burden of Suspicion", steps={
            "Speak to Gentle Tiger in Bastok Markets (S) at (H-6) for cutscene",
            "Talk to Engelhart in Bastok Markets (S) at (K-10)",
            "Travel to Batallia Downs (S) and enter The Eldieme Necropolis (S) via (J-10) entrance",
            "Navigate to southern chamber at (G-9), fall through center hole, go left at fork, ascend stairs, enter northern room at (I-7)",
            "Defeat or evade four Orcs; examine Sarcophagus on east side for cutscene",
            "Return to Gentle Tiger in Bastok Markets (S) for cutscene",
            "Talk to Blatherix at (F-8); receive Elixir reward",
        }},
        [6] = { name="Storm on the Horizon", steps={
            "Zone into Bastok Markets (S) from North Gustaberg (S) for opening cutscene",
            "Speak with Gentle Tiger at Bastok Markets (S) (H-6)",
            "Examine Monument on Zegham Hill in North Gustaberg (S) at (J-7); enter at I-8, navigate counterclockwise on second level, then clockwise to final ramp",
            "Examine ??? in cave at Grauberg (S) (I-6) (cave entrance at SE H-5) to complete; receive reward",
        }},
        [7] = { name="Fire in the Hole", steps={
            "Zone into Bastok Markets (S) from North Gustaberg (S) for cutscene; receive Silvermine key",
            "Go to North Gustaberg (S) at (E-9) and examine Stonehoused Adit for a cutscene",
            "Examine Stonehoused Adit again to initiate combat",
            "Protect NPC Adelheid through maze while defeating waves of Quadavs",
            "Defeat all Quadavs; battlefield ends once Adelheid reaches the turret",
            "Re-enter Bastok Markets (S) from North Gustaberg (S) for another cutscene",
            "Speak to Gentle Tiger in Bastok Markets (S) at (H-6) for cutscene, then speak again for final cutscene",
            "Receive Republican Silver Medal reward",
        }},
        [8] = { name="Beneath the Mask", steps={
            "Speak to Gentle Tiger in Bastok Markets (S) at (H-6)",
            "Enter Beadeaux (S) for a cutscene",
            "Return to Gentle Tiger in Bastok Markets (S)",
            "Speak to Red Axe in The Eldieme Necropolis (S) at (I-8)",
            "Go to Leadavox in Vunkerl Inlet (S) at (J-6); trade Beeswax and Red Textile Dye for Wax seal",
            "Return to Red Axe in The Eldieme Necropolis (S)",
            "Speak to Gentle Tiger in Bastok Markets (S)",
            "Go to Beaucedine Glacier (S) and examine Hoarfang at (F-10) for cutscene; receive Super Reraiser",
        }, alt={ name="What Price Loyalty", steps={
            "Speak to Gentle Tiger in Bastok Markets (S) at (H-6); receive Sack of victuals key item",
            "Travel to Benedikt Watchtower in North Gustaberg (S) at (E-11) and speak with Roderich",
            "Return to Gentle Tiger in Bastok Markets (S)",
            "Go to Xarcabard (S) for cutscene; obtain Commander's endorsement key item",
            "Examine Forbidding Portal at (I-7) in Xarcabard (S) for cutscene; examine again to enter battle",
            "Defeat humanoid opponent (sword skills, double attacks, Mighty Strikes at 50% HP; Temblor Blade AoE with petrify at 50%)",
            "Return to Gentle Tiger for final cutscene; receive Fourth Staff",
        }}},
        [9] = { name="The Truth Lies Hid", steps={
            "Obtain an Elixir from the Curio Moogle or Auction House",
            "Speak to Gentle Tiger in Bastok Markets (S) at (H-6)",
            "Enter Castle Zvahl Baileys (S) for a cutscene",
            "In Castle Zvahl Keep (S), locate three Imp NPCs: Rikke (G-7 NW), Rakke (G-10 SW), Rokke (H-10 SE)",
            "Speak to all three imps; deduce which is honest based on their claims about each other",
            "Trade Elixir to the correct imp for cutscene; if wrong, wait one game day and try again",
            "Examine ??? in southwest room (G-9) on Map 3 for a cutscene",
            "Drop down, use center teleporter, examine Displaced Block for cutscene; receive Sanctus Rosary",
        }},
        [10] = { name="Bonds of Mythril", steps={
            "Zone into Castle Zvahl Baileys (S) from Castle Zvahl Keep (S) for a cutscene",
            "Examine ??? in southwest room (G-9) on Map 3 of Castle Zvahl Keep (S) for a cutscene",
            "Kill all four imps in the central room on Map 3",
            "Examine ??? again to spawn Gargouille Warden; defeat it; examine ??? to obtain Zvahl passkey",
            "Enter Throne Room (S) and examine the Throne Room door for a cutscene",
            "Examine Throne Room door again to enter battle; defeat humanoid opponent (Zeid assists)",
            "Defeat Marquis Amon, a demon Black Mage wielding a scythe",
            "Visit Gentle Tiger in Bastok Markets (S) at (H-6) for cutscene; receive Excelsis Ring",
            "(Optional) Speak to Gentle Tiger with Bundle of half-inscribed scrolls for Trust: Klara",
        }},
    },
    ---------------------------------------------------------------------------
    windurst = {
        [1] = { name="Snake on the Plains", steps={
            "Talk to Miah Riyuh in Windurst Waters (S) at H-9, exchange Green recommendation letter for putty",
            "West Sarutabaruta (S): apply putty to sealed entrances at F-4, F-11, and J-8",
            "Return to Miah Riyuh",
        }},
        [2] = { name="The Tigress Stirs", steps={
            "Visit Windurst Waters (S) for a cutscene — receive Inky black Yagudo feather",
            "Talk to Dhea Prandoleh in Windurst Waters (S) at H-10",
            "West Sarutabaruta (S): check ??? at Starfall Hillock at I-6 for Small starfruit key item",
            "Check the door to Acolyte Hostel in Windurst Waters (S) at K-5",
        }},
        [3] = { name="The Tigress Strikes", steps={
            "Speak with Dhea Prandoleh in Windurst Waters (S) at H-10",
            "Fort Karugo-Narugo (S): find Rotih Moalghett on the second floor for a cutscene",
            "Exit the fortress, examine ??? at I-9 for a cutscene — then fight War Lynx (~7,000 HP, resists Thunder)",
            "Examine ??? again after the fight for a cutscene",
            "Return to Dhea Prandoleh for final cutscene and reward (Star Globe)",
        }},
        [4] = { name="Knot Quite There", steps={
            "Obtain a 108-Knot Quipu by defeating Yagudo in Sauromugue Champaign (S) near fortification at (K-9)",
            "Talk to Dhea Prandoleh at (H-10) in Windurst Waters (S)",
            "Click Door: Acolyte Hostel at (K-5) in Windurst Waters (S) for cutscene",
            "Go to Sauromugue Champaign (S) at (F-6) and click Bulwark Gate for cutscene with Rachemace",
            "Trade 108-Knot Quipu to Bulwark Gate at (F-6)",
            "Click Bulwark Gate multiple times until 'the door is firmly sealed' message appears at least 3 times",
            "Zone into Southern San d'Oria (S) from East Ronfaure (S) on foot for cutscene with Pattna-Ottna",
            "Go through Portcullis gate and click Door: House on right at (M-8) in Southern San d'Oria (S) for final cutscene and reward",
        }},
        [5] = { name="A Manifest Problem", steps={
            "Speak with Rotih Moalghett at (I-8) in Fort Karugo-Narugo (S) Map 2",
            "Travel to Castle Oztroja (S) and zone in for cutscene",
            "Return to Rotih Moalghett for another cutscene; receive Fort Key",
            "Examine Colorful Door at (H-5) in Fort Karugo-Narugo (S) Map 2 to begin BCNM against waves of Yagudo soldiers",
            "Defeat all Yagudo enemies; final mob is Laa Yaku the Austere",
            "Zone into West Sarutabaruta (S), then Windurst Waters (S) for final cutscene and reward",
        }},
        [6] = { name="When One Man Is Not Enough", steps={
            "Speak to Dhea Prandoleh at (H-10) in Windurst Waters (S)",
            "Travel to West Sarutabaruta (S) and examine Sealed Entrance at (F-11) for cutscene",
            "(Optional) Examine Sealed Entrance again for additional cutscene about Lehko's hunger",
            "Return to Dhea Prandoleh; receive suggestions on required fish items",
            "Return to Sealed Entrance and trade one fish: Blackened Siredon, Forest Carp, Greedie, or Pipira",
            "Complete cutscene dialogue choices; receive 12 Red Roses and complete quest",
        }},
        [7] = { name="A Feast for Gnats", steps={
            "Complete When One Man Is Not Enough and zone into Windurst Waters (S) for cutscene",
            "Travel to Sauromugue Champaign (S) and speak with Mham Lahrih at fort (K-9) for cutscene",
            "Click Abandoned Mineshaft at bottom of stairs near Mham Lahrih; receive Signal firecracker key item",
            "Click Abandoned Mineshaft again to enter Ghoyu's Reverie instance",
            "Destroy Confederate Belfry (~14,000 HP) while protecting Romaa Mihgo; defeat spawning Quadav and Gigas reinforcements",
            "Return to Windurst Waters (S) and speak with Dhea Prandoleh to complete",
        }},
        [8] = { name="Sins of the Mothers", steps={
            "Talk to Dhea Prandoleh (H-10) for cutscene, then Velda-Galda (K-9) for another cutscene",
            "Check stone monument at (E-7) outside Fort Karugo-Narugo (S) Map 1",
            "Obtain succulent dragon fruit by checking Succulent Cactus at (F-5)",
            "Return to stone monument for another cutscene",
            "Examine Sunken Hollow at (G-7) for cutscene; examine again to enter BCNM in Ghoyu's Reverie",
            "Escort Nhev Befrathi (mother) and Syu Befrathi (daughter) to exit at (G-9) on Map 2; avoid monsters",
            "Zone into Windurst Waters (S) for final cutscene; receive Kitty Rod",
        }, alt={ name="Howl from the Heavens", steps={
            "Wait one game day after Sins of the Mothers; zone into Windurst Waters (S) from West Sarutabaruta (S) for cutscene",
            "Collect Shard of optistone from Magicite at Davoi (G-7)",
            "Collect Shard of aurastone from Magicite in Qulun Dome via Beadeaux (H-7)",
            "Collect Shard of orastone from Magicite at Castle Oztroja second floor (G-7) area",
            "Speak with Velda-Galda (K-9) in Windurst Waters (S) for cutscene",
            "Zone to West Sarutabaruta (S) for cutscene; examine Windurstian Bulwark (J-8) for cutscene",
            "Buff up, then examine Windurstian Bulwark again to start battle: 4 waves — 6 Yagudo Parivirs, 3 Giganotaurs, 6 Kindred Incantor, 3 Blurry Eyes; protect Romaa Mihgo and at least one Protective Ward",
            "Examine Windurstian Bulwark again before zoning for final cutscene",
            "Zone to Windurst Waters (S) for completion; receive Cobra Staff",
        }}},
        [9] = { name="Manifest Destiny", steps={
            "Talk to Dhea Prandoleh in Windurst Waters (S) for opening cutscene",
            "Visit Mithran Bivouac in Meriphataud Mountains (S) at (I-8) for cutscene",
            "Enter Castle Oztroja (S) for a cutscene",
            "Collect three Dorter Keys dropped by Yagudo Eradicators, Knights Templar, Prioresses, and Prelates in Meriphataud Mountains (S) and Castle Oztroja (S)",
            "Click Iron Grilles on the castle's second floor outdoor areas until sensing prisoners inside",
            "Trade each Dorter Key to three different grilles containing prisoners for cutscenes; receive Poet god's key after the third",
            "Climb to top of Castle Oztroja (S) and examine Collapsing Floor for cutscene",
            "Examine Collapsing Floor again to battle Tzee Xicu the Manifest and two Air Elementals; defeat boss",
            "Collect reward at Mithran Bivouac (I-8) if carrying a Hi-Reraiser",
        }},
        [10] = { name="At Journey's End", steps={
            "Examine Mithran Bivouac in Meriphataud Mountains (S) (I-8) to obtain Poet god's key",
            "Travel to Collapsing Floor at top of Castle Oztroja (S) for cutscene",
            "Examine Collapsing Floor again to enter BCNM against Fenrir (buffs persist into battle)",
            "Defeat Fenrir, who transforms between Karaha-Baruha and Robel-Akbel; keep Lehko Habhoka alive",
            "Return to Mithran Bivouac in Meriphataud Mountains (S) (I-8) for cutscene",
            "Speak with Dhea Prandoleh in Windurst Waters (S) (H-10) for cutscene",
            "Examine Sealed Entrance at West Sarutabaruta (S) (F-10)",
            "Return to Windurst Waters (S) and speak with Romaa Mihgo at (G-11) to complete",
            "(Optional) Learn Trust: Romaa Mihgo with Bundle of half-inscribed scrolls",
        }},
    },
}

------------------------------------------------------------------------
-- Line name aliases and display names
------------------------------------------------------------------------

local ALIASES = {
    s='sandy',    san='sandy',    sandy='sandy',
    b='bastok',   bas='bastok',   bastok='bastok',
    w='windurst', win='windurst', windurst='windurst',
    r='roz',      roz='roz',      zilart='roz',   zm='roz',
    c='cop',      cop='cop',      prom='cop',      promathia='cop',
    t='toau',     toau='toau',    aht='toau',
    wg='wotg',    wotg='wotg',   wings='wotg',    wog='wotg',
}

local LINE_NAMES = {
    sandy    = "San d'Oria",
    bastok   = 'Bastok',
    windurst = 'Windurst',
    roz      = 'Rise of the Zilart',
    cop      = 'Chains of Promathia',
    toau     = 'Treasures of Aht Urhgan',
    wotg     = 'Wings of the Goddess',
}

local NATION_BY_ID = { [0]='sandy', [1]='bastok', [2]='windurst' }

------------------------------------------------------------------------
-- Helpers
------------------------------------------------------------------------

local function is_logged_in()
    return AshitaCore:GetMemoryManager():GetParty():GetMemberServerId(0) ~= 0
end

local function get_home_nation()
    local player = AshitaCore:GetMemoryManager():GetPlayer()
    if player then
        return NATION_BY_ID[player:GetNation()]
    end
    return nil
end

local function msg(text)
    print('\31\200[Mission]\31\01 ' .. text)
end

local function show_mission(line, num, branch)
    local tbl = MISSIONS[line]
    if not tbl then
        msg('Unknown mission line: ' .. line)
        return
    end
    local entry = tbl[num]
    if not entry then
        msg(LINE_NAMES[line] .. ' ' .. num .. ': no data yet.')
        return
    end

    if branch then
        if not entry.branches or not entry.branches[branch] then
            msg('Unknown branch: ' .. branch)
            if entry.branches then
                local avail = {}
                for k in pairs(entry.branches) do table.insert(avail, k) end
                table.sort(avail)
                msg('Available branches: ' .. table.concat(avail, '  '))
            end
            return
        end
        local b = entry.branches[branch]
        msg(LINE_NAMES[line] .. ' ' .. num .. ' - ' .. entry.name .. ' [' .. b.name .. ']')
        for i, step in ipairs(b.steps) do
            msg('  ' .. i .. '. ' .. step)
        end
        return
    end

    if #entry.steps == 0 then
        msg(LINE_NAMES[line] .. ' ' .. num .. ' - ' .. entry.name .. ': no steps added yet.')
    else
        msg(LINE_NAMES[line] .. ' ' .. num .. ' - ' .. entry.name)
        for i, step in ipairs(entry.steps) do
            msg('  ' .. i .. '. ' .. step)
        end
    end
    if entry.branches then
        local avail = {}
        for k in pairs(entry.branches) do table.insert(avail, k) end
        table.sort(avail)
        msg('  Branches: /mission ' .. line .. ' ' .. num .. ' ' .. table.concat(avail, '|'))
    end
end

local function show_quest(nation, num)
    local tbl = QUESTS[nation]
    if not tbl then
        msg('No quest data for: ' .. tostring(nation))
        return
    end
    local n = tonumber(num)
    if not n then
        msg('Quest number must be a number. Example: /mission quest 1')
        return
    end
    local entry = tbl[n]
    if not entry then
        msg(LINE_NAMES[nation] .. ' quest ' .. n .. ': no data yet.')
        return
    end
    msg(LINE_NAMES[nation] .. ' Quest ' .. n .. ' - ' .. entry.name)
    for i, step in ipairs(entry.steps) do
        msg('  ' .. i .. '. ' .. step)
    end
    if entry.alt then
        msg('  -- Alt path: ' .. entry.alt.name .. ' --')
        for i, step in ipairs(entry.alt.steps) do
            msg('  ' .. i .. '. ' .. step)
        end
    end
end

------------------------------------------------------------------------
-- Command handler
-- /mission <num>              -- uses player's home nation
-- /mission <line> <num>       -- e.g. /mission sandy 1-1
-- /mission roz 5
-- /mission cop 2-3
-- /mission quest <num>        -- WotG nation quest (home nation)
-- /mission quest <nation> <num>
------------------------------------------------------------------------

ashita.events.register('command', 'mission_command', function(e)
    if not is_logged_in() then return end
    local args = e.command:args()
    if #args == 0 or args[1]:lower() ~= '/mission' then return end
    e.blocked = true

    if #args == 1 then
        msg('Usage: /mission <num>  OR  /mission <line> <num>')
        msg('Nation lines: sandy  bastok  windurst')
        msg('Expansion lines: roz  cop  toau  wotg')
        msg('WotG nation quests: /mission quest <num>  OR  /mission quest <nation> <num>')
        msg('Example: /mission 2-3   |   /mission sandy 2-3   |   /mission roz 5   |   /mission quest 1')
        return
    end

    local a2   = args[2]:lower()
    local line = ALIASES[a2]

    if a2 == 'quest' or a2 == 'q' then
        local nation_arg = args[3] and ALIASES[args[3]:lower()]
        local num_arg
        if nation_arg then
            num_arg = args[4]
        else
            nation_arg = get_home_nation()
            num_arg = args[3]
        end
        if not nation_arg then
            msg("Could not detect home nation. Use: /mission quest sandy 1")
            return
        end
        if not num_arg then
            msg('Specify a quest number. Example: /mission quest 1  |  /mission quest sandy 2')
            return
        end
        show_quest(nation_arg, num_arg)
    elseif line then
        -- /mission sandy 2-3  or  /mission roz 5
        if #args < 3 then
            msg('Specify a mission number. Example: /mission ' .. a2 .. ' 1-1')
            return
        end
        show_mission(line, args[3], args[4] and args[4]:lower() or nil)
    else
        -- /mission 2-3  (no line specified — use player's home nation)
        local nation = get_home_nation()
        if not nation then
            msg("Could not detect home nation. Use: /mission sandy 2-3")
            return
        end
        show_mission(nation, a2)
    end
end)

ashita.events.register('load', 'mission_load', function() end)
ashita.events.register('unload', 'mission_unload', function() end)
