local config = {
    messagePrefix = "[DOC]", -- Prefix zprávy v chatu
    systemMessagePrefix = "[System]", -- Prefix systémové zprávy
    defaultWaitTime = 1000, -- Výchozí čas čekání mezi zprávami (v milisekundách)
    draw3DTextDuration = 900 -- Doba zobrazení čísla nad postavou (v milisekundách)
}

RegisterCommand("doc", function(source, args, rawCommand)
    if #args < 1 then
        TriggerClientEvent('chat:addMessage', source, {
            args = { "^1" .. config.systemMessagePrefix, "^7Musíš zadat číslo!" }
        })
        return
    end

    local countTo = tonumber(args[1])

    if not countTo or countTo <= 0 then
        TriggerClientEvent('chat:addMessage', source, {
            args = { "^1" .. config.systemMessagePrefix, "^7Musíš zadat platné číslo větší než 0!" }
        })
        return
    end

    Citizen.CreateThread(function()
        for i = 1, countTo do
            Citizen.Wait(config.defaultWaitTime)
            TriggerClientEvent('chat:addMessage', -1, {
                args = {config.messagePrefix, tostring(i)}
            })
            TriggerClientEvent("draw3DText", source, tostring(i))
        end
    end)
end, false)
