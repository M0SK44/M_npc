local scriptVersion = "1.0.0" -- Versión actual del script

Citizen.CreateThread(function()
    PerformHttpRequest("https://raw.githubusercontent.com/tuUsuario/tuRepositorio/main/version.txt", function(err, responseText, headers)
        if err == 200 then
            if responseText ~= scriptVersion then
                print("^3[AVISO] Tu script no está actualizado. Versión actual: " .. scriptVersion .. " | Última versión: " .. responseText .. "^0")
            else
                print("^2[INFO] El script está actualizado. Versión: " .. scriptVersion .. "^0")
            end
        else
            print("^1[ERROR] No se pudo verificar la versión del script.^0")
        end
    end, "GET")
end)