local validWeather = {
    EXTRASUNNY = true, CLEAR = true, CLOUDS = true,
    OVERCAST = true, RAIN = true, THUNDER = true,
    FOGGY = true, SMOG = true, SNOW = true,
    BLIZZARD = true, CLEARING = true, NEUTRAL = true,
    XMAS = true, HALLOWEEN = true
}

RegisterCommand('time', function(source, args)
    if source == 0 or IsPlayerAceAllowed(source, "command.time") then
        local hour = tonumber(args[1])
        if hour and hour >= 0 and hour <= 23 then
            TriggerClientEvent('cloud:syncTime', -1, hour)

            local weather = args[2] and string.upper(args[2])
            if weather and validWeather[weather] then
                TriggerClientEvent('cloud:syncWeather', -1, weather)
            elseif weather then
                TriggerClientEvent('cloud:notify', source, '❌ Cuaca tidak valid.', 'error')
            end
        else
            TriggerClientEvent('cloud:notify', source, '❌ Jam harus antara 0-23.', 'error')
        end
    else
        TriggerClientEvent('cloud:notify', source, '❌ Tidak ada izin.', 'error')
    end
end)

RegisterNetEvent('cloud:setTime', function(hour)
    if type(hour) == 'number' and hour >= 0 and hour <= 23 then
        TriggerClientEvent('cloud:syncTime', -1, hour)
    end
end)

RegisterNetEvent('cloud:setWeather', function(weather)
    if weather and validWeather[weather] then
        TriggerClientEvent('cloud:syncWeather', -1, weather)
    else
        TriggerClientEvent('cloud:notify', source, '❌ Cuaca tidak valid.', 'error')
    end
end)
