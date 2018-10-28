local UCBC = '/lua/editor/UnitCountBuildConditions.lua'
local EBC = '/lua/editor/EconomyBuildConditions.lua'

local MaxCapFactory = 0.024                                                     -- 2.4% of all units can be factories (STRUCTURE * FACTORY)
local MaxCapStructure = 0.14                                                    -- 14% of all units can be structures (STRUCTURE -MASSEXTRACTION -DEFENSE -FACTORY)

BuilderGroup {
    BuilderGroupName = 'U1 Expansion Builder Uveso',                            -- BuilderGroupName, initalized from AIBaseTemplates in "\lua\AI\AIBaseTemplates\"
    BuildersType = 'EngineerBuilder',                                           -- BuilderTypes are: EngineerBuilder, FactoryBuilder, PlatoonFormBuilder.
    Builder {
        BuilderName = 'U1 Vacant Start Location',                               -- Random Builder Name.
        PlatoonTemplate = 'EngineerBuilder',                                    -- Template Name. These units will be formed. See: "\lua\AI\PlatoonTemplates\"
        Priority = 15400,                                                        -- Priority. Higher priotity will be build more often then lower priotity.
        InstanceCount = 4,                                                      -- Number of plattons that will be formed with this template.
        BuilderConditions = {
            -- When do we want to build this ?
            { UCBC, 'ExpansionBaseCheck', { } },
            -- Do we need additional conditions to build it ?
            { UCBC, 'StartLocationNeedsEngineer', { 'LocationType', 1000, -1000, 100, 1, 'StructuresNotMex' } },
            -- Have we the eco to build it ?
            { EBC, 'GreaterThanEconIncome',  { 1.0, 6.0}},
            { EBC, 'GreaterThanEconStorageRatio', { 0.35, 0.99 } },             -- Ratio from 0 to 1. (1=100%)
            -- Don't build it if...
            -- Respect UnitCap
        },
        BuilderType = 'Any',
        BuilderData = {
            RequireTransport = false,
            Construction = {
                BuildClose = false,
                BaseTemplate = 'ExpansionBaseTemplates',
                ExpansionBase = true,
                NearMarkerType = 'Start Location',
                LocationRadius = 1000,
                LocationType = 'LocationType',
                ThreatMin = -1000,
                ThreatMax = 100,
                ThreatRings = 1,
                ThreatType = 'StructuresNotMex',
                ExpansionRadius = 100,
                BuildStructures = {
                    'T1LandFactory',
                    'T1Radar',
--                    'T1AADefense',
--                    'T1GroundDefense',
                }
            },
        }
    },
    Builder {
        BuilderName = 'U1 Vacant Start Location trans',                               -- Random Builder Name.
        PlatoonTemplate = 'EngineerBuilder',                                    -- Template Name. These units will be formed. See: "\lua\AI\PlatoonTemplates\"
        Priority = 15400,                                                        -- Priority. Higher priotity will be build more often then lower priotity.
        InstanceCount = 1,                                                      -- Number of plattons that will be formed with this template.
        BuilderConditions = {
            -- When do we want to build this ?
            { UCBC, 'ExpansionBaseCheck', { } },
            -- Do we need additional conditions to build it ?
            { UCBC, 'StartLocationNeedsEngineer', { 'LocationType', 1000, -1000, 100, 1, 'StructuresNotMex' } },
            -- Have we the eco to build it ?
            { EBC, 'GreaterThanEconIncome',  { 1.0, 6.0}},
            { EBC, 'GreaterThanEconStorageRatio', { 0.35, 0.99 } },             -- Ratio from 0 to 1. (1=100%)
            -- Don't build it if...
            -- Respect UnitCap
        },
        BuilderType = 'Any',
        BuilderData = {
            RequireTransport = true,
            Construction = {
                BuildClose = false,
                BaseTemplate = 'ExpansionBaseTemplates',
                ExpansionBase = true,
                NearMarkerType = 'Start Location',
                LocationRadius = 1000,
                LocationType = 'LocationType',
                ThreatMin = -1000,
                ThreatMax = 100,
                ThreatRings = 1,
                ThreatType = 'StructuresNotMex',
                ExpansionRadius = 100,
                BuildStructures = {
                    'T1LandFactory',
                    'T1Radar',
                    'T1AADefense',
                    'T1GroundDefense',
                }
            },
        }
    },
    Builder {
        BuilderName = 'U1 Vacant Expansion Area',                               -- Random Builder Name.
        PlatoonTemplate = 'EngineerBuilder',                                    -- Template Name. These units will be formed. See: "\lua\AI\PlatoonTemplates\"
        Priority = 15300,                                                        -- Priority. Higher priotity will be build more often then lower priotity.
        InstanceCount = 4,                                                      -- Number of plattons that will be formed with this template.
        BuilderConditions = {
            -- When do we want to build this ?
            { UCBC, 'ExpansionBaseCheck', { } },
            -- Do we need additional conditions to build it ?
            { UCBC, 'ExpansionAreaNeedsEngineer', { 'LocationType', 1000, -1000, 100, 1, 'StructuresNotMex' } },
            -- Have we the eco to build it ?
            { EBC, 'GreaterThanEconIncome',  { 1.0, 6.0}},
            { EBC, 'GreaterThanEconStorageRatio', { 0.35, 0.99 } },             -- Ratio from 0 to 1. (1=100%)
            -- Don't build it if...
            -- Respect UnitCap
        },
        BuilderType = 'Any',
        BuilderData = {
            RequireTransport = false,
            Construction = {
                BuildClose = false,
                BaseTemplate = 'ExpansionBaseTemplates',
                ExpansionBase = true,
                NearMarkerType = 'Expansion Area',
                LocationRadius = 1000,
                LocationType = 'LocationType',
                ThreatMin = -1000,
                ThreatMax = 100,
                ThreatRings = 1,
                ThreatType = 'StructuresNotMex',
                ExpansionRadius = 100,
                BuildStructures = {
                    'T1LandFactory',
                    'T1Radar',
--                    'T1AADefense',
--                    'T1GroundDefense',
                }
            },
        }
    },
    Builder {
        BuilderName = 'U1 Vacant Expansion Area trans',                               -- Random Builder Name.
        PlatoonTemplate = 'EngineerBuilder',                                    -- Template Name. These units will be formed. See: "\lua\AI\PlatoonTemplates\"
        Priority = 15300,                                                        -- Priority. Higher priotity will be build more often then lower priotity.
        InstanceCount = 1,                                                      -- Number of plattons that will be formed with this template.
        BuilderConditions = {
            -- When do we want to build this ?
            { UCBC, 'ExpansionBaseCheck', { } },
            -- Do we need additional conditions to build it ?
            { UCBC, 'ExpansionAreaNeedsEngineer', { 'LocationType', 1000, -1000, 100, 1, 'StructuresNotMex' } },
            -- Have we the eco to build it ?
            { EBC, 'GreaterThanEconIncome',  { 1.0, 6.0}},
            { EBC, 'GreaterThanEconStorageRatio', { 0.35, 0.99 } },             -- Ratio from 0 to 1. (1=100%)
            -- Don't build it if...
            -- Respect UnitCap
        },
        BuilderType = 'Any',
        BuilderData = {
            RequireTransport = true,
            Construction = {
                BuildClose = false,
                BaseTemplate = 'ExpansionBaseTemplates',
                ExpansionBase = true,
                NearMarkerType = 'Expansion Area',
                LocationRadius = 1000,
                LocationType = 'LocationType',
                ThreatMin = -1000,
                ThreatMax = 100,
                ThreatRings = 1,
                ThreatType = 'StructuresNotMex',
                ExpansionRadius = 100,
                BuildStructures = {
                    'T1LandFactory',
                    'T1Radar',
                    'T1AADefense',
                    'T1GroundDefense',
                }
            },
        }
    },
    Builder {
        BuilderName = 'U1 Naval Builder 250',                                       -- Random Builder Name.
        PlatoonTemplate = 'EngineerBuilder',                                    -- Template Name. These units will be formed. See: "\lua\AI\PlatoonTemplates\"
        Priority = 17490,                                                        -- Priority. Higher priotity will be build more often then lower priotity.
        InstanceCount = 2,                                                      -- Number of plattons that will be formed with this template.
        BuilderConditions = {
            -- When do we want to build this ?
            { UCBC, 'NavalBaseCheck', { } },
            -- Do we need additional conditions to build it ?
            { UCBC, 'NavalAreaNeedsEngineer', { 'LocationType', 250, -1000, 100, 1, 'AntiSurface' } },
            -- Have we the eco to build it ?
            { EBC, 'GreaterThanEconIncome',  { 1.0, 6.0}},
            -- Don't build it if...
            -- Respect UnitCap
        },
        BuilderType = 'Any',
        BuilderData = {
            RequireTransport = false,
            Construction = {
                BuildClose = false,
                BaseTemplate = 'ExpansionBaseTemplates',
                ExpansionBase = true,
                NearMarkerType = 'Naval Area',
                LocationRadius = 250,
                LocationType = 'LocationType',
                ThreatMin = -1000,
                ThreatMax = 100,
                ThreatRings = 1,
                ThreatType = 'AntiSurface',
                ExpansionRadius = 120,
                BuildStructures = {
                    'T1SeaFactory',
                }
            }
        }
    },
    Builder {
        BuilderName = 'U1 Naval Builder far',                                       -- Random Builder Name.
        PlatoonTemplate = 'EngineerBuilder',                                    -- Template Name. These units will be formed. See: "\lua\AI\PlatoonTemplates\"
        Priority = 17400,                                                        -- Priority. Higher priotity will be build more often then lower priotity.
        InstanceCount = 2,                                                      -- Number of plattons that will be formed with this template.
        BuilderConditions = {
            -- When do we want to build this ?
            { UCBC, 'NavalBaseCheck', { } },
            -- Do we need additional conditions to build it ?
            { UCBC, 'NavalAreaNeedsEngineer', { 'LocationType', 1000, -1000, 100, 1, 'AntiSurface' } },
            -- Have we the eco to build it ?
            { EBC, 'GreaterThanEconIncome',  { 1.0, 6.0}},
            -- Don't build it if...
            -- Respect UnitCap
        },
        BuilderType = 'Any',
        BuilderData = {
            RequireTransport = false,
            Construction = {
                BuildClose = false,
                BaseTemplate = 'ExpansionBaseTemplates',
                ExpansionBase = true,
                NearMarkerType = 'Naval Area',
                LocationRadius = 1000,
                LocationType = 'LocationType',
                ThreatMin = -1000,
                ThreatMax = 100,
                ThreatRings = 1,
                ThreatType = 'AntiSurface',
                ExpansionRadius = 120,
                BuildStructures = {
                    'T1SeaFactory',
                }
            }
        }
    },
    Builder {
        BuilderName = 'U1 Naval Builder trans',                                       -- Random Builder Name.
        PlatoonTemplate = 'EngineerBuilder',                                    -- Template Name. These units will be formed. See: "\lua\AI\PlatoonTemplates\"
        Priority = 17400,                                                        -- Priority. Higher priotity will be build more often then lower priotity.
        InstanceCount = 2,                                                      -- Number of plattons that will be formed with this template.
        BuilderConditions = {
            -- When do we want to build this ?
            { UCBC, 'NavalBaseCheck', { } },
            -- Do we need additional conditions to build it ?
            { UCBC, 'NavalAreaNeedsEngineer', { 'LocationType', 1000, -1000, 100, 1, 'AntiSurface' } },
            -- Have we the eco to build it ?
            { EBC, 'GreaterThanEconIncome',  { 1.0, 6.0}},
            -- Don't build it if...
            -- Respect UnitCap
        },
        BuilderType = 'Any',
        BuilderData = {
            RequireTransport = true,
            Construction = {
                BuildClose = false,
                BaseTemplate = 'ExpansionBaseTemplates',
                ExpansionBase = true,
                NearMarkerType = 'Naval Area',
                LocationRadius = 1000,
                LocationType = 'LocationType',
                ThreatMin = -1000,
                ThreatMax = 100,
                ThreatRings = 1,
                ThreatType = 'AntiSurface',
                ExpansionRadius = 120,
                BuildStructures = {
                    'T1SeaFactory',
                }
            }
        }
    },
}
