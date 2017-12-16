--init

carSpawns = {}

checkpoints = {}

SetGlobalInt("AllCheckpoints", 0)

resource.AddFile("materials/layer/race.vmt")
resource.AddFile("music/export.mp3")
resource.AddWorkshop( 941042491 )

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

AddCSLuaFile("shared.lua")
AddCSLuaFile("cl_init.lua")
AddCSLuaFile("player.lua")
AddCSLuaFile("logo.lua")
AddCSLuaFile("cl_music.lua")
AddCSLuaFile("customizationmenu.lua")

include("shared.lua")
include("player.lua")
include("round.lua")
include("variables.lua")
include("playerload.lua")

include("points/deathzones/deathzone1.lua")
include("points/deathzones/deathzone2.lua")
include("points/deathzones/deathzone3.lua")
include("points/deathzones/deathzone4.lua")
include("points/deathzones/spectators/dzspec1.lua")
include("points/deathzones/spectators/dzspec2.lua")
include("points/deathzones/spectators/dzspec3.lua")
include("points/removegrenades.lua")

include("entities/props/fence.lua")
include("entities/props/fence2.lua")

include("entities/props/bombies.lua")

include("entities/buggies/buggy1.lua")
include("entities/buggies/buggy2.lua")
include("entities/buggies/buggy3.lua")
include("entities/buggies/buggy4.lua")
include("entities/buggies/buggy5.lua")
include("entities/buggies/buggy6.lua")
include("entities/buggies/buggy7.lua")
include("entities/buggies/buggy8.lua")
include("entities/buggies/buggy9.lua")
include("entities/buggies/buggy10.lua")
include("entities/buggies/buggy11.lua")
include("entities/buggies/buggy12.lua")
include("entities/buggies/buggy13.lua")
include("entities/buggies/buggy14.lua")
include("entities/buggies/buggy15.lua")
include("entities/buggies/buggy16.lua")

include("entities/props/demoderby/demodurbyfence1.lua")
include("entities/props/demoderby/demodurbyfence2.lua")
include("entities/props/demoderby/demodurbyfence3.lua")
include("entities/props/demoderby/demodurbyfence4.lua")
include("entities/props/demoderby/demodurbyfence5.lua")
include("entities/props/demoderby/demodurbyfence6.lua")

include("entities/demodurby/airboat1.lua")
include("entities/demodurby/airboat2.lua")
include("entities/demodurby/airboat3.lua")
include("entities/demodurby/airboat4.lua")
include("entities/demodurby/airboat5.lua")
include("entities/demodurby/airboat6.lua")
include("entities/props/jump/barrier.lua")

playerspawn = {}

playerspawn[0] = Vector(-421.229248, 11668.021484, 576.031250)
playerspawn[1] = Vector(103.054161, 11593.605469, 576.031250)
playerspawn[2] = Vector(562.832947, 11702.412109, 576.031250)
playerspawn[3] = Vector(-358.436066, 11719.745117, 832.031250)
playerspawn[4] = Vector(-428.690125, 11924.440430, 832.031250)
playerspawn[5] = Vector(603.888000, 11864.520508, 832.031250)
playerspawn[6] = Vector( 1036.088379, 11700.810547, 832.031250)
playerspawn[7] = Vector(1386.621826, 11910.675781, 832.031250)	
playerspawn[8] = Vector(1711.957031, 11714.308594, 832.031250)


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

if IsValid(carSpawns[1]) then

carspawn = carSpawns[1]:GetPos()

end
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
		print(tonumber(ply:GetNWInt("pCar")))
		if vehCheck == 0 then
		ply:SetNWString("pGSX",ply.vehicleConfig)
		print("saved to gsx")
		end
		
		if vehCheck == 1 then
		ply:SetNWString("pSIL",ply.vehicleConfig)
		print("saved to silvia")
		end
		
		if vehCheck == 2 then
		ply:SetNWString("pEV8",ply.vehicleConfig) 
		print("saved to EV8")
		end
		
		if vehCheck == 3 then
		ply:SetNWString("pEVX",ply.vehicleConfig)
		print("saved to evx")
		end
		
		if vehCheck == 4 then
		ply:SetNWString("pR34",ply.vehicleConfig)
		print("saved to r34" .. ply.vehicleConfig)
		end
		
		if vehCheck == 5 then 
		ply:SetNWString("p370",ply.vehicleConfig)
		print("saved to 370zx")
		end
		
		if vehCheck == 6 then
		ply:SetNWString("pMGT",ply.vehicleConfig)
		print("saved to mgt")
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
		
			ply:ChatPrint("You don't have enough money to change your color! You need at least $100!")
		
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

function GM:OnPlayerChat( ply, text )

chat.PlaySound()

