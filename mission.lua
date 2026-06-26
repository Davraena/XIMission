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
        ['1-2'] = { name="The Rescue Drill", steps={
            "Talk to any Gate Guard",
            "Kill Ding Bats in King Ranperre's Tomb (night only) until Orcish Mail Scales drop",
            "Touch the Tombstone at H/I-10 in KRT for a CS",
            "(Bats and tombstone can be done in either order)",
            "Trade the Orcish Mail Scales to any Gate Guard",
        }},
        ['1-3'] = { name="A Geological Survey", steps={
            "Talk to any Gate Guard",
            "Talk to Arnau in Northern San d'Oria (M-6)",
            "Go to Ghelsba Outpost, examine Hut Door at G-9",
            "Fight 3 orcs, then CS at the Hut Door",
            "Return to any Gate Guard",
        }},
        ['2-1'] = { name="Bat Hunt", steps={
            "Talk to any Gate Guard",
            "Talk to Galaihaurat in La Theine Plateau (E-6)",
            "Talk to Ruillont in Ordelle's Caves (G-3)",
            "In La Theine, check Deaufrain/Equesobillot/Galaihaurat - one holds a Bronze Sword",
            "Trade the Bronze Sword to Ruillont in Ordelle's Caves (G-3)",
            "Talk to Vicorpass in La Theine Plateau (F-6)",
            "Return to any Gate Guard",
        }},
        ['2-2'] = { name="The Emissary", steps={
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
        ['5-2'] = { name="Darkness Named", steps={
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
            -- add steps
        }},
        ['1-2'] = { name="Below the Arks", steps={
            -- add steps
        }},
        ['1-3'] = { name="The Mothercrystals", steps={
            -- add steps
        }},
        ['2-1'] = { name="An Invitation West", steps={
            -- add steps
        }},
        ['2-2'] = { name="The Lost City", steps={
            -- add steps
        }},
        ['2-3'] = { name="Distant Beliefs", steps={
            -- add steps
        }},
        ['2-4'] = { name="An Eternal Melody", steps={
            -- add steps
        }},
        ['2-5'] = { name="Ancient Vows", steps={
            -- add steps
        }},
        ['3-1'] = { name="The Call of the Wyrmking", steps={
            -- add steps
        }},
        ['3-2'] = { name="A Vessel Without a Captain", steps={
            -- add steps
        }},
        ['3-3'] = { name="The Road Forks", steps={
            -- add steps
        }},
        ['3-4'] = { name="Tending Aged Wounds", steps={
            -- add steps
        }},
        ['3-5'] = { name="Darkness Named", steps={
            -- add steps
        }},
        ['4-1'] = { name="Sheltering Doubt", steps={
            -- add steps
        }},
        ['4-2'] = { name="The Savage", steps={
            -- add steps
        }},
        ['4-3'] = { name="The Secrets of Worship", steps={
            -- add steps
        }},
        ['4-4'] = { name="Slanderous Utterings", steps={
            -- add steps
        }},
        ['5-1'] = { name="The Enduring Tumult of War", steps={
            -- add steps
        }},
        ['5-2'] = { name="Desires of Emptiness", steps={
            -- add steps
        }},
        ['5-3'] = { name="Three Paths", steps={
            -- add steps
        }},
        ['6-1'] = { name="For Whom the Verse is Sung", steps={
            -- add steps
        }},
        ['6-2'] = { name="A Place to Return", steps={
            -- add steps
        }},
        ['6-3'] = { name="More Questions than Answers", steps={
            -- add steps
        }},
        ['6-4'] = { name="One to be Feared", steps={
            -- add steps
        }},
        ['7-1'] = { name="Chains and Bonds", steps={
            -- add steps
        }},
        ['7-2'] = { name="Flames in the Darkness", steps={
            -- add steps
        }},
        ['7-3'] = { name="Fire in the Eyes of Men", steps={
            -- add steps
        }},
        ['7-4'] = { name="Calm Before the Storm", steps={
            -- add steps
        }},
        ['7-5'] = { name="The Warrior's Path", steps={
            -- add steps
        }},
        ['8-1'] = { name="Garden of Antiquity", steps={
            -- add steps
        }},
        ['8-2'] = { name="A Fate Decided", steps={
            -- add steps
        }},
        ['8-3'] = { name="When Angels Fall", steps={
            -- add steps
        }},
        ['8-4'] = { name="Dawn", steps={
            -- add steps
        }},
        ['8-5'] = { name="The Last Verse", steps={
            -- add steps
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
            -- add steps
        }},
        ['4']  = { name="The Queen of the Dance", steps={
            -- add steps
        }},
        ['5']  = { name="While the Cat is Away", steps={
            -- add steps
        }},
        ['6']  = { name="A Timeswept Butterfly", steps={
            -- add steps
        }},
        ['7']  = { name="Purple, The New Black", steps={
            -- add steps
        }},
        ['8']  = { name="In the Name of the Father", steps={
            -- add steps
        }},
        ['9']  = { name="Dancers in Distress", steps={
            -- add steps
        }},
        ['10'] = { name="Daughter of a Knight", steps={
            -- add steps
        }},
        ['11'] = { name="A Spoonful of Sugar", steps={
            -- add steps
        }},
        ['12'] = { name="Affairs of State", steps={
            -- add steps
        }},
        ['13'] = { name="Borne by the Wind", steps={
            -- add steps
        }},
        ['14'] = { name="A Nation on the Brink", steps={
            -- add steps
        }},
        ['15'] = { name="Crossroads of Time", steps={
            -- add steps
        }},
        ['16'] = { name="Sandswept Memories", steps={
            -- add steps
        }},
        ['17'] = { name="Northland Exposure", steps={
            -- add steps
        }},
        ['18'] = { name="Traitor in the Midst", steps={
            -- add steps
        }},
        ['19'] = { name="Betrayal at Beaucedine", steps={
            -- add steps
        }},
        ['20'] = { name="On Thin Ice", steps={
            -- add steps
        }},
        ['21'] = { name="Proof of Valor", steps={
            -- add steps
        }},
        ['22'] = { name="A Sanguinary Prelude", steps={
            -- add steps
        }},
        ['23'] = { name="Dungeons and Dancers", steps={
            -- add steps
        }},
        ['24'] = { name="Distorter of Time", steps={
            -- add steps
        }},
        ['25'] = { name="The Will of the World", steps={
            -- add steps
        }},
        ['26'] = { name="Fate in Haze", steps={
            -- add steps
        }},
        ['27'] = { name="The Scent of Battle", steps={
            -- add steps
        }},
        ['28'] = { name="Another World", steps={
            -- add steps
        }},
        ['29'] = { name="A Hawk in Repose", steps={
            -- add steps
        }},
        ['30'] = { name="The Battle of Xarcabard", steps={
            -- add steps
        }},
        ['31'] = { name="Prelude to a Storm", steps={
            -- add steps
        }},
        ['32'] = { name="Storm's Crescendo", steps={
            -- add steps
        }},
        ['33'] = { name="Into the Beast's Maw", steps={
            -- add steps
        }},
        ['34'] = { name="The Hunter Ensnared", steps={
            -- add steps
        }},
        ['35'] = { name="Flight of the Lion", steps={
            -- add steps
        }},
        ['36'] = { name="Fall of the Hawk", steps={
            -- add steps
        }},
        ['37'] = { name="Darkness Descends", steps={
            -- add steps
        }},
        ['38'] = { name="Adieu, Lilisette", steps={
            -- add steps
        }},
        ['39'] = { name="By the Fading Light", steps={
            -- add steps
        }},
        ['40'] = { name="Edge of Existence", steps={
            -- add steps
        }},
        ['41'] = { name="Her Memories", steps={
            -- add steps
        }},
        ['42'] = { name="Forget Me Not", steps={
            -- add steps
        }},
        ['43'] = { name="Pillar of Hope", steps={
            -- add steps
        }},
        ['44'] = { name="Glimmer of Life", steps={
            -- add steps
        }},
        ['45'] = { name="Time Slips Away", steps={
            -- add steps
        }},
        ['46'] = { name="When Wills Collide", steps={
            -- add steps
        }},
        ['47'] = { name="Whispers of Dawn", steps={
            -- add steps
        }},
        ['48'] = { name="A Dreamy Interlude", steps={
            -- add steps
        }},
        ['49'] = { name="Cait in the Woods", steps={
            -- add steps
        }},
        ['50'] = { name="Fork in the Road", steps={
            -- add steps
        }},
        ['51'] = { name="Maiden of the Dusk", steps={
            -- add steps
        }},
        ['52'] = { name="Where It All Began", steps={
            -- add steps
        }},
        ['53'] = { name="A Token of Troth", steps={
            -- add steps
        }},
        ['54'] = { name="Lest We Forget", steps={
            -- add steps
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
