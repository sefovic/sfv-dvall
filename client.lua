RegisterNetEvent('deleteAllVehicles')
AddEventHandler('deleteAllVehicles', function()
    local vehicles = GetGamePool('CVehicle')
    for _, vehicle in ipairs(vehicles) do
        if DoesEntityExist(vehicle) then
            DeleteEntity(vehicle)
        end
    end
end)
