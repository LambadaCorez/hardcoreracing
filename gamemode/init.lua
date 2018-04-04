--RACE Init

carSpawns = {}

checkpoints = {}

SetGlobalInt("AllCheckpoints", 0)

resource.AddFile("materials/layer/race.vmt")
resource.AddFile("music/export.mp3")
resource.AddWorkshop( 941042491 )

sound.Add( {
	name = "nitrous",
	channel = CHAN_AUTO,
	volume = .3,
	level = 80,
	pitch = { 95, 115, 100, 110},
	sound = "vehicles/tdmcars/miscsounds/turbo1.wav"
} )

local sc = 0
 
util.AddNetworkString("race_active")
util.AddNetworkString("race_timer")
util.AddNetworkString("laps")
util.AddNetworkString("lapsclient")
util.AddNetworkString("Lap1")
util.AddNetworkString("lapBool")
util.AddNetworkString("10secondBool")
util.AddNetworkString("10secondInt")
util.AddNetworkString("playersFinished")
util.AddNetworkString("openCustomMenu")
util.AddNetworkString("color")
util.AddNetworkString("buyCar")
util.AddNetworkString("buyCustoms")
util.AddNetworkString("totalLapNum")
util.AddNetworkString("helpMenu")
util.AddNetworkString("changeBools")
util.AddNetworkString("boostActivate")

AddCSLuaFile("shared.lua")
AddCSLuaFile("cl_init.lua")
AddCSLuaFile("player.lua")
AddCSLuaFile("logo.lua")
AddCSLuaFile("cl_music.lua")
AddCSLuaFile("customizationmenu.lua")

include("shared.lua")
include("player.lua")
include("round.lua")
include("playerload.lua")

include("entities/car/cardefault.lua")

maxRacers = 0

cars = {}

cars[0] = {car = "models/tdmcars/mit_eclipsegsx.mdl"}
cars[1] = {car = "models/tdmcars/nissan_silvias15.mdl"}
cars[2] = {car = "models/tdmcars/mitsu_evo8.mdl"}
cars[3] = {car = "models/tdmcars/mitsu_evox.mdl"}
cars[4] = {car = "models/tdmcars/skyline_r34.mdl"}
cars[5] = {car = "models/tdmcars/nis_370z.mdl"}
cars[6] = {car = "models/tdmcars/mitsu_eclipgt.mdl"}


carmoney = {}

carmoney[0] = {cost = 2000}
carmoney[1] = {cost = 5000}
carmoney[2] = {cost = 5500}
carmoney[3] = {cost = 6000}
carmoney[4] = {cost = 8000}
carmoney[5] = {cost = 4000}
carmoney[6] = {cost = 3000}


keyvalues = {}

keyvalues[0]={keyvalue="scripts/vehicles/tdmcars/mit_eclipsegsx.txt"}
keyvalues[1]={keyvalue="scripts/vehicles/tdmcars/nissilvs15.txt"}
keyvalues[2]={keyvalue="scripts/vehicles/tdmcars/mitsu_evo8.txt"}
keyvalues[3]={keyvalue="scripts/vehicles/tdmcars/mitsu_evox.txt"}
keyvalues[4]={keyvalue="scripts/vehicles/tdmcars/skyline_r34.txt"}		
keyvalues[5]={keyvalue="scripts/vehicles/tdmcars/370z.txt"}
keyvalues[6]={keyvalue="scripts/vehicles/tdmcars/mitsu_eclipgt.txt"}		

