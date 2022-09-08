ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterCommand(Config.ClaimCommand, function(source, args, rawCommand)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local premios = getPremios(xPlayer.identifier)
    if premios > 0 then
        TriggerClientEvent('xex_rewards:show', _source, premios)
    else
        xPlayer.showNotification(_U('no_reward'))
    end
end)


RegisterServerEvent('xex_rewards:open')
AddEventHandler('xex_rewards:open', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
       
    local premio = math.random(0,9999)
    -- print('DEBUG: ' .. premio .. '\n')
    local item = nil

    -- Make sure it gets discounted before getting rewards
    restarPremio(xPlayer.identifier)

    local premiado = nil

    for k, v in pairs(Config.Rewards) do
        if v.raffleNumbers >= premio and premiado == nil then
            premiado = v
        end
    end

    xPlayer.showNotification(premiado.text)

    if premiado.carModel ~= nil then
        giveVehicle(_source, xPlayer.identifier, premiado.carModel)
    end

    if premiado.moneyReward > 0 then
        xPlayer.addAccountMoney('money', premiado.moneyReward)
    end

    if premiado.blackMoneyReward > 0 then
        xPlayer.addAccountMoney('black_money', premiado.blackMoneyReward)
    end

    TriggerClientEvent('xex_rewards:win', _source, premiado.rewardImage)
end)


function giveVehicle(_source, owner, vehicleName)
    TriggerClientEvent('xex_rewards:generatePlate', _source, owner, vehicleName)
end

function restarPremio(identifier) 
    local result = MySQL.Async.fetchAll("UPDATE users SET rewards = rewards - 1 WHERE identifier = @identifier", {
        ['@identifier'] = identifier
    })
end

function getPremios(identifier) 
    local result = MySQL.Sync.fetchAll("SELECT rewards FROM users WHERE identifier = @identifier", {
        ['@identifier'] = identifier
    })
    if result[1] ~= nil then
        return result[1].rewards
    end

    return nil
end
