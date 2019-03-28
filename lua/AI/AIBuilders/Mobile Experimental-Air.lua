local EBC = '/lua/editor/EconomyBuildConditions.lua'
local UCBC = '/lua/editor/UnitCountBuildConditions.lua'
local BasePanicZone, BaseMilitaryZone, BaseEnemyZone = import('/mods/AI-Uveso/lua/AI/uvesoutilities.lua').GetDangerZoneRadii()

-- ===================================================-======================================================== --
-- ==                                      Mobile Experimental Air                                           == --
-- ===================================================-======================================================== --
BuilderGroup {
    BuilderGroupName = 'U4 Air Experimental Builders',                               -- BuilderGroupName, initalized from AIBaseTemplates in "\lua\AI\AIBaseTemplates\"
    BuildersType = 'EngineerBuilder',
    Builder {
        BuilderName = 'U4 AirExp1 Minimum',
        PlatoonTemplate = 'T3EngineerBuilderNoSUB',
        Priority = 160,
        InstanceCount = 1,
        BuilderConditions = {
            -- When do we want to build this ?
            { UCBC, 'HaveGreaterThanUnitsWithCategory', { 0, categories.MOBILE * categories.LAND * categories.EXPERIMENTAL }},
            -- Do we need additional conditions to build it ?
            { UCBC, 'PoolGreaterAtLocation', { 'LocationType', 2, 'ENGINEER TECH3' }},
            { UCBC, 'CanBuildCategory', { categories.MOBILE * categories.AIR * categories.EXPERIMENTAL - categories.SATELLITE } },
            -- Have we the eco to build it ?
            { EBC, 'GreaterThanEconIncome', { 7.0, 600.0 }},                    -- Base income
            { EBC, 'GreaterThanEconStorageRatio', { 0.40, 0.95 } },             -- Ratio from 0 to 1. (1=100%)
            -- Don't build it if...
       },
        BuilderType = 'Any',
        BuilderData = {
            Construction = {
                DesiresAssist = true,
                NumAssistees = 10,
                BuildClose = true,
                AdjacencyCategory = 'SHIELD STRUCTURE',
                BuildStructures = {
                    'T4AirExperimental1',
                },
                Location = 'LocationType',
            }
        }
    },
    Builder {
        BuilderName = 'U4 AirExperimental1',
        PlatoonTemplate = 'T3EngineerBuilderNoSUB',
        Priority = 150,
        InstanceCount = 6,
        BuilderConditions = {
            -- When do we want to build this ?
            { UCBC, 'HaveGreaterThanUnitsWithCategory', { 0, categories.MOBILE * categories.LAND * categories.EXPERIMENTAL }},
            -- Do we need additional conditions to build it ?
            { UCBC, 'PoolGreaterAtLocation', { 'LocationType', 2, 'ENGINEER TECH3' }},
            { UCBC, 'CanBuildCategory', { categories.MOBILE * categories.AIR * categories.EXPERIMENTAL - categories.SATELLITE } },
            -- Have we the eco to build it ?
            { EBC, 'GreaterThanEconIncome', { 7.0, 600.0 }},                    -- Base income
            { EBC, 'GreaterThanEconStorageRatio', { 0.95, 0.95 } },             -- Ratio from 0 to 1. (1=100%)
            -- Don't build it if...
       },
        BuilderType = 'Any',
        BuilderData = {
            Construction = {
                DesiresAssist = true,
                NumAssistees = 10,
                BuildClose = true,
                AdjacencyCategory = 'SHIELD STRUCTURE',
                BuildStructures = {
                    'T4AirExperimental1',
                },
                Location = 'LocationType',
            }
        }
    },
}
-- ===================================================-======================================================== --
-- ==                                  Experimental Attack FormBuilder                                       == --
-- ===================================================-======================================================== --
-- =============== --
--    PanicZone    --
-- =============== --
BuilderGroup {
    BuilderGroupName = 'U4 Air Experimental Formers PanicZone',               -- BuilderGroupName, initalized from AIBaseTemplates in "\lua\AI\AIBaseTemplates\"
    BuildersType = 'PlatoonFormBuilder',
    Builder {
        BuilderName = 'U4 BasePanicZone AIR',                                   -- Random Builder Name.
        PlatoonTemplate = 'U4-ExperimentalInterceptor 1 1',                     -- Template Name. These units will be formed. See: "\lua\AI\PlatoonTemplates"
        --PlatoonAddPlans = {'NameUnitsSorian'},
        Priority = 90,                                                          -- Priority. 1000 is normal.
        InstanceCount = 5,                                                      -- Number of plattons that will be formed.
        FormRadius = 10000,
        BuilderData = {
            SearchRadius = BasePanicZone,                                       -- Searchradius for new target.
            GetTargetsFromBase = true,                                          -- Get targets from base position (true) or platoon position (false)
            AggressiveMove = true,                                              -- If true, the unit will attack everything while moving to the target.
            AttackEnemyStrength = 100000,                                       -- Compare platoon to enemy strenght. 100 will attack equal, 50 weaker and 150 stronger enemies.
            IgnorePathing = true,                                               -- If true, the platoon will not use AI pathmarkers and move directly to the target
            TargetSearchCategory = categories.MOBILE - categories.SCOUT,        -- Only find targets matching these categories.
            MoveToCategories = {                                                -- Move to targets
                categories.EXPERIMENTAL,
                categories.ANTIAIR,
                categories.MOBILE,
            },
            WeaponTargetCategories = {                                          -- Override weapon target priorities
                categories.ANTIAIR,
                categories.EXPERIMENTAL,
                categories.ALLUNITS,
            },
        },
        BuilderConditions = {                                                   -- platoon will be formed if all conditions are true
            -- When do we want to form this ?
            { UCBC, 'EnemyUnitsGreaterAtLocationRadius', {  BasePanicZone, 'LocationType', 0, categories.MOBILE }}, -- radius, LocationType, unitCount, categoryEnemy
            { UCBC, 'PoolGreaterAtLocation', { 'LocationType', 1, categories.EXPERIMENTAL * categories.MOBILE } },
        },
        BuilderType = 'Any',                                                    -- Build with "Land" "Air" "Sea" "Gate" or "All" Factories. - "Any" forms a Platoon.
    },
}
-- ================== --
--    MilitaryZone    --
-- ================== --
BuilderGroup {
    BuilderGroupName = 'U4 Air Experimental Formers MilitaryZone',               -- BuilderGroupName, initalized from AIBaseTemplates in "\lua\AI\AIBaseTemplates\"
    BuildersType = 'PlatoonFormBuilder',
    Builder {
        BuilderName = 'U4 BaseMilitaryZone AIR',                                -- Random Builder Name.
        PlatoonTemplate = 'U4-ExperimentalInterceptor 1 1',                     -- Template Name. These units will be formed. See: "\lua\AI\PlatoonTemplates"
        --PlatoonAddPlans = {'NameUnitsSorian'},
        Priority = 80,                                                          -- Priority. 1000 is normal.
        InstanceCount = 3,                                                      -- Number of plattons that will be formed.
        FormRadius = 10000,
        BuilderData = {
            SearchRadius = BaseMilitaryZone,                                    -- Searchradius for new target.
            GetTargetsFromBase = true,                                          -- Get targets from base position (true) or platoon position (false)
            AggressiveMove = true,                                              -- If true, the unit will attack everything while moving to the target.
            AttackEnemyStrength = 100000,                                       -- Compare platoon to enemy strenght. 100 will attack equal, 50 weaker and 150 stronger enemies.
            IgnorePathing = true,                                               -- If true, the platoon will not use AI pathmarkers and move directly to the target
            TargetSearchCategory = categories.EXPERIMENTAL,                     -- Only find targets matching these categories.
            MoveToCategories = {                                                -- Move to targets
                'MOBILE AIR EXPERIMENTAL',
                'MOBILE LAND EXPERIMENTAL',
            },
        },
        BuilderConditions = {                                                   -- platoon will be formed if all conditions are true
            -- When do we want to form this ?
            { UCBC, 'EnemyUnitsGreaterAtLocationRadius', {  BaseMilitaryZone, 'LocationType', 0, categories.EXPERIMENTAL}}, -- radius, LocationType, unitCount, categoryEnemy
            { UCBC, 'PoolGreaterAtLocation', { 'LocationType', 1, categories.EXPERIMENTAL * categories.MOBILE } },
        },
        BuilderType = 'Any',                                                    -- Build with "Land" "Air" "Sea" "Gate" or "All" Factories. - "Any" forms a Platoon.
    },
}
-- =============== --
--    EnemyZone    --
-- =============== --
BuilderGroup {
    BuilderGroupName = 'U4 Air Experimental Formers EnemyZone',              -- BuilderGroupName, initalized from AIBaseTemplates in "\lua\AI\AIBaseTemplates\"
    BuildersType = 'PlatoonFormBuilder',
    Builder {
        BuilderName = 'U4 Unprotected Air Solo',                                -- Random Builder Name.
        PlatoonTemplate = 'U4-ExperimentalInterceptor 1 1',                     -- Template Name. These units will be formed. See: "\lua\AI\PlatoonTemplates"
        --PlatoonAddPlans = {'NameUnitsSorian'},
        Priority = 75,                                                          -- Priority. 1000 is normal.
        InstanceCount = 1,                                                      -- Number of plattons that will be formed.
        FormRadius = 10000,
        BuilderData = {
            SearchRadius = BaseEnemyZone,                                       -- Searchradius for new target.
            GetTargetsFromBase = false,                                         -- Get targets from base position (true) or platoon position (false)
            AggressiveMove = true,                                              -- If true, the unit will attack everything while moving to the target.
            AttackEnemyStrength = 0,                                            -- Compare platoon to enemy strenght. 100 will attack equal, 50 weaker and 150 stronger enemies.
            TargetSearchCategory = 'STRUCTURE',                                 -- Only find targets matching these categories.
            MoveToCategories = {                                                -- Move to targets
                'STRUCTURE EXPERIMENTAL ECONOMIC',
                'STRUCTURE EXPERIMENTAL',
                'STRUCTURE NUKE',
                'STRUCTURE FACTORY TECH3',
                'STRUCTURE ENERGYPRODUCTION TECH3',
                'STRUCTURE DEFENSE TECH3',
                'STRUCTURE DEFENSE TECH2',
                'STRUCTURE DEFENSE',
                'STRUCTURE',
                'ALLUNITS',
            },
        },
        BuilderConditions = {                                                   -- platoon will be formed if all conditions are true
            -- When do we want to form this ?
            { UCBC, 'GreaterThanGameTimeSeconds', { 60*30 } },
            { UCBC, 'PoolGreaterAtLocation', { 'LocationType', 1, categories.EXPERIMENTAL * categories.MOBILE } },
        },
        BuilderType = 'Any',                                                    -- Build with "Land" "Air" "Sea" "Gate" or "All" Factories. - "Any" forms a Platoon.
    },
    Builder {
        BuilderName = 'U4 EnemyBase Air Solo',                                  -- Random Builder Name.
        PlatoonTemplate = 'U4-ExperimentalInterceptor 1 1',                     -- Template Name. These units will be formed. See: "\lua\AI\PlatoonTemplates"
        --PlatoonAddPlans = {'NameUnitsSorian'},
        Priority = 70,                                                          -- Priority. 1000 is normal.
        InstanceCount = 2,                                                      -- Number of plattons that will be formed.
        FormRadius = 10000,
        BuilderData = {
            SearchRadius = BaseEnemyZone,                                       -- Searchradius for new target.
            GetTargetsFromBase = false,                                         -- Get targets from base position (true) or platoon position (false)
            AggressiveMove = true,                                              -- If true, the unit will attack everything while moving to the target.
            AttackEnemyStrength = 100000,                                       -- Compare platoon to enemy strenght. 100 will attack equal, 50 weaker and 150 stronger enemies.
            TargetSearchCategory = categories.ALLUNITS,                         -- Only find targets matching these categories.
            MoveToCategories = {                                                -- Move to targets
                'STRUCTURE EXPERIMENTAL ECONOMIC',
                'STRUCTURE EXPERIMENTAL',
                'STRUCTURE NUKE',
                'STRUCTURE FACTORY TECH3',
                'STRUCTURE ENERGYPRODUCTION TECH3',
                'STRUCTURE DEFENSE TECH3',
                'STRUCTURE DEFENSE TECH2',
                'STRUCTURE DEFENSE',
                'STRUCTURE',
                'ALLUNITS',
            },
        },
        BuilderConditions = {                                                   -- platoon will be formed if all conditions are true
            -- When do we want to form this ?
            { UCBC, 'GreaterThanGameTimeSeconds', { 60*30 } },
            { UCBC, 'PoolGreaterAtLocation', { 'LocationType', 1, categories.EXPERIMENTAL * categories.MOBILE } },
        },
        BuilderType = 'Any',                                                    -- Build with "Land" "Air" "Sea" "Gate" or "All" Factories. - "Any" forms a Platoon.
    },
}
-- ============ --
--    Sniper    --
-- ============ --