end

	
	
	hook.Add( "PlayerSay", "PlayerSayExample", function( ply, text, team )
		if ply:SteamID() == "STEAM_0:0:47799736" or ply:SteamID() == "STEAM_0:1:42974043" or pregame then
			if ( string.lower( text ) == "!start" ) then
				RoundStart()
			end
			end
		if ply:SteamID() == "STEAM_0:0:47799736" or ply:SteamID() == "STEAM_0:1:42974043" then
			if ( string.lower( text ) == "!stop" ) then
				EndRound("FORCE STOP: Nobody")
			end
			if ( string.lower( text ) == "!cleanup" ) then
				game.CleanUpMap(false, {
				ents.FindByClass("Airboat")
				} )
			end
		if ( string.lower( text ) == "!money" ) then
				ply:SetNWInt("money", ply:GetNWInt("money") + 10000)
			end
		end
		
		
end )
	
concommand.Add("r_spawn", function()

	SpawnBombies(Vector(-13504.298828, -12083.591797, 530.031250))
	SpawnBombies(Vector(14006.583984, -5438.270508, 530.031250))
	SpawnBombies(Vector(169.519257, 2663.214600, 1310.031250))
 
end)
	
	timer.Create("deathzones", .1, 0, function()
			deathZone1()
			deathZone2()
			deathZone3()
			deathZone4()
			deathZoneSpec1()
			deathZoneSpec2()
			deathZoneSpec3()
	end)
	
	function GM:Initialize()
	
	timer.Create("waitingTime", 1, 1, function()
		SetGlobalInt("AllCheckpoints", #checkpoints)
		SpawnFence()
		SpawnFence2()
		SpawnDemoDurbyFence1()
		SpawnDemoDurbyFence2()
		SpawnDemoDurbyFence3()
		SpawnDemoDurbyFence4()
		SpawnDemoDurbyFence5()
		SpawnDemoDurbyFence6()
		SpawnBarrier(Vector(-9414.754883, -14216.900391, -965.301270))
		SpawnBarrier(Vector(-9658.039063, -14052.523438, -965.863647))
		SpawnBarrier(Vector(-9819.720703, -13939.192383, -965.509827))
		SpawnBarrier(Vector(-9985.365234, -13823.000000, -965.358032))
		SpawnBarrier(Vector(-10116.995117, -13730.319336, -965.886536))
		SpawnBarrier(Vector(-10241.412109, -13662.445313, -965.388611))
		SpawnBarrier(Vector(-10375.762695, -13570.988281, -965.509033))
		SpawnAirboat1()
		SpawnAirboat2()
		SpawnAirboat3()
		SpawnAirboat4()
		SpawnAirboat5()
		SpawnAirboat6()
		
		
	
	end)
	
	end

	function GM:PlayerInitialSpawn( ply )
		net.Start("totalLapNum")
		net.WriteInt(#checkpoints, 32)
		net.Broadcast()
		PrintMessage( HUD_PRINTTALK, ply:Nick() .. " has spawned in!" )
		PrintMessage( HUD_PRINTTALK,"Car Spawns:" .. #carSpawns )
		PrintMessage( HUD_PRINTTALK,"Checkpoints:" .. #checkpoints )
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
		
		
	
		if carSpawnIn != table.Count(carSpawns) + 1 and ply.carSpawn == 0 and ply:Alive() then
		
		SpawnCar1(ply,Color(colorR,colorG,colorB,255),tonumber(ply:GetNWInt("pCar")),cspawn,cangle,customVar)
		
		spawnRace(ply)
		
		ply:StripWeapons()
		
		carSpawnIn = carSpawnIn + 1
		
		ply.carSpawn = 1
		
		sc = sc + 1

		end
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
	getRidOfGrenades()
	
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
		if v.stopCheck == 0 then
			v:GetVehicle():Fire("TurnOff")	
			v:SetNWInt("money", v:GetNWInt("money") + 100)
			v.stopCheck = 1
			end
			if raceWinner == nil and v.alreadyWinner == 0 then
			raceWinner = v:Nick()
			print(raceWinner)
			print("racers finished: " .. racersFinished)
			print("racers total: " .. racersAlive)
			print("racer send: " .. racerSend)
			v:SetNWInt("money", v:GetNWInt("money") + 400)
			v.alreadyWinner = 1 
			elseif raceSecond == nil and raceWinner != nil and v.alreadyWinner == 0 then
			raceSecond = v:Nick()
			print(raceSecond)
			print("racers finished: " .. racersFinished)
			print("racers total: " .. racersAlive)
			print("racer send: " .. racerSend)
			v:SetNWInt("money", v:GetNWInt("money") + 200)
			v.alreadyWinner = 1
			elseif raceThird == nil and raceWinner != nil and raceSecond != nil and v.alreadyWinner == 0 then
			raceThird = v:Nick()
			print(raceThird)
			print("racers finished: " .. racersFinished)
			print("racers total: " .. racersAlive)
			print("racer send: " .. racerSend)
			v:SetNWInt("money", v:GetNWInt("money") + 100)
			v.alreadyWinner = 1
			end
		end
	end
		
		if racersFinished == racersAlive and racerSend == 0 then
			if racerSecond == nil then
			racerSecond = "Nobody"
			end
			if raceThird == nil then
			raceThird = "Nobody"
			end
			EndRound(raceWinner .." won 1st, " .. raceSecond .." won 2nd, and " .. raceThird .. " won 3rd.")
			racerSend = 1
		end
	end
	
end

function GM:CanPlayerSuicide( play )

if play.racersChecked == 1 then 

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




