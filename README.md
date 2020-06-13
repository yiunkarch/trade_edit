# trade_edit
A minecraft datapack for tweaking villager and wandering trader trades

## Installation
Add this datapack to the world's datapacks directory. To start, run `function trade_edit:install`

## Usage
#### NBT Data
Trade data is stored in the [command storage](https://minecraft.gamepedia.com/Commands/data#Storage) `trade_edit`.

Villagers will have their trades in a nested list, where each sublist corresponds to each career level. See ["Villager profession"](https://minecraft.gamepedia.com/Villager#Data_values).
E.g. the list at index 0 is for adding to novices, the list at 1 for apprentice, etc.
```
├─ profession (list): e.g. "armorer" or "farmer"
│  └─ (list): for each level
|     └─ (pool compound with trade compound elements)
```
Wandering traders do not have levels, so a 1-deep list is used.
```
├─ wandering_trader (list)
|  └─ (pool compound with trade compound elements)
```

A pool compound
```
├─ rolls (int or range compound): number of distinct elements to pick
├─ total_weight (int): the sum of this pool's elements' weights
└─ pool (list): the elements in this pool
   └─ (compound)
      └─ weight (int): the likelihood of being selected
```
A range compound
```
├─ min (int): minimum, inclusive
└─ max (int): maximum, inclusive
```

Trade compound: same as found in [villager#Offers.Recipes](https://minecraft.gamepedia.com/Villager#Data_values).
May use a range compound for the `maxUses` tag. If the trade compound does not define `buy` and `sell`, it will not be added to a villager, but it can still be selected from the pool.

Item compound: same as [item#Item](https://minecraft.gamepedia.com/Item_(entity)#Data_values).
May use a range compound for the `Count` tag. An `enchantments` tag can be set to a pool of enchantment compounds to randomly enchant the item. This `enchantments` tag supports range compounds for levels

Example data:
```
{
	wandering_trader: [
		{
			rolls: 1,
			total_weight: 4,
			pool: [
				{
					weight: 1,
					maxUses: 3,
					buy: {
						id:"minecraft:emerald",
						Count: 1
					},
					sell: {
						id:"minecraft:player_head",
						Count: 1,
						tag: {
							SkullOwner:"Notch"
						}
					}
				},
				{
					weight: 3
				}
			]
		}
	],
	fletcher: [
		[],
		[],
		[
			{
				rolls: {
					min: 0,
					max: 2
				},
				total_weight: 1,
				pool: [
					{
						weight: 1,
						maxUses: {
							min: 1,
							max: 8
						},
						buy: {
							id: "minecraft:emerald",
							Count: {
								min: 1,
								max: 4
							}
						},
						sell: {
							id:"minecraft:spectral_arrow",
							Count: 2
						}
					}
				]
			},
			{
				rolls: 1,
				total_weight: 1,
				pool: [
					{
						weight: 1,
						buy: {
							id:"minecraft:fletching_table",
							Count: 1
						},
						sell: {
							id:"minecraft:emerald",
							Count: 12
						}
					}
				]
			}
		],
		[],
		[
			{
				rolls: 1,
				total_weight: 1,
				pool: [
					{
						weight: 1,
						buy: {
							id:"minecraft:emerald",
							Count: 64
						},
						buyB: {
							id:"minecraft:bow",
							Count: 1
						},
						sell: {
							id:"minecraft:bow",
							Count: 1,
							enchantments: {
								rolls: 2,
								total_weight: 4,
								pool: [
									{
										weight: 1,
										id:"minecraft:flame",
										lvl: 1
									},
									{
										weight: 1,
										id:"minecraft:infinity",
										lvl: 1
									},
									{

										weight: 2,
										id:"minecraft:unbreaking",
										lvl: {
											min: 1,
											max: 10
										}
									}
								]
							}
						}
					}
				]
			}
		]
	]
}
```
