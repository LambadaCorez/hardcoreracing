include("sv_tables.lua")

playermodels = {}

playermodels[0] = {model = "models/player/phoenix.mdl"}
playermodels[1] = {model = "models/player/police.mdl"}
playermodels[2] = {model = "models/player/gasmask.mdl"}
playermodels[3] = {model = "models/player/leet.mdl"}
playermodels[4] = {model = "models/player/dod_german.mdl"}

colors = {}

colors[0] = {color = (Vector (.4, .9, .2 ) )}
colors[1] = {color = (Vector (1.0, .4, .2 ))}
colors[2] = {color = (Vector (.4, .8, .6))}
colors[3] = {color = (Vector (.1, .3, .8 ) )}
colors[4] = {color = (Vector (.3, .9, .6 ))}
colors[5] = {color = (Vector (.9, .5, .2))}

local ply = FindMetaTable("Player")

local teams = {}

teams[0] = {name = "Blue", color = (Vector (.1, .1, .1 ) )}
teams[1] = {name = "Red", color = (Vector (1.0, .4, .2 ) )}

function ply:SetGamemodeTeam( n )
	if not teams[n] then return end
	
	self:SetTeam( n )
	self:Flashlight( false )
	self:AllowFlashlight( false )
	self:SetModel(playermodels[math.random(0,4)].model)
	self:SetPlayerColor(colors[math.random(0,5)].color)
		return true
	end
	
function ply:GiveGamemodeWeapons()
		
		local n = self:Team()
		
			self:StripWeapons()
	
	for k, wep in pairs(teams[n].weapons) do
			
			self:Give(wep)
	end
	if self:Alive() == true then
	for k, amm in pairs(teams[n].ammo) do
	
		self:Give(amm)
		end
end
end
