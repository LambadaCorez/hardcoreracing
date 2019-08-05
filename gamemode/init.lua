--RACE Init

-- Hey you! Yeah you! What's up! I tried my best to document everything inside of this init folder so you can get an understanding of the gamemode. If you ever want to change anything for your server,
-- (which I dont recommend, ruins the vanilla fun) you can look around in here. 

carsAllList = {}

carSpawns = {} --Car spawn locations for races.

ScoreboardFaces = {} --Entity where that directs where the scoreboard faces.

LeaderscreenFaces = {} --Entity that directs where the leaderscreen faces.

camLocations = {} --Table that shows locations of all cameras placed on the maps.

checkpoints = {} --Checkpoints. Pretty self explanatory!

scoreboards = {} --List of scoreboards and where they are.

cameraboards = {} --List of scoreboards and where they are.

mapRotation = {} --All the maps available for switching around maps.

garageCars = {} --All the cars that currently are in the lobby / garage area.

mapRotation[0] = {name="gmr_black_v2", path = "gmr_black_v2.bsp"}
mapRotation[1] = {name="gmr_figure8_v3", path = "gmr_figure8_v3.bsp"}
mapRotation[2] = {name="gmr_wariostadium", path = "gmr_wariostadium.bsp"}

--CARS LIST:

--Eclipse GSX
carsAllList[0] = {
car="models/tdmcars/mit_eclipsegsx.mdl", 
shrt = "pGSX",
cost=2000,
}
--Nissan Silvia
carsAllList[1] = {
car="models/tdmcars/nissan_silvias15.mdl",
shrt = "pSIL",
cost=5000,
}
--EVO 8
carsAllList[2] = {
car = "models/tdmcars/mitsu_evo8.mdl",
shrt = "pEV8",
cost = 5500,
}
--EVO X
carsAllList[3] = {
car = "models/tdmcars/mitsu_evox.mdl",
shrt = "pEVX",
cost = 6000,
}
--Skyline GTR
carsAllList[4] = {
car = "models/tdmcars/skyline_r34.mdl", 
shrt = "pR34",
cost = 8000,
}
--370Z
carsAllList[5] = {
car = "models/tdmcars/nis_370z.mdl",
shrt = "p370",
cost = 4000,
}
--Eclipse GT
carsAllList[6] = {
car = "models/tdmcars/mitsu_eclipgt.mdl",
shrt = "pMGT",
cost = 3000,
}
--SECRET CARS LIST :) DON'T SPOIL THIS FOR YOUSELF IF YOU HAVEN'T UNLOCKED THEM

--350Z Secret Car
carsAllList[7] = {
car = "models/tdmcars/350z.mdl",
shrt = "p350",
secret = true,
cost = 0,
}
--Nissan Leaf Secret Car
carsAllList[8] = {
car = "models/tdmcars/nis_leaf.mdl",
shrt = "pNSL",
secret = true,
cost = 0,
}
--Coltrall (Van) Secret Car
carsAllList[9] = {
car = "models/tdmcars/coltralliart.mdl",
shrt = "pMCL",
secret = true,
cost = 0,
}
--GTR Secret Car
carsAllList[10] = {
car = "models/tdmcars/nissan_gtr.mdl",
shrt = "pGTR",
secret = true,
cost = 0,
}
carsAllList[11] = { --Buggy Secret Car
car = "models/buggy.mdl",
shrt = "pBGY",
secret = true,
cost = 0,
}
--Secret Emergency Car
carsAllList[12] = {
car = "models/tdmcars/gtaiv_airtug.mdl",
shrt = "pSEC",
secret = true,
cost = 0,
}


SetGlobalInt("AllCheckpoints", 0)

resource.AddFile("music/export.mp3")

