Config = {}

Config.Locale = 'en'

Config.ClaimCommand = 'mygift'

Config.Rewards = { -- [0 - 10000] Raffle numbers
    {
        raffleNumbers = 250, -- 2.5% [0-250]
        text = "You won ~b~Akuma~w~!",
        carModel = 'akuma',
        moneyReward = 0,
        blackMoneyReward = 0,
        rewardImage = 'car'
    },
    {
        raffleNumbers = 500, -- 2.5% [250-500]
        text = "You won ~b~Adder~w~!",
        carModel = 'adder',
        moneyReward = 0,
        blackMoneyReward = 0,
        rewardImage = 'car'
    },
    {
        raffleNumbers = 1250, -- 7.5% [500-1250]
        text = "You won ~b~Vigero~w~!",
        carModel = 'Vigero',
        moneyReward = 0,
        blackMoneyReward = 0,
        rewardImage = 'car'
    },
    {
        raffleNumbers = 2000, -- 7.5% [1250-2000]
        text = "You won ~b~Rocoto~w~!",
        carModel = 'rocoto',
        moneyReward = 0,
        blackMoneyReward = 0,
        rewardImage = 'car'
    },
    {
        raffleNumbers = 6000, -- 40% [2000 - 6000]
        text = "You won ~b~100.000$~w~!",
        carModel = nil,
        moneyReward = 100000,
        blackMoneyReward = 0,
        rewardImage = 'money'
    },
    {
        raffleNumbers = 10000, -- 40% [6000 - 10000]
        text = "You won ~b~100.000$ black money~w~!",
        carModel = nil,
        moneyReward = 0,
        blackMoneyReward = 150000,
        rewardImage = 'black_money'
    },
}