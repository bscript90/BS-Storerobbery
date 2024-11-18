Citizen.CreateThread(function()
    local currentVersion = GetResourceMetadata(GetCurrentResourceName(), 'version', 0)
        PerformHttpRequest("https://raw.githubusercontent.com/bscript90/bs-versionchecker/refs/heads/main/bs-storerobbery.json", function(err, data, headers)
        local myData = json.decode(data)
        if myData.version ~= currentVersion then
            print("^3[^5"..GetCurrentResourceName().."^3] ^1┌──────────────────────────────────────────────────────────────────┐^0")
            print("^3[^5"..GetCurrentResourceName().."^3] ^1├ ❌ Version "..myData.version.." OUTDATED! Please upgarde from keymaster account^0")
            for i=1,#myData.changelog do
                print("^3[^5"..GetCurrentResourceName().."^3] ^1├ ^0"..myData.changelog[i].." ^0")
            end
            print("^3[^5"..GetCurrentResourceName().."^3] ^6├ 🤖 Join Discord For 24/7 Help discord.gg/dxVJ2wxfc6^0")
            print("^3[^5"..GetCurrentResourceName().."^3] ^1└──────────────────────────────────────────────────────────────────┘^0")
        else
            print("^3[^5"..GetCurrentResourceName().."^3] ^2┌─────────────────────────────┐^0")
            print("^3[^5"..GetCurrentResourceName().."^3] ^2├ ✅ Version "..myData.version.." Up to date^0")
            print("^3[^5"..GetCurrentResourceName().."^3] ^6├ 🤖 Join Discord For 24/7 Help discord.gg/dxVJ2wxfc6^0")
            print("^3[^5"..GetCurrentResourceName().."^3] ^2└─────────────────────────────┘^0")
        end
    end, "GET", "")
end)