-- ==================== --
--    Unit Cap Trasher  --
-- ==================== --
BuilderGroup {
    BuilderGroupName = 'U4 Air Experimental Formers Trasher',                 -- BuilderGroupName, initalized from AIBaseTemplates in "\lua\AI\AIBaseTemplates\"
    BuildersType = 'PlatoonFormBuilder',                                        -- BuilderTypes are: EngineerBuilder, FactoryBuilder, PlatoonFormBuilder.
    Builder {
        BuilderName = 'U4 AIR Trasher',                                         -- Random Builder Name.
        --PlatoonAddPlans = {'NameUnitsSorian'},
        PlatoonTemplate = 'U4-ExperimentalInterceptor 1 1',                     -- Template Name. These units will be formed. See: "\lua\AI\PlatoonTemplates"
        Priority = 60,                                                          -- Priority. 1000 is normal.
        InstanceCount = 5,                                                      -- Number of plattons that will be formed.
        FormRadius = 10000,
        BuilderData = {
            SearchRadius = BaseEnemyZone,                                       -- Searchradius for new target.
            GetTargetsFromBase = false,                                         -- Get targets from base position (true) or platoon position (false)
            AggressiveMove = false,                                             -- If true, the unit will attack everything while moving to the target.
            AttackEnemyStrength = 100000,                                       -- Compare platoon to enemy strenght. 100 will attack equal, 50 weaker and 150 stronger enemies.
            TargetSearchCategory = categories.ALLUNITS,                         -- Only find targets matching these categories.
            MoveToCategories = {                                                -- Move to targets
                'STRUCTURE EXPERIMENTAL ECONOMIC',
                'STRUCTURE EXPERIMENTAL',
                'STRUCTURE NUKE',
                'STRUCTURE FACTORY TECH3',
                'STRUCTURE ENERGYPRODUCTION TECH3',
                'STRUCTURE DEFENSE TECH3',
                'STRUCTURE DEFENSE TECH2',
                'STRUCTURE DEFENSE',
                'STRUCTURE',
                'ALLUNITS',
            },
        },
        BuilderConditions = {                                                   -- platoon will be formed if all conditions are true
            -- When do we want to form this ?
            { UCBC, 'UnitCapCheckGreater', { 0.90 } },
            { UCBC, 'PoolGreaterAtLocation', { 'LocationType', 1, categories.EXPERIMENTAL * categories.MOBILE } },
            { UCBC, 'EnemyUnitsLessAtLocationRadius', {  BasePanicZone, 'LocationType', 0, categories.ALLUNITS - categories.SCOUT }}, -- radius, LocationType, unitCount, categoryEnemy
        },
        BuilderType = 'Any',                                                    -- Build with "Land" "Air" "Sea" "Gate" or "All" Factories. - "Any" forms a Platoon.
    },
}
-- =========== --
--    Guards   --
-- =========== --