util.AddNetworkString("race_active")
util.AddNetworkString("race_timer")
util.AddNetworkString("laps")
util.AddNetworkString("lapsclient")
util.AddNetworkString("lapBool")
util.AddNetworkString("10secondBool")
util.AddNetworkString("10secondInt")
util.AddNetworkString("playersFinished")
util.AddNetworkString("openCustomMenu")
util.AddNetworkString("color")
util.AddNetworkString("buyCar")
util.AddNetworkString("buyCustoms")
util.AddNetworkString("buyFlames")
util.AddNetworkString("totalLapNum")
util.AddNetworkString("helpMenu")
util.AddNetworkString("changeBools")
util.AddNetworkString("boostActivate")
util.AddNetworkString("mapMenu")
util.AddNetworkString("inCarButNotRacing")
util.AddNetworkString("playMusic")
util.AddNetworkString("inRaceBool")

AddCSLuaFile("shared.lua")
AddCSLuaFile("player.lua")
AddCSLuaFile("cl_init.lua")
AddCSLuaFile("client/cl_hud.lua")
AddCSLuaFile("client/cl_music.lua")
AddCSLuaFile("client/cl_menu.lua")
AddCSLuaFile("client/cl_map.lua")

include("shared.lua")
include("player.lua")
include("server/sv_playerload.lua")
include("server/sv_rounds.lua")
include("entities/car/cardefault.lua")

