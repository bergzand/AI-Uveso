
oldAIBrain = AIBrain
AIBrain = Class(oldAIBrain) {

    BaseMonitorThread = function(self)
       -- Only use this with AI-Uveso
        if not self.Uveso then
            return oldAIBrain.BaseMonitorThread(self)
        end
        WaitTicks(10)
    end,

    ParseIntelThread = function(self)
        -- Only use this with AI-Uveso
        if not self.Uveso then
            return oldAIBrain.ParseIntelThread(self)
        end
        WaitTicks(10)
    end,

    EconomyMonitor = function(self)
        -- Only use this with AI-Uveso
        if not self.Uveso then
            return oldAIBrain.EconomyMonitor(self)
        end
        WaitTicks(10)
    end,

}