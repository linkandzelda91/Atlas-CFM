local syncFrame = CreateFrame("Frame")
syncFrame:RegisterEvent("PLAYER_ENTERING_WORLD")
syncFrame:RegisterEvent("QUEST_QUERY_COMPLETE")

local function SyncQuests()
    if not GetQuestsCompleted then return end
    local completedQuests = GetQuestsCompleted()
    if type(completedQuests) == "table" then
        local debugCount = 0
        for k,v in pairs(completedQuests) do debugCount = debugCount + 1 end
        if DEFAULT_CHAT_FRAME then DEFAULT_CHAT_FRAME:AddMessage("AtlasCFM AutoSync: Got " .. debugCount .. " completed quests.") end
        
        AtlasCFMCharDB = AtlasCFMCharDB or {}
        AtlasCFM.Q = AtlasCFM.Q or {}
        
        local matchCount = 0
        if AtlasCFM.Quest and AtlasCFM.Quest.DataBase then
            for instanceName, instanceData in pairs(AtlasCFM.Quest.DataBase) do
                if instanceData.Alliance then
                    for i, quest in ipairs(instanceData.Alliance) do
                        if quest.Id and (completedQuests[quest.Id] or completedQuests[tostring(quest.Id)]) then
                            local key = "Completed_" .. instanceName .. "_Quest_" .. i .. "_Alliance"
                            AtlasCFM.Q[key] = 1
                            AtlasCFMCharDB[key] = 1
                            matchCount = matchCount + 1
                        end
                    end
                end
                if instanceData.Horde then
                    for i, quest in ipairs(instanceData.Horde) do
                        if quest.Id and (completedQuests[quest.Id] or completedQuests[tostring(quest.Id)]) then
                            local key = "Completed_" .. instanceName .. "_Quest_" .. i .. "_Horde"
                            AtlasCFM.Q[key] = 1
                            AtlasCFMCharDB[key] = 1
                            matchCount = matchCount + 1
                        end
                    end
                end
            end
        end
        
        if DEFAULT_CHAT_FRAME then DEFAULT_CHAT_FRAME:AddMessage("AtlasCFM AutoSync: Matched " .. matchCount .. " Atlas quests.") end
        
        -- Refresh UI if open
        if AtlasCFM.Quest and AtlasCFM.Quest.RefreshQuestButtons then
            AtlasCFM.Quest.RefreshQuestButtons()
        end
        
        -- Update checkbox if specifically open
        if AtlasCFM.QCurrentInstance and AtlasCFM.QCurrentQuest and AtlasCFM.Quest.UI and AtlasCFM.Quest.UI.FinishedQuestCheckbox and AtlasCFM.Quest.UI.FinishedQuestCheckbox:IsVisible() then
            local questKey = "Completed_" .. AtlasCFM.QCurrentInstance .. "_Quest_" .. AtlasCFM.QCurrentQuest
            questKey = questKey .. (AtlasCFM.isHorde and "_Horde" or "_Alliance")
            AtlasCFM.Quest.UI.FinishedQuestCheckbox:SetChecked(AtlasCFM.Q[questKey] == 1)
        end
    end
end

syncFrame:SetScript("OnEvent", function()
    if event == "PLAYER_ENTERING_WORLD" then
        if QueryQuestsCompleted then
            if DEFAULT_CHAT_FRAME then DEFAULT_CHAT_FRAME:AddMessage("AtlasCFM Sync Frame: Triggering QueryQuestsCompleted()") end
            QueryQuestsCompleted()
        end
    elseif event == "QUEST_QUERY_COMPLETE" then
        if DEFAULT_CHAT_FRAME then DEFAULT_CHAT_FRAME:AddMessage("AtlasCFM Sync Frame: QUEST_QUERY_COMPLETE fired!") end
        SyncQuests()
    end
end)