SetGlobalBool("raceCountdown", false)
SetGlobalBool("raceActive", false)
local sc = 0
maxRacers = 0
local carSpawnIn = 0
raceactive = false
pregame = true
sc = 1




	net.Receive("buyCustoms", function( len, ply ) --Called when the player orders a new set of customization options.
		
		PrintTable(cars)

		ply.reserveMoney = tonumber(ply:GetNWInt("money"))
		
		ply.vehicleConfig = net.ReadString()
		
		if ply.reserveMoney < 1000 then
			
			ply:ChatPrint("You don't have enough money to buy these upgrades!")
			
		else
			
			local vehCheck = tonumber(ply:GetNWInt("pCar"))
			if vehCheck == 0 then
				ply:SetNWString("pGSX",ply.vehicleConfig)
			end
			
			if vehCheck == 1 then
				ply:SetNWString("pSIL",ply.vehicleConfig)
			end
			
			if vehCheck == 2 then
				ply:SetNWString("pEV8",ply.vehicleConfig) 
			end
			
			if vehCheck == 3 then
				ply:SetNWString("pEVX",ply.vehicleConfig)
			end
			
			if vehCheck == 4 then
				ply:SetNWString("pR34",ply.vehicleConfig)
			end
			
			if vehCheck == 5 then 
				ply:SetNWString("p370",ply.vehicleConfig)
			end
			
			if vehCheck == 6 then
				ply:SetNWString("pMGT",ply.vehicleConfig)
			end
			
			ply:SetNWInt("money", ply:GetNWInt("money") - 1000)
			
			ply:ChatPrint("Car customization set! Cost: $1000")
		end
		
		
		
		
		end)
	
	net.Receive("buyFlames", function( len, ply ) --Called when the player buys a new set of "flames".

		ply.reserveMoney = tonumber(ply:GetNWInt("money"))
		
		ply.flameColor = tonumber(net.ReadString()) - 1
		
		if ply.reserveMoney < 500 then
			
			ply:ChatPrint("You don't have enough money to buy these flames!")
			
		else
			
			if ply.flameColor == 0 then
				ply:SetNWString("boostColor1", "244 134 66 255")
				ply:SetNWString("boostColor2", "0 156 255 255")
			end
			
			if ply.flameColor == 1 then
				ply:SetNWString("boostColor1", "255 43 43 255")
				ply:SetNWString("boostColor2", "255 168 168 255")
			end
			
			if ply.flameColor == 2 then
				ply:SetNWString("boostColor1", "255 102 0 255")
				ply:SetNWString("boostColor2", "255 153 81 255")
			end
			
			if ply.flameColor == 3 then
				ply:SetNWString("boostColor1", "0 225 255 255")
				ply:SetNWString("boostColor2", "0 59 255 255")
			end
			
			if ply.flameColor == 4 then
				ply:SetNWString("boostColor1", "255 30 180 255")
				ply:SetNWString("boostColor2", "255 153 81 255")
			end
			
			if ply.flameColor == 5 then 
				ply:SetNWString("boostColor1", "127 0 255 255")
				ply:SetNWString("boostColor2", "255 122 215 255")
			end
			
			if ply.flameColor == 6 then
				ply:SetNWString("boostColor1", "0 255 12 255")
				ply:SetNWString("boostColor2", "109 255 230 255")
			end
			
			if ply.flameColor == 7 then
				ply:SetNWString("boostColor1", "175 175 175 255")
				ply:SetNWString("boostColor2", "79 79 79 255")
			end
			
			ply:SetNWInt("money", ply:GetNWInt("money") - 500)
			
			ply:ChatPrint("Flame color set! Cost: $500")
		end
		
		
		end)
	
	net.Receive("buyCar", function( len, ply ) --Called when the player buys a new car.

		ply.reserveMoney = tonumber(ply:GetNWInt("money"))
		
		ply.purchase = net.ReadInt(32)
		
		print("serverside: " .. ply.purchase)
		print("money: " .. ply.reserveMoney)

		PrintTable(carsAllList)
		if tobool(ply:GetNWBool("Regular" .. carsAllList[ply.purchase].shrt)) then
			ply:SetPData("pCar", ply.purchase)
			ply:SetNWInt("pCar", ply.purchase)
			ply:ChatPrint("Car successfully re-equipped!")
		else

			if ply.purhase == -1 then
				return 
			end

			if ply.reserveMoney < carsAllList[tonumber(ply.purchase)].cost then
				
				ply:ChatPrint("You don't have enough money for that car!")
				return
			end


			 
			if ply.reserveMoney >= carsAllList[ply.purchase].cost then
				
				ply.reserveMoney = ply.reserveMoney - carsAllList[ply.purchase].cost
				ply:SetPData("pCar", ply.purchase)
				ply:SetNWInt("pCar", ply.purchase)
				ply:SetPData("money", ply.reserveMoney)
				ply:SetNWInt("money", ply.reserveMoney)
				
				ply:SetNWBool("Regular" .. carsAllList[ply.purchase].shrt, true)
				ply:ChatPrint("Car successfully purchased and equipped! Cost: $" .. carsAllList[ply.purchase].cost)
				
			end

		end
		
		end)
	
	net.Receive( "color", function( len, ply ) --Called when the player orders a new color for their car.
		if tonumber(ply:GetNWInt("money")) >= 100 then
			ply:ChatPrint("OUCH OUCH OUCH")
			ply.colorR = net.ReadInt(32)
			ply.colorG = net.ReadInt(31)
			ply.colorB = net.ReadInt(30)
			ply:SetNWInt("colorR", ply.colorR)
			ply:SetNWInt("colorG", ply.colorG)
			ply:SetNWInt("colorB", ply.colorB)
			ply:SetNWString("color", "colorSet")
			ply:SetNWInt("money", ply:GetNWInt("money") - 100)
		else
			
			ply:ChatPrint("You don't have enough money to change your color! You need at least $100! Race around for some money!")
			
		end
		end)
	
	net.Receive( "lapBool", function( len, racer )
		if ( IsValid( racer ) and racer:IsPlayer() ) then
			lapBool = net.ReadBool(32)
		end
		end)

	net.Receive("boostActivate", function (len, ply) --Called everytime a player boosts.
		local boostColor = tostring(ply:GetNWString("boostColor1"))
		if tonumber(ply:GetNWInt("boostnum")) >= 1 then
			if ply:GetNWBool("inRace") then
				if !netbool then
					ply:SetNWInt("boostnum", tonumber(ply:GetNWInt("boostnum")) - 1 )
					if ply:InVehicle() then
						ply:SetNWInt("boostCounter", tonumber(ply:GetNWInt("boostCounter")) + 1) --Adds 1 onto the amount the player has boosted in this server.
						ply.boost = true
						net.Start("changeBools")
						net.WriteBool(ply.boost)
						net.Send(ply) --Send the player the information to let them know that they're boosting, and to activate the visual effects.
						ply:GetVehicle():SetMaxThrottle(5) --You can change this if you want, this adjusts how fast the boost makes you go.
						ply:GetVehicle():EmitSound("vehicles/tdmcars/miscsounds/turbo_blowoff3.wav", 85, 100, 1, CHAN_AUTO)
						ply:GetVehicle():EmitSound("nitrous")
						ply:SetFOV(ply:GetFOV() + 20, 1.5) --Widens the player's FoV.
			
						--These variables below are the sprite trails used to generate the "flames" in the back of the car while boosting.
						spritetrail = util.SpriteTrail( ply:GetVehicle(), 3, string.ToColor(ply:GetNWString("boostColor1")), false, 25, 15, .2, 1/(15+1)*0.5, "trails/plasma.vmt")
						spritetrail1 = util.SpriteTrail( ply:GetVehicle(), 3, string.ToColor(ply:GetNWString("boostColor2")), false, 25, 15, .1, 1/(15+1)*0.5, "trails/plasma.vmt")
						spritetrail2 = util.SpriteTrail( ply:GetVehicle(), 4, string.ToColor(ply:GetNWString("boostColor1")), false, 25, 15, .2, 1/(15+1)*0.5, "trails/plasma.vmt")
						spritetrail3 = util.SpriteTrail( ply:GetVehicle(), 4, string.ToColor(ply:GetNWString("boostColor2")), false, 25, 15, .1, 1/(15+1)*0.5, "trails/plasma.vmt")
					end
		
			timer.Simple(2, function() --Called after the car boosts for 2 seconds. Feel free to change the time value and make it shorter or longer.
				ply:SetFOV(ply:GetFOV() - 20, .5)
				
				if ply:InVehicle() then
					ply:GetVehicle():SetMaxThrottle(1)
					for k, v in pairs(ents.FindByClass("env_spritetrail")) do
						v:Remove()
					end
					ply:GetVehicle():StopSound("nitrous") --Stops the nitrous sound.
				end
				ply.boost = false
				net.Start("changeBools")
				net.WriteBool(ply.boost)
				net.Send(ply) --Sends the player that they are not boosting anymore, and they can get rid of the visual effects.
				end)
			
		end
	else
		if ply:InVehicle() then
			ply.boost = true
			net.Start("changeBools")
			net.WriteBool(ply.boost)
			net.Send(ply) --Send the player the information to let them know that they're boosting, and to activate the visual effects.
			ply:GetVehicle():SetMaxThrottle(5) --You can change this if you want, this adjusts how fast the boost makes you go.
			ply:GetVehicle():EmitSound("vehicles/tdmcars/miscsounds/turbo_blowoff3.wav", 85, 100, 1, CHAN_AUTO)
			ply:GetVehicle():EmitSound("nitrous")
			ply:SetFOV(ply:GetFOV() + 20, 1.5) --Widens the player's FoV.
			
						--These variables below are the sprite trails used to generate the "flames" in the back of the car while boosting.
			spritetrail = util.SpriteTrail( ply:GetVehicle(), 3, string.ToColor(ply:GetNWString("boostColor1")), false, 25, 15, .2, 1/(15+1)*0.5, "trails/plasma.vmt")
			spritetrail1 = util.SpriteTrail( ply:GetVehicle(), 3, string.ToColor(ply:GetNWString("boostColor2")), false, 25, 15, .1, 1/(15+1)*0.5, "trails/plasma.vmt")
			spritetrail2 = util.SpriteTrail( ply:GetVehicle(), 4, string.ToColor(ply:GetNWString("boostColor1")), false, 25, 15, .2, 1/(15+1)*0.5, "trails/plasma.vmt")
			spritetrail3 = util.SpriteTrail( ply:GetVehicle(), 4, string.ToColor(ply:GetNWString("boostColor2")), false, 25, 15, .1, 1/(15+1)*0.5, "trails/plasma.vmt")
			
			end

			timer.Simple(2, function() --Called after the car boosts for 2 seconds. Feel free to change the time value and make it shorter or longer.
				ply:SetFOV(ply:GetFOV() - 20, .5)
				
				if ply:InVehicle() then
					ply:GetVehicle():SetMaxThrottle(1)
					for k, v in pairs(ents.FindByClass("env_spritetrail")) do
						v:Remove()
					end
					ply:GetVehicle():StopSound("nitrous") --Stops the nitrous sound.
				end
				ply.boost = false
				net.Start("changeBools")
				net.WriteBool(ply.boost)
				net.Send(ply) --Sends the player that they are not boosting anymore, and they can get rid of the visual effects.
				end)

					end
	else
		
	end
	
	end)

