
CreateThread(function()
    while true do
        TriggerClientEvent('chat:addMessage', -1, {
            template = '<div style="padding: 0.60vw; margin: -0.4vw; background-color: rgba(0, 0, 0, 0.6); border-radius: 3px;"><i class="fas fa-robot"></i> [Zero RZ] Car Wipes: {0}</div>',
            args = {"Car Wipe In 30 Seconds! "}
        })
        Wait(30000)
        TriggerClientEvent("wld:delallveh", -1, -1)
        TriggerClientEvent('chat:addMessage', -1, {
            template = '<div style="padding: 0.60vw; margin: -0.4vw; background-color: rgba(0, 0, 0, 0.6); border-radius: 3px;"><i class="fas fa-robot"></i> [Zero RZ] Car Wipes: {0}</div>',
            args = {"All Cars Have Been Cleared! "}
        })
        Citizen.Wait(2750000)
    end
  end)
  

  CreateThread(function()
    while true do
        TriggerClientEvent('chat:addMessage', -1, {
            template = '<div style="padding: 0.60vw; margin: -0.4vw; background-color: rgba(0, 0, 0, 0.6); border-radius: 3px;"><i class="fas fa-robot"></i> [Zero RZ] System: {0}</div>',
            args = {"Join discord.gg/zerorz! "}
        })
        Citizen.Wait(2750000)
    end
  end)
  
