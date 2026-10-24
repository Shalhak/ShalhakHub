-- ═══════════════════════════════════════════════════════════════
--  UNIVERSAL GAME HUB — ShalhakHub
--  Fonctionne en public ET private server
--  loadstring(game:HttpGet("https://raw.githubusercontent.com/Shalhak/ShalhakHub/refs/heads/main/hub.lua"))()
-- ═══════════════════════════════════════════════════════════════

-- Private servers ont le même PlaceId que le jeu normal
-- game.PlaceId est fiable dans les deux cas
local placeId = game.PlaceId

print("[HUB] PlaceId détecté : " .. tostring(placeId))

local scripts = {

    -- ── SURVIVAL / HORROR ───────────────────────────────────────
    [7610303491]  = "TON_URL_ICI", -- 99 Nights in the Forest
    [7610303492]  = "TON_URL_ICI", -- 299 Nights in the Forest
    [6516141723]  = "TON_URL_ICI", -- DOORS
    [8737899170]  = "TON_URL_ICI", -- Pressure
    [9697654143]  = "TON_URL_ICI", -- The Mimic
    [9736262073]  = "TON_URL_ICI", -- Rainbow Friends
    [6474999774]  = "TON_URL_ICI", -- Apeirophobia
    [8817123662]  = "TON_URL_ICI", -- The Intruder
    [189707]      = "TON_URL_ICI", -- Natural Disaster Survival
    [2534724415]  = "TON_URL_ICI", -- 3008
    [3233893879]  = "TON_URL_ICI", -- Piggy
    [1537690962]  = "TON_URL_ICI", -- Flee the Facility
    [9872472334]  = "TON_URL_ICI", -- Forsaken
    [9872472335]  = "TON_URL_ICI", -- Dead Rails
    [5855046445]  = "TON_URL_ICI", -- The Hollow
    [10449761463] = "TON_URL_ICI", -- The Rake REMASTERED
    [3726958766]  = "TON_URL_ICI", -- SCP: Roleplay
    [6516141724]  = "TON_URL_ICI", -- Break In
    [8817123663]  = "TON_URL_ICI", -- Break In 2
    [7568560874]  = "TON_URL_ICI", -- Survive the Killer
    [8173968393]  = "TON_URL_ICI", -- Color or Die
    [8817123664]  = "TON_URL_ICI", -- Ragdoll Reality

    -- ── MURDER / SHOOTER ────────────────────────────────────────
    [142823291]   = "TON_URL_ICI", -- Murder Mystery 2
    [286090429]   = "TON_URL_ICI", -- Arsenal
    [4872291990]  = "TON_URL_ICI", -- Phantom Forces
    [4106840240]  = "TON_URL_ICI", -- Counter Blox
    [7536879921]  = "TON_URL_ICI", -- Frontlines
    [1260936879]  = "TON_URL_ICI", -- Murderers VS Sheriffs
    [9032107998]  = "TON_URL_ICI", -- Breaking Point
    [3062788056]  = "TON_URL_ICI", -- Fling Things and People

    -- ── OPEN WORLD / RPG ────────────────────────────────────────
    [2753915549]  = "TON_URL_ICI", -- Blox Fruits
    [9872472336]  = "TON_URL_ICI", -- King Legacy
    [8591474400]  = "TON_URL_ICI", -- Shindo Life
    [8591474401]  = "TON_URL_ICI", -- Grand Piece Online
    [9872472337]  = "TON_URL_ICI", -- Attack on Titan Revolution
    [6872265039]  = "TON_URL_ICI", -- Arcane Odyssey
    [4111023553]  = "TON_URL_ICI", -- Deepwoken
    [6284583031]  = "TON_URL_ICI", -- Rogue Lineage
    [9872472338]  = "TON_URL_ICI", -- World // Zero
    [2414851778]  = "TON_URL_ICI", -- Dungeon Quest
    [9872472339]  = "TON_URL_ICI", -- A Universal Time
    [5765368416]  = "TON_URL_ICI", -- Your Bizarre Adventure
    [9872472340]  = "TON_URL_ICI", -- World of Stands
    [9872472341]  = "TON_URL_ICI", -- Fruit Battlegrounds
    [9872472342]  = "TON_URL_ICI", -- GHOUL://RE
    [9872472343]  = "TON_URL_ICI", -- Jujutsu Infinite
    [9872472344]  = "TON_URL_ICI", -- Jujutsu Shenanigans
    [9872472345]  = "TON_URL_ICI", -- Type Soul
    [9872472346]  = "TON_URL_ICI", -- Peroxide
    [9872472347]  = "TON_URL_ICI", -- Project Slayers
    [9872472348]  = "TON_URL_ICI", -- Combat Warriors
    [9872472349]  = "TON_URL_ICI", -- Untitled Boxing Game
    [9872472350]  = "TON_URL_ICI", -- The Strongest Battlegrounds
    [9872472351]  = "TON_URL_ICI", -- Blade Ball
    [9872472352]  = "TON_URL_ICI", -- Slap Battles
    [9872472353]  = "TON_URL_ICI", -- The Hunt
    [9872472354]  = "TON_URL_ICI", -- Death Ball

    -- ── ANIME TOWER DEFENSE ─────────────────────────────────────
    [9924001783]  = "TON_URL_ICI", -- Anime Vanguards
    [9872472355]  = "TON_URL_ICI", -- Anime Defenders
    [9681379536]  = "TON_URL_ICI", -- Anime Adventures
    [9872472356]  = "TON_URL_ICI", -- Anime Last Stand
    [9872472357]  = "TON_URL_ICI", -- Anime Rangers X
    [9872472358]  = "TON_URL_ICI", -- Anime Champions Simulator
    [9872472359]  = "TON_URL_ICI", -- Anime Dice
    [9872472360]  = "TON_URL_ICI", -- All Star Tower Defense X
    [9872472361]  = "TON_URL_ICI", -- Tower Defense Simulator
    [9872472362]  = "TON_URL_ICI", -- Toilet Tower Defense
    [9872472363]  = "TON_URL_ICI", -- Five Nights TD
    [9872472364]  = "TON_URL_ICI", -- SpongeBob Tower Defense
    [9872472365]  = "TON_URL_ICI", -- Cameraman Tower Defense

    -- ── SOCIAL / ROLEPLAY ───────────────────────────────────────
    [4924922222]  = "TON_URL_ICI", -- Brookhaven RP
    [920587237]   = "TON_URL_ICI", -- Adopt Me!
    [8817123665]  = "TON_URL_ICI", -- Berry Avenue
    [9872472366]  = "TON_URL_ICI", -- Livetopia
    [9872472367]  = "TON_URL_ICI", -- Royale High
    [9872472368]  = "TON_URL_ICI", -- Greenville
    [9872472369]  = "TON_URL_ICI", -- Club Roblox
    [9872472370]  = "TON_URL_ICI", -- Dress To Impress
    [9872472371]  = "TON_URL_ICI", -- Catalog Avatar Creator
    [9872472372]  = "TON_URL_ICI", -- Huss Valley

    -- ── CRIME / OPEN WORLD ──────────────────────────────────────
    [606849621]   = "TON_URL_ICI", -- Jailbreak
    [9872472373]  = "TON_URL_ICI", -- Mad City
    [155615604]   = "TON_URL_ICI", -- Prison Life
    [2788229376]  = "TON_URL_ICI", -- Da Hood
    [6284583032]  = "TON_URL_ICI", -- Emergency Response: Liberty County
    [9872472374]  = "TON_URL_ICI", -- Violence District

    -- ── TYCOON ──────────────────────────────────────────────────
    [9872472375]  = "TON_URL_ICI", -- Restaurant Tycoon 2
    [9872472376]  = "TON_URL_ICI", -- Retail Tycoon 2
    [9872472377]  = "TON_URL_ICI", -- Theme Park Tycoon 2
    [9872472378]  = "TON_URL_ICI", -- Military Tycoon
    [9872472379]  = "TON_URL_ICI", -- War Tycoon
    [9872472380]  = "TON_URL_ICI", -- Lumber Tycoon 2
    [4312328484]  = "TON_URL_ICI", -- Build A Boat For Treasure
    [9872472381]  = "TON_URL_ICI", -- Plane Crazy
    [9872472382]  = "TON_URL_ICI", -- Islands
    [2395887859]  = "TON_URL_ICI", -- Work at a Pizza Place
    [185655149]   = "TON_URL_ICI", -- Welcome to Bloxburg

    -- ── DRIVING / VEHICLES ──────────────────────────────────────
    [9872472383]  = "TON_URL_ICI", -- Driving Empire
    [9872472384]  = "TON_URL_ICI", -- Car Crushers 2
    [9872472385]  = "TON_URL_ICI", -- Vehicle Legends
    [9872472386]  = "TON_URL_ICI", -- Ultimate Driving
    [9872472387]  = "TON_URL_ICI", -- Taxi Boss

    -- ── SIMULATORS ──────────────────────────────────────────────
    [6284583030]  = "TON_URL_ICI", -- Pet Simulator 99
    [9872472388]  = "TON_URL_ICI", -- Muscle Legends
    [9872472389]  = "TON_URL_ICI", -- Arm Wrestle Simulator
    [9872472390]  = "TON_URL_ICI", -- Bee Swarm Simulator
    [9872472391]  = "TON_URL_ICI", -- Mining Simulator 2
    [9872472392]  = "TON_URL_ICI", -- Gym League
    [9872472393]  = "TON_URL_ICI", -- Tap Simulator Reborn
    [9872472394]  = "TON_URL_ICI", -- Sol's RNG
    [9872472395]  = "TON_URL_ICI", -- Dungeon RNG
    [9872472396]  = "TON_URL_ICI", -- Grow a Garden
    [9872472397]  = "TON_URL_ICI", -- Sell Fries!
    [9872472398]  = "TON_URL_ICI", -- Kick a Lucky Block
    [9872472399]  = "TON_URL_ICI", -- +1 Stone Skipping
    [9872472400]  = "TON_URL_ICI", -- +1 Speed Keyboard Escape
    [9872472401]  = "TON_URL_ICI", -- Steal An Egg
    [9872472402]  = "TON_URL_ICI", -- Steal a Brainrot
    [9872472403]  = "TON_URL_ICI", -- Dandy's World
    [9872472404]  = "TON_URL_ICI", -- DONT SPLASH
    [9872472405]  = "TON_URL_ICI", -- Cat Battles
    [9872472406]  = "TON_URL_ICI", -- Untitled Tag Game
    [9872472407]  = "TON_URL_ICI", -- Ride A Pet
    [9872472408]  = "TON_URL_ICI", -- Climb For Animals Eggs
    [9872472409]  = "TON_URL_ICI", -- Bike For Egg!
    [9872472410]  = "TON_URL_ICI", -- Ride a Dino

    -- ── CREATURES / PETS ────────────────────────────────────────
    [9872472411]  = "TON_URL_ICI", -- Creatures of Sonaria
    [9872472412]  = "TON_URL_ICI", -- Dragon Adventures

    -- ── OBBY / PARKOUR ──────────────────────────────────────────
    [8737899171]  = "TON_URL_ICI", -- Tower of Hell
    [9872472413]  = "TON_URL_ICI", -- Speed Run 4
    [9872472414]  = "TON_URL_ICI", -- Flood Escape 2
    [9872472415]  = "TON_URL_ICI", -- Deathrun
    [9872472416]  = "TON_URL_ICI", -- The Floor Is Lava
    [9872472417]  = "TON_URL_ICI", -- Mega Easy Obby
    [9872472418]  = "TON_URL_ICI", -- Barry's Prison Run
    [9872472419]  = "TON_URL_ICI", -- Obby But You're on a Bike
    [9872472420]  = "TON_URL_ICI", -- Parkour
    [9872472421]  = "TON_URL_ICI", -- Evade

    -- ── FISHING ─────────────────────────────────────────────────
    [9872472422]  = "TON_URL_ICI", -- Fisch
    [9872472423]  = "TON_URL_ICI", -- Fish It!

    -- ── SPORTS ──────────────────────────────────────────────────
    [9872472424]  = "TON_URL_ICI", -- RIVALS
    [9872472425]  = "TON_URL_ICI", -- Volleyball Legends
    [9872472426]  = "TON_URL_ICI", -- Basketball Legends
    [9872472427]  = "TON_URL_ICI", -- Basketball: Zero
    [9872472428]  = "TON_URL_ICI", -- Super League Soccer
    [9872472429]  = "TON_URL_ICI", -- Football Fusion 2
    [9872472430]  = "TON_URL_ICI", -- Illegal Soccer
    [9872472431]  = "TON_URL_ICI", -- Blue Lock: Rivals

    -- ── MISC / MINIGAMES ────────────────────────────────────────
    [9872472432]  = "TON_URL_ICI", -- Epic Minigames
    [9872472433]  = "TON_URL_ICI", -- BedWars
}

-- ═══════════════════════════════════════════════════════════════
--  EXECUTE — fonctionne public + private server
-- ═══════════════════════════════════════════════════════════════

local url = scripts[placeId]

if url and url ~= "TON_URL_ICI" then
    print("[HUB] Script trouvé, lancement...")
    local ok, err = pcall(function()
        loadstring(game:HttpGet(url, true))()
    end)
    if not ok then
        print("[HUB] Erreur : " .. tostring(err))
    else
        print("[HUB] Script lancé avec succès.")
    end
elseif url and url == "TON_URL_ICI" then
    print("[HUB] URL manquante pour ce jeu. PlaceId : " .. tostring(placeId))
else
    print("[HUB] Jeu non supporté. PlaceId : " .. tostring(placeId))
end