concommand.Add( "race_customization", function(ply,cmd,args) --Customization menu, you can enter this command and it will open it up.
	
	net.Start("openCustomMenu")
	net.Send(ply)
	
	end)

concommand.Add("race_helpmenu", function(ply, cmd, args) --Allows the help menu to be pulled up.
	net.Start("helpMenu")
	net.Send(ply)
	end)

hook.Add( "PlayerSay", "PlayerSayExample", function( ply, text, team ) --Every time a player says something. Add some new commands if you want!
	
	if ( string.lower( text ) == "!help" ) then
		net.Start("helpMenu")
		net.Send(ply)
		return ""
	end

	if ( string.lower( text ) == "!rtv" ) then
		net.Start("mapMenu")
		net.Send(ply)
		return ""
	end
	
	if ( string.lower( text ) == "!spawn" ) then
		cspawn = carSpawns[1]:GetPos()
		chAngles = (checkpoints[2]:OBBCenter() - checkpoints[1]:OBBCenter()):Angle()
		SpawnCar1(ply,Color(255,255,255,255),tonumber(ply:GetNWInt("pCar")),cspawn, chAngles, 0)
		return ""
	end
	
	if ( string.lower( text ) == "!money" ) then
		ply:SetNWInt("money", tonumber(ply:GetNWInt("money")) + 10000)
		return ""
	end
	
	if ply:SteamID() == "STEAM_0:0:47799736" or ply:SteamID() == "STEAM_0:1:42974043" or pregame then
		if ( string.lower( text ) == "!start" ) then
			if (#checkpoints != 0) then
				RoundStart()
			else
				ply:ChatPrint("There are no checkpoints on this map! You cannot start or join the race.")
			end
			return ""
		end
	end
	if ply:SteamID() == "STEAM_0:0:47799736" or ply:SteamID() == "STEAM_0:1:42974043" then
		if ( string.lower( text ) == "!stop" ) then
			if (#checkpoints != 0) then
				EndRound("FORCE STOP: Nobody")
			end
			return ""
		end
		if ( string.lower( text ) == "!cleanup" ) then
			PrintMessage(HUD_PRINTTALK,"Game is now cleaning up!")
			game.CleanUpMap(false, {
				ents.FindByClass("Airboat")
				} )
			return ""
		end
	end
	end )

function GM:Initialize() --Called on startup
	
	timer.Create("waitingTime", 1, 1, function()
		SetGlobalInt("AllCheckpoints", #checkpoints)
		print("Checkpoints: " .. #checkpoints)
		print("Car Spawns: " .. #carSpawns)
		end)
	
end

function GM:PlayerInitialSpawn( ply ) --Performed when the player initally joins the server.
	net.Start("totalLapNum")
	net.WriteInt(#checkpoints, 32)
	net.Broadcast()
	PrintMessage( HUD_PRINTTALK, ply:Nick() .. " has spawned in!" )
	StatLoad( ply )
	ply:SetNWBool("inRace", false)
	net.Start("inRaceBool")
	net.WriteBool(ply:GetNWBool("inRace"))
	net.Send(ply)
	
end

function GM:PlayerSpawn( ply )	--Called everytime the player spawns.
	spawnServer( ply )

	
end

function GM:PlayerDisconnected( ply ) --Called on player disconnect.
	
	StatSave( ply )
	
end

function GM:PlayerDeath( victim, inflictor, attacker ) --Called on player death.

	victim:SendLua("RunConsoleCommand('stopsound')")


	local leftover = 6 --How long a player has before being forced to spawn. Seconds = amount of seconds you want + 1.

	timer.Create(victim:Nick(), 1, leftover, function()

		leftover = leftover - 1

		if victim:Alive() then
			timer.Remove(victim:Nick())
		end

		if leftover == 0 then --Forcibly spawn the user.
			victim:Spawn()
			timer.Remove(victim:Nick())
		end
		end)

	victim:SetNWBool("inRace", false)
			net.Start("inRaceBool")
			net.WriteBool(victim:GetNWBool("inRace"))
			net.Send(victim)

end

function GM:PlayerDeathSound() --Should the player death BEEP BEEP BEEEEEEEP sound be played?
	return true
end

function spawnServer(ply) --Called along with GM:PlayerSpawn()

	if ply:Alive() then
		ply:SetGamemodeTeam(1)
		
	end
	ply:AllowFlashlight( false )
	ply:SetNoCollideWithTeammates(true)
	ply:GodEnable()
	ply:Give("weapon_stunstick")
	ply:Give("weapon_bugbait")
	
end

function GM:ShowHelp( ply ) --F1
	if ply.killPossible == true then
		ply:Kill()
	end
end

function GM:ShowTeam( ply ) --F2
	net.Start("openCustomMenu")
	net.Send(ply)
end

function GM:ShowSpare1( ply ) --F3
	local car = ply:GetVehicle()
	if IsValid(car) then
		local vehicleclass = car:GetClass()
		if vehicleclass != "prop_vehicle_airboat" then
			timer.Create(ply:Nick(),2,1,function()
				local position = ply:GetVehicle():GetPos()
				local newposition
				newposition = position + (Vector(0,0,125))
				ply:GetVehicle():SetPos(newposition)
				end)
		end
	end
end

function GM:ShowSpare2( ply ) --F4

	if (#checkpoints != 0) then
		
		local chAngles;
		chAngles = (checkpoints[2]:OBBCenter() - checkpoints[1]:OBBCenter()):Angle()
		chAngles:RotateAroundAxis(chAngles:Up(), -90)
		cspawn = carSpawns[sc]:GetPos()
		cangle = carSpawns[sc]:GetAngles()

		local vehiCheck = tonumber(ply:GetNWInt("pCar"))

		local colorR = ply:GetNWInt("colorR")
		local colorG = ply:GetNWInt("colorG")
		local colorB = ply:GetNWInt("colorB")
		
		if vehiCheck == 0 then
			customVar = ply:GetNWString("pGSX") 
		end
		if vehiCheck == 1 then
			customVar = ply:GetNWString("pSIL")
		end
		if vehiCheck == 2 then
			customVar = ply:GetNWString("pEV8")
		end
		if vehiCheck == 3 then
			customVar = ply:GetNWString("pEVX")
		end
		if vehiCheck == 4 then
			customVar = ply:GetNWString("pR34")
		end 
		if vehiCheck == 5 then
			customVar = ply:GetNWString("p370")
		end
		if vehiCheck == 6 then
			customVar = ply:GetNWString("pMGT")
		end

		if customVar == nil then 
			customVar = 0
		end
		
		if (netbool) then
		--All of this angle logic is from GMRacer, so thatbackwards compatibility would work.
		local newAngle;
		
		if cspawn.Angles then
			newAngle = cspawn.Angles
			elseif chAngles then
				newAngle = chAngles;
			else
				newAngle = Angle(0, math.random(360), 0);
			end
			
			if game.GetMap() == "gmr_ldt_poopyloopy_v2" or game.GetMap() == "gmr_rainbow_roadv2" then
				
				newAngle = cangle
				
			end
			
			if carSpawnIn != table.Count(carSpawns) + 1 and ply.carSpawn == 0 and ply:Alive() then
				
				ply:SetNWBool("inRace", true)

				SpawnCar1(ply,Color(colorR,colorG,colorB,255),tonumber(ply:GetNWInt("pCar")),cspawn,newAngle,customVar, true)
				
				spawnRace(ply)
				
				ply:StripWeapons()
				
				carSpawnIn = carSpawnIn + 1
				
				ply.carSpawn = 1
				
				sc = sc + 1

				net.Start("playMusic")
				net.Send(ply)

				net.Start("inRaceBool")
				net.WriteBool(ply:GetNWBool("inRace"))
				net.Send(ply)

				

			end
		end

	else
		ply:ChatPrint("There are no checkpoints on this map! You cannot start or join the race.")
	end
end

function GM:CanExitVehicle( vehicle, ply ) -- You can only exit the vehicle if it is an airboat. You server owners can change this to whatever you want!

	local car = ply:GetVehicle()
	
	if IsValid(car) then
		
		local vehicleclass = car:GetClass()
		
		if tobool(ply:GetNWBool("inRace")) == true then
			return false
		end
		
		if tobool(ply:GetNWBool("inRace")) == false then
			
			return true
		end
	end	
end

function GM:Think() --Called every tick of the server.
	
	
	for k, v in pairs(player.GetAll()) do
		handBrake(v)
		if !raceactive then
			
			sc = 1 
			v.totalLaps = 1
			v.boolValue = false
			raceWinner = nil
			raceSecond = nil
			raceThird = nil
			v.racersChecked = 0
			racersFinished = 0
			v.stopCheck = 0
			racerSend = 0
			v.killPossible = true
			carSpawnIn = 0
			v.carSpawn = 0
			v.alreadyWinner = 0
			v.alreadyCrossed = 0
			v:SetNWInt("TotalCP", 0)
			v:SetNWInt("boostnum", 2)
		end
	end
	
	if raceactive then
		
		for k, v in pairs(team.GetPlayers( 0 )) do
			if v:GetNWInt("TotalCP") == #checkpoints then
				timer.Pause(v:Nick())
				if v.alreadyCrossed == 0 then
					racersFinished = racersFinished + 1
					v.alreadyCrossed = 1
				end
				if v.alreadyCrossed == 1 and v:Alive() == false then
					racersFinished = racersFinished - 1
					v.alreadyCrossed = 2
				end
				if v.stopCheck == 0 then
					v.KillPossible = false
					v:GetVehicle():Fire("TurnOff")	
					v:SetNWInt("money", v:GetNWInt("money") + 100)
					v.stopCheck = 1
				end
				if raceWinner == nil and v.alreadyWinner == 0 then
					raceWinner = v:Nick()
					v:SetNWInt("money", v:GetNWInt("money") + 400)
					v.alreadyWinner = 1
					v:SetNWInt("wins", v:GetNWInt("wins") + 1)
					elseif raceSecond == nil and raceWinner != nil and v.alreadyWinner == 0 then
						raceSecond = v:Nick()
						v:SetNWInt("money", v:GetNWInt("money") + 200)
						v.alreadyWinner = 1
						elseif raceThird == nil and raceWinner != nil and raceSecond != nil and v.alreadyWinner == 0 then
							raceThird = v:Nick()

							v:SetNWInt("money", v:GetNWInt("money") + 100)
							v.alreadyWinner = 1
						end
					end
				end
				
				if racersFinished == racersAlive and racerSend == 0 and !netbool and raceactive then
				if raceSecond == nil then
					raceSecond = "Nobody"
				end
				if raceThird == nil then
					raceThird = "Nobody"
				end
				if raceWinner != nil then
					EndRound(raceWinner .." won 1st, " .. raceSecond .." won 2nd, and " .. raceThird .. " won 3rd.")
					racerSend = 1
				end
			end
		end
		
	end

function GM:ShutDown() --Called on system / server shutdown.
	
	for k, v in pairs(player.GetAll()) do
		
		StatSave( v )
		
	end
	
end

function handBrake(v) --Allows cars to stay stopped until timer goes off.

	if !v:GetNWBool("inRace") then return end

	if netbool then
		v:GetVehicle():Fire("HandbrakeOn")
	else
		v:GetVehicle():Fire("HandbrakeOff")
	end

end




