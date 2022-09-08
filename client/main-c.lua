ESX = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

RegisterNetEvent('xex_rewards:show')
AddEventHandler('xex_rewards:show', function(premios)
	if premios > 0 then 
		SetNuiFocus( true, true )
		SendNUIMessage({
			action = 'showInterface',
			regalos = premios
		})
	end
end)

RegisterNetEvent('xex_rewards:win')
AddEventHandler('xex_rewards:win', function(item)
	if random ~= -1 then 
		SendNUIMessage({
			action = 'showWinner',
			itemName = item
		})
	else
		SetNuiFocus( false, false )
	end
end)

RegisterNetEvent('xex_rewards:generatePlate')
AddEventHandler('xex_rewards:generatePlate', function(owner, vehicleName)
	local generatedPlate = exports['esx_vehicleshop']:GeneratePlate()

	ESX.TriggerServerCallback('esx_vehicleshop:giveVehicle', function(success)
		if not success then
			ESX.ShowNotification(_U('error_reward'))
		end
	end, vehicleName, generatedPlate, 'Car Reward')
end)

RegisterNUICallback('closeButton', function(data, cb)
	SetNuiFocus( false, false )
  	cb('ok')
end)

RegisterNUICallback('openReward', function(data, cb)
	TriggerServerEvent('xex_rewards:open')
  	cb('ok')
end)