local function Draw3DText(coords, text)
    SetDrawOrigin(coords.x, coords.y, coords.z, 0)
    SetTextScale(0.8, 0.8) -- Zvýšení velikosti textu (větší než 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 165, 0, 255) -- Oranžová barva (RGBA: 255, 165, 0, 255)
    SetTextEntry("STRING")
    AddTextComponentString(text)
    DrawText(0.0, 0.0)
    ClearDrawOrigin()
end

RegisterNetEvent("draw3DText")
AddEventHandler("draw3DText", function(number)
    local playerPed = PlayerPedId()
    local playerCoords = GetEntityCoords(playerPed)
    local textCoords = vector3(playerCoords.x, playerCoords.y, playerCoords.z + 1.0)

    Citizen.CreateThread(function()
        local endTime = GetGameTimer() + 900 -- Délka zobrazení
        while GetGameTimer() < endTime do
            Citizen.Wait(0)
            Draw3DText(textCoords, number)
        end
    end)
end)
