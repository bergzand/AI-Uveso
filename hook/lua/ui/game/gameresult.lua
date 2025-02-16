
-- Hook for debug only
local UvesoDoGameResult = DoGameResult
function DoGameResult(armyIndex, result)
    local Prefs = import('/lua/user/prefs.lua')
    local GameOptions = Prefs.GetFromCurrentProfile('LobbyPresets')[1].GameOptions
    local AIName = GetArmiesTable().armiesTable[armyIndex].nickname
    LOG('* AI-Uveso: Function DoGameResult(): Player Name: '..AIName..' - Result: '..result)
    if GameOptions.AIEndlessGameLoop == 'on' then
        local condPos = string.find(result, " ")
        local GameResult
        if condPos > 0 then
            GameResult = string.sub(result, 1, condPos - 1)
        end
        if GameResult == 'victory' or GameResult == 'draw' or GameResult == 'gameOver' then
            ForkThread(
                function()
                    local GTS = GetGameTimeSeconds()
                    local hours   = math.floor(GTS / 3600);
                    local minutes = math.floor((GTS - (hours * 3600)) / 60);
                    local seconds = GTS - (hours * 3600) - (minutes * 60);
                    WARN('* AI-Uveso: Function DoGameResult(): Game ended after ['..string.format("%02d:%02d:%02d", hours, minutes, seconds)..'] --- GameResult: "'..GameResult..'". Restarting in 5 seconds...')
                    coroutine.yield(50)
                    RestartSession()
                end
            )
        end
    end
    UvesoDoGameResult(armyIndex, result)
end
