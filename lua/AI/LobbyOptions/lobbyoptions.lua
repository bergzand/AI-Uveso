
AIOpts = {
    {
        default = 1,
        label = "<LOC aisettingsUveso_0187>AI Unit Cap",
        help = "<LOC aisettingsUveso_0188>Set an AI unit cap independently from player unit cap.",
        key = 'AIUnitCap',
        value_text = "%s",
        value_help = "<LOC aisettingsUveso_0189>%s units per AI may be in play",
        values = {
            {
                text = "<LOC aisettingsUveso_0190>Same as Player Cap",
                help = "<LOC aisettingsUveso_0191>AI uses player unit cap.",
                key = '0',
            },
            '125', '150', '175', '200', '250', '300', '350', '400', '450', '500', '600', '700', '800', '900',
            '1000', '1100', '1200', '1300', '1400', '1500', '1600', '1700', '1800', '1900', '2000'
        },
    },
    {
        default = 2,
        label = "<LOC aisettingsUveso_0192>AI Map Marker generator",
        help = "<LOC aisettingsUveso_0193>Autogenerate map markers for AI pathfinding on 5x5 and 10x10 maps",
        key = 'AIMapMarker',
        values = {
            {
                text = "<LOC aisettingsUveso_0194>Original Map markers",
                help = "<LOC aisettingsUveso_0195>Use map markers done by the mapauthor",
                key = 'map',
            },
            {
                text = "<LOC aisettingsUveso_0196>Autogenerate when needed",
                help = "<LOC aisettingsUveso_0197>Autogenerate map markers if no original markers are present",
                key = 'miss',
            },
            {
                text = "<LOC aisettingsUveso_0198>Autogenerate Always",
                help = "<LOC aisettingsUveso_0199>Autogenerate map markers always (ignore original markers if present)",
                key = 'all',
            },
            {
                text = "<LOC aisettingsUveso_0200>No Marker",
                help = "<LOC aisettingsUveso_0201>Use the c-engine to path the way (20%% slower)",
                key = 'off',
            },
            {
                text = "<LOC aisettingsUveso_0202>Print to game.log",
                help = "<LOC aisettingsUveso_0203>Print the marker masterchain to the game.log for copy&paste",
                key = 'print',
            },
        },
    },
    {
        default = 1,
        label = "<LOC aisettingsUveso_0153>DEBUG: AI pathfinding",
        help = "<LOC aisettingsUveso_0154>Displays pathfinding, waypoints and location radii (only AI-Uveso)",
        key = 'AIPathingDebug',
        values = {
            {
                text = "<LOC aisettingsUveso_0155>Off",
                help = "<LOC aisettingsUveso_0156>Display is off",
                key = 'off',
            },
            {
                text = "<LOC aisettingsUveso_0185>Pathfinding",
                help = "<LOC aisettingsUveso_0186>Show pathfinding for all layers",
                key = 'path',
            },
            {
                text = "<LOC aisettingsUveso_0157>Pathfinding and locations",
                help = "<LOC aisettingsUveso_0158>Show pathfinding and location radii",
                key = 'pathlocation',
            },
            {
                text = "<LOC aisettingsUveso_0204>Pathfinding and marker threat",
                help = "<LOC aisettingsUveso_0205>Show pathfinding and threats saved in AI markers",
                key = 'paththreats',
            },

            {
                text = "<LOC aisettingsUveso_0209>Pathfinding and IMap threat",
                help = "<LOC aisettingsUveso_0210>Show pathfinding and threats from ingame threatmap",
                key = 'imapthreats',
            },
            {
                text = "<LOC aisettingsUveso_0159>Path and land marker",
                help = "<LOC aisettingsUveso_0160>Show pathfinding, land waypoints and paths",
                key = 'land',
            },
            {
                text = "<LOC aisettingsUveso_0161>Path and water marker",
                help = "<LOC aisettingsUveso_0162>Show pathfinding, water waypoints and paths",
                key = 'water',
            },
            {
                text = "<LOC aisettingsUveso_0163>Path and amphibious marker",
                help = "<LOC aisettingsUveso_0164>Show pathfinding, amphibious waypoints and paths",
                key = 'amph',
            },
            {
                text = "<LOC aisettingsUveso_0165>Path and air marker",
                help = "<LOC aisettingsUveso_0166>Show pathfinding, air waypoints and paths",
                key = 'air',
            },
        },
    },
    {
        default = 1,
        label = "<LOC aisettingsUveso_0167>DEBUG: AI Platoon names",
        help = "<LOC aisettingsUveso_0168>Displays Platoon and AI plan name",
        key = 'AIPLatoonNameDebug',
        values = {
            {
                text = "<LOC aisettingsUveso_0155>Off",
                help = "<LOC aisettingsUveso_0169>Display is off",
                key = 'off',
            },
            {
                text = "<LOC aisettingsUveso_0170>AI Uveso names",
                help = "<LOC aisettingsUveso_0171>Show platoon and AI plan name for AI Uveso",
                key = 'Uveso',
            },
            {
                text = "<LOC aisettingsUveso_0206>AI RNG names",
                help = "<LOC aisettingsUveso_0207>Show platoon and AI plan name for AI RNG",
                key = 'RNG',
            },
            {
                text = "<LOC aisettingsUveso_0219>AI NutCracker names",
                help = "<LOC aisettingsUveso_0220>Show platoon and AI plan name for AI NutCracker",
                key = 'NutCracker',
            },
            {
                text = "<LOC aisettingsUveso_0216>AI Swarm names",
                help = "<LOC aisettingsUveso_0217>Show platoon and AI plan name for AI Swarm",
                key = 'Swarm',
            },
            {
                text = "<LOC aisettingsUveso_0172>AI Dilli names",
                help = "<LOC aisettingsUveso_0173>Show platoon and AI plan name for AI Dilli",
                key = 'Dilli',
            },
            {
                text = "<LOC aisettingsUveso_0174>AI Sorian names",
                help = "<LOC aisettingsUveso_0175>Show platoon and AI plan name for AI Sorian",
                key = 'Sorian',
            },
            {
                text = "<LOC aisettingsUveso_0176>All AI's",
                help = "<LOC aisettingsUveso_0177>Show platoon and AI plan name for all AI's",
                key = 'all',
            },
        },
    },
    {
        default = 1,
        label = "<LOC aisettingsUveso_0178>DEBUG: AI BuilderManager",
        help = "<LOC aisettingsUveso_0179>Print platoon builder names into the game.log",
        key = 'AIBuilderNameDebug',
        values = {
            {
                text = "<LOC aisettingsUveso_0155>Off",
                help = "<LOC aisettingsUveso_0180>Logging is off",
                key = 'off',
            },
            {
                text = "<LOC aisettingsUveso_0170>AI Uveso names",
                help = "<LOC aisettingsUveso_0181>Log builder for AI Uveso",
                key = 'Uveso',
            },
            {
                text = "<LOC aisettingsUveso_0206>AI RNG names",
                help = "<LOC aisettingsUveso_0208>Log builder for AI RNG",
                key = 'RNG',
            },
            {
                text = "<LOC aisettingsUveso_0219>AI NutCracker names",
                help = "<LOC aisettingsUveso_0221>Log builder for AI NutCracker",
                key = 'NutCracker',
            },
            {
                text = "<LOC aisettingsUveso_0216>AI Swarm names",
                help = "<LOC aisettingsUveso_0218>Log builder for AI Swarm",
                key = 'Swarm',
            },
            {
                text = "<LOC aisettingsUveso_0172>AI Dilli names",
                help = "<LOC aisettingsUveso_0182>Log builder for AI Dilli",
                key = 'Dilli',
            },
            {
                text = "<LOC aisettingsUveso_0174>AI Sorian names",
                help = "<LOC aisettingsUveso_0183>Log builder for AI Sorian",
                key = 'Sorian',
            },
            {
                text = "<LOC aisettingsUveso_0176>All AI's",
                help = "<LOC aisettingsUveso_0184>Log builder for all AI's",
                key = 'all',
            },
        },
    },
    {
        default = 1,
        label = "<LOC aisettingsUveso_0211>DEBUG: Endless game loop",
        help = "<LOC aisettingsUveso_0212>Running the game in an endless loop for long time testing",
        key = 'AIEndlessGameLoop',
        values = {
            {
                text = "<LOC aisettingsUveso_0155>Off",
                help = "<LOC aisettingsUveso_0214>Endless play off",
                key = 'off',
            },
            {
                text = "<LOC aisettingsUveso_0213>On",
                help = "<LOC aisettingsUveso_0215>Endless play on",
                key = 'on',
            },
        },
   },
}
