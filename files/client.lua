local ox_lib = exports.ox_lib

local function notify(text, type)
    ox_lib:notify({
        title = 'Info',
        description = text,
        type = type or 'inform',
        position = 'top-left',
        duration = 3000,
    })
end

RegisterNetEvent('cloud:notify', function(text, type)
    notify(text, type)
end)

RegisterNetEvent('cloud:syncTime', function(hour)
    NetworkOverrideClockTime(hour, 0, 0)
    notify('🕒 Waktu diatur ke ' .. hour .. ':00', 'success')
end)

RegisterNetEvent('cloud:syncWeather', function(weather)
    ClearOverrideWeather()
    ClearWeatherTypePersist()
    SetWeatherTypePersist(weather)
    SetWeatherTypeNow(weather)
    SetWeatherTypeNowPersist(weather)

    local weatherNames = {
        EXTRASUNNY = 'Cerah', CLEAR = 'Langit Jernih', CLOUDS = 'Berawan',
        OVERCAST = 'Mendung', RAIN = 'Hujan', THUNDER = 'Petir',
        FOGGY = 'Berkabut', SMOG = 'Asap', SNOW = 'Salju',
        BLIZZARD = 'Badai Salju', CLEARING = 'Cerah Setelah Hujan', NEUTRAL = 'Netral',
        XMAS = 'Cuaca Natal', HALLOWEEN = 'Cuaca Halloween'
    }

    local translated = weatherNames[weather] or weather
    notify('⛅ Cuaca berubah menjadi ' .. translated, 'success')
end)

-- Menu utama
local function openMainMenu()
    ox_lib:registerContext({
        id = 'main_menu',
        title = 'Panel Cuaca & Waktu',
        options = {
            { title = '🕒 Ubah Waktu', description = 'Atur waktu server', event = 'cloud:openTimeMenu' },
            { title = '⛅ Ubah Cuaca', description = 'Atur cuaca server', event = 'cloud:openWeatherMenu' },
            { title = '❌ Tutup', description = 'Tutup menu' }
        }
    })
    ox_lib:showContext('main_menu')
end

-- Menu waktu
RegisterNetEvent('cloud:openTimeMenu', function()
    local timeOptions = {}
    for i = 0, 23 do
        timeOptions[#timeOptions+1] = {
            title = i .. ':00',
            description = 'Atur waktu ke jam ' .. i .. ':00',
            onSelect = function()
                TriggerServerEvent('cloud:setTime', i)
                openMainMenu()
            end
        }
    end

    ox_lib:registerContext({
        id = 'time_menu',
        title = '🕒 Pilih Jam',
        options = timeOptions
    })

    ox_lib:showContext('time_menu')
end)

-- Menu cuaca
RegisterNetEvent('cloud:openWeatherMenu', function()
    local weatherOptions = {
        { id = 'EXTRASUNNY', title = '☀️ Cerah (EXTRASUNNY)' },
        { id = 'CLEAR', title = '🌤️ Jernih (CLEAR)' },
        { id = 'CLOUDS', title = '☁️ Berawan (CLOUDS)' },
        { id = 'OVERCAST', title = '🌥️ Mendung (OVERCAST)' },
        { id = 'RAIN', title = '🌧️ Hujan (RAIN)' },
        { id = 'THUNDER', title = '⛈️ Petir (THUNDER)' },
        { id = 'FOGGY', title = '🌫️ Kabut (FOGGY)' },
        { id = 'SMOG', title = '🔥 Asap (SMOG)' },
        { id = 'SNOW', title = '❄️ Salju (SNOW)' },
        { id = 'BLIZZARD', title = '🌨️ Badai Salju (BLIZZARD)' },
        { id = 'CLEARING', title = '🌈 Cerah Habis Hujan (CLEARING)' },
        { id = 'NEUTRAL', title = '🔳 Netral (NEUTRAL)' },
        { id = 'XMAS', title = '🎄 Natal (XMAS)' },
        { id = 'HALLOWEEN', title = '🎃 Halloween (HALLOWEEN)' }
    }

    local options = {}
    for _, weather in pairs(weatherOptions) do
        options[#options+1] = {
            title = weather.title,
            onSelect = function()
                TriggerServerEvent('cloud:setWeather', weather.id)
                openMainMenu()
            end
        }
    end

    ox_lib:registerContext({
        id = 'weather_menu',
        title = '⛅ Pilih Cuaca',
        options = options
    })

    ox_lib:showContext('weather_menu')
end)

RegisterCommand('weatherpanel', function()
    openMainMenu()
end, false)