local carSpawnIn = 0
raceactive = false
pregame = true
sc = 1

	net.Receive("buyCustoms", function( len, ply )
		
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
	
	net.Receive("buyFlames", function( len, ply )
		flamechoices:AddChoice("Default", 0, false)
	flamechoices:AddChoice("Super Red", 1, false)
	flamechoices:AddChoice("Orange Nuke", 2, false)
	flamechoices:AddChoice("Blue Bunsen Burner", 3, false)
	flamechoices:AddChoice("Hot Pink", 4, false)
	flamechoices:AddChoice("4000 Degrees Kelvin Purple", 5, false)
	flamechoices:AddChoice("Spillway Green", 6, false)
	flamechoices:AddChoice("Dull Grey", 6, false)
	
	
	ply.reserveMoney = tonumber(ply:GetNWInt("money"))
		
		ply.flameColor = net.ReadString()
		
		if ply.reserveMoney < 500 then
		
		ply:ChatPrint("You don't have enough money to buy these flames!")
		
		else
		
		local vehCheck = tonumber(ply:GetNWInt("pCar"))
		
		if vehCheck == 0 then
		ply:SetNWString("boostColor1", "244 134 66 255")
		ply:SetNWString("boostColor2", "0 156 255 255")
		end
		
		if vehCheck == 1 then
		ply:SetNWString("boostColor1", "255 43 43 255")
		ply:SetNWString("boostColor2", "255 168 168 255")
		end
		
		if vehCheck == 2 then
		ply:SetNWString("boostColor1", "255 102 0 255")
		ply:SetNWString("boostColor2", "255 153 81 255")
		end
		
		if vehCheck == 3 then
		ply:SetNWString("boostColor1", "0 225 255 255")
		ply:SetNWString("boostColor2", "0 59 255 255")
		end
		
		if vehCheck == 4 then
		ply:SetNWString("boostColor1", "255 30 180 255")
		ply:SetNWString("boostColor2", "255 153 81 255")
		end
		
		if vehCheck == 5 then 
		ply:SetNWString("boostColor1", "255, 102, 0 255")
		ply:SetNWString("boostColor2", "255 153 81 255")
		end
		
		if vehCheck == 6 then
		ply:SetNWString("boostColor1", "255, 102, 0 255")
		ply:SetNWString("boostColor2", "255 153 81 255")
		end
		
		ply:SetNWInt("money", ply:GetNWInt("money") - 1000)
		
		ply:ChatPrint("Car customization set! Cost: $1000")
		end
	
	
	end)
	
	net.Receive("buyCar", function( len, ply )
	
		ply.reserveMoney = tonumber(ply:GetNWInt("money"))
		
		ply.purchase = net.ReadInt(32)
		
		if ply.reserveMoney < carmoney[ply.purchase].cost then
		
			ply:ChatPrint("You don't have enough money for that car!")
		
		end
		
		if ply.reserveMoney >= carmoney[ply.purchase].cost then
			
			ply.reserveMoney = ply.reserveMoney - carmoney[ply.purchase].cost
			ply:SetPData("pCar", ply.purchase)
			ply:SetNWInt("pCar", ply.purchase)
			ply:SetPData("money", ply.reserveMoney)
			ply:SetNWInt("money", ply.reserveMoney)
			
			ply:ChatPrint("Car successfully purchased and equipped! Cost: $" .. carmoney[ply.purchase].cost)
		
		end
		
		
	
	
	end)
	
	net.Receive( "color", function( len, ply )
		
		if tonumber(ply:GetNWInt("money")) >= 100 then
			ply:ChatPrint("Car color switched! Cost: $100")
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
	
	net.Receive("10secondBool", function( len, ply )
		tenSeconds = net.ReadBool(32)
	end)

	net.Receive( "race_active", function( len )
	raceactive = net.ReadBool()
	end)

	net.Receive("boostActivate", function (len, ply)
		 local boostColor = tostring(ply:GetNWString("boostColor1"))
		if tonumber(ply:GetNWInt("boostnum")) >= 1 then
		if !netbool then
		ply:SetNWInt("boostnum", tonumber(ply:GetNWInt("boostnum")) - 1 )
		if ply:InVehicle() then
		ply.boost = true
		net.Start("changeBools")
		net.WriteBool(ply.boost)
		net.Send(ply) 
		print(ply:GetNWString("boostColor1"))
		ply:GetVehicle():SetMaxThrottle(10) 
		ply:GetVehicle():EmitSound("vehicles/tdmcars/miscsounds/turbo_blowoff3.wav", 85, 100, 1, CHAN_AUTO)
		ply:GetVehicle():EmitSound("nitrous") 
		
		print("String: " .. boostColor) 
		
		PrintTable(string.ToColor(boostColor))
		
		spritetrail = util.SpriteTrail( ply:GetVehicle(), 3, string.ToColor(ply:GetNWString("boostColor1")), false, 25, 15, .2, 1/(15+1)*0.5, "trails/plasma.vmt")
		spritetrail1 = util.SpriteTrail( ply:GetVehicle(), 3, string.ToColor(ply:GetNWString("boostColor2")), false, 25, 15, .1, 1/(15+1)*0.5, "trails/plasma.vmt")
		spritetrail2 = util.SpriteTrail( ply:GetVehicle(), 4, string.ToColor(ply:GetNWString("boostColor1")), false, 25, 15, .2, 1/(15+1)*0.5, "trails/plasma.vmt")
		spritetrail3 = util.SpriteTrail( ply:GetVehicle(), 4, string.ToColor(ply:GetNWString("boostColor2")), false, 25, 15, .1, 1/(15+1)*0.5, "trails/plasma.vmt")
		end
		timer.Simple(2, function()
			if ply:InVehicle() then
				ply:GetVehicle():SetMaxThrottle(1)
				for k, v in pairs(ents.FindByClass("env_spritetrail")) do
					v:Remove()
				end
				ply:GetVehicle():StopSound("nitrous")
			end
				ply.boost = false
				net.Start("changeBools")
				net.WriteBool(ply.boost)
				net.Send(ply)
		end)
		end
		else
			
			end
		
	end)
	
	
	
function GM:OnPlayerChat( ply, text )

chat.PlaySound()

end

concommand.Add( "race_customization", function(ply,cmd,args)
	
	net.Start("openCustomMenu")
	net.Send(ply)
	
end)
	
concommand.Add("race_helpmenu", function(ply, cmd, args)

	net.Start("helpMenu")
	net.Send(ply)
	
end)
	
hook.Add( "PlayerSay", "PlayerSayExample", function( ply, text, team )
		 
		if ( string.lower( text ) == "!help" ) then
				net.Start("helpMenu")
				net.Send(ply)
			return ""
			end
			
		if ( string.lower( text ) == "!spawn" ) then
				cspawn = carSpawns[1]:GetPos()
				newAngle = Angle(0, math.random(360), 0);
				SpawnCar1(ply,Color(255,255,255,255),tonumber(ply:GetNWInt("pCar")),cspawn, newAngle, 0)
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
	
	function GM:Initialize()
	
	timer.Create("waitingTime", 1, 1, function()
		SetGlobalInt("AllCheckpoints", #checkpoints)
		print("Checkpoints: " .. #checkpoints)
		print("Car Spawns: " .. #carSpawns)
	end)
	
	end

	function GM:PlayerInitialSpawn( ply )
		net.Start("totalLapNum")
		net.WriteInt(#checkpoints, 32)
		net.Broadcast()
		PrintMessage( HUD_PRINTTALK, ply:Nick() .. " has spawned in!" )
		StatLoad( ply )
		
	end
	
	function GM:PlayerDisconnected( ply )
	
		StatSave( ply )
	
	end
	
	function GM:ShutDown()
	
		for k, v in pairs(player.GetAll()) do
		
		StatSave( v )
		
		end
	
	end
	
function GM:PlayerSpawn( ply )	
		print(tostring(ply:GetNWString("boostColor1")))
		print(tostring(ply:GetNWString("boostColor2")))
		
		ply:SetNWInt("boostnum", 2)
		spawnServer( ply )
		ply:AllowFlashlight( false )
		ply:SetNoCollideWithTeammates(true)
		ply:GodEnable()
		ply:Give("weapon_stunstick")
		ply:Give("weapon_bugbait")

end

function GM:PlayerDeath( victim, inflictor, attacker )

victim:SendLua("RunConsoleCommand('stopsound')")


local leftover = 6

timer.Create(victim:Nick(), 1, leftover, function()

leftover = leftover - 1

if victim:Alive() then

timer.Remove(victim:Nick())

end

if leftover == 0 then

victim:Spawn()
timer.Remove(victim:Nick())
end
end)

end
	
function GM:PlayerDeathSound()
	return true
end

function spawnServer(ply)

	if ply:Alive() then
		ply:SetGamemodeTeam(1)
		
	end
end

function GM:ShowHelp( ply )
	if ply.killPossible == true then
	ply:Kill()
	end
end

function GM:ShowTeam( ply )
net.Start("openCustomMenu")
net.Send(ply)
end

function GM:ShowSpare1( ply )
	
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
	
function GM:ShowSpare2( ply )

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
		
		SpawnCar1(ply,Color(colorR,colorG,colorB,255),tonumber(ply:GetNWInt("pCar")),cspawn,newAngle,customVar)
		
		spawnRace(ply)
		
		ply:StripWeapons()
		
		carSpawnIn = carSpawnIn + 1
		
		ply.carSpawn = 1
		
		sc = sc + 1

		end
	end

else
	ply:ChatPrint("There are no checkpoints on this map! You cannot start or join the race.")
end
end

function GM:CanExitVehicle( vehicle, play )

local car = play:GetVehicle()
	
if IsValid(car) then
	
local vehicleclass = car:GetClass()
	
		if vehicleclass != "prop_vehicle_airboat" then
			return false
		else
			return true
		end	
end	
end
  
function GM:Think()
	
		handBrake()
			for k, v in pairs(player.GetAll()) do
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
					
				end
			end
	
	if raceactive then
		
		for k, v in pairs(team.GetPlayers( 0 )) do
		if v:GetNWInt("TotalCP") == #checkpoints then
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


function handBrake()
    for k,v in pairs(ents.FindByClass("prop_vehicle_jeep_old")) do
        if netbool then
		v:Fire("HandbrakeOn")
		else
		v:Fire("HandbrakeOff")
		end
    end
end




