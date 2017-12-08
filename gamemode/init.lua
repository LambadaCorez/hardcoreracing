--init

resource.AddFile("materials/layer/race.vmt")
resource.AddFile("music/export.mp3")
resource.AddWorkshop( 941042491 )

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

playerracespawn = {}

playerracespawn[0] = Vector(-900.486938, 12316.545898, 64.031250)
playerracespawn[1] = Vector(-400.486938, 12316.545898, 64.031250)
playerracespawn[2] = Vector(100.486938, 12316.545898, 64.031250)
playerracespawn[3] = Vector(600.486938, 12316.545898, 64.031250)
playerracespawn[4] = Vector(600.486938, 12316.545898, 64.031250)
playerracespawn[5] = Vector(-1095.211792, 12495.215820, 64.031250)
playerracespawn[6] = Vector(-594.711609, 12531.541016, 64.031250)
playerracespawn[7] = Vector(-94.711609, 12531.541016, 64.031250)	
playerracespawn[8] = Vector(406.711609, 12531.541016, 64.031250)	
playerracespawn[9] = Vector(-700.731750, 11994.644531, 64.031250)
playerracespawn[10] = Vector(-500.731750, 11994.644531, 64.031250)
playerracespawn[11] = Vector(-500.731750, 11994.644531, 64.031250)


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

local racecarlocation = 0

raceactive = false

	net.Receive("buyCustoms", function( len, ply )
		
		ply.vehicleConfig = net.ReadString()
		
		local vehCheck = tonumber(ply:GetNWInt("pCar"))
		print(tonumber(ply:GetNWInt("pCar")))
		if ply:GetNWInt("pCar") == 0 then
		ply:SetPData("pGSX", ply.vehicleConfig)
		ply:SetNWString("pGSX", ply.vehicleConfig)
		print("saved to gsx")
		end
		
		if ply:GetNWInt("pCar") == 1 then
		ply:SetPData("pSIL", ply.vehicleConfig)
		ply:SetNWString("pSIL", ply.vehicleConfig)
		print("saved to silvia")
		end
		
		if ply:GetNWInt("pCar") == 2 then
		ply:SetPData("pEV8", ply.vehicleConfig)
		ply:SetNWString("pEV8", ply.vehicleConfig) 
		print("saved to EV8")
		end
		
		if ply:GetNWInt("pCar") == 3 then
		ply:SetPData("pEVX", ply.vehicleConfig)
		ply:SetNWString("pEVX", ply.vehicleConfig)
		print("saved to evx")
		end
		
		if ply:GetNWInt("pCar") == 4 then
		ply:SetPData("pR34", ply.vehicleConfig)
		ply:SetNWString("pR34", ply.vehicleConfig)
		print("saved to r34")
		end
		
		if ply:GetNWInt("pCar") == 5 then 
		ply:SetPData("p370", ply.vehicleConfig)
		ply:SetNWString("p370", ply.vehicleConfig)
		print("saved to 370zx")
		end
		
		if ply:GetNWInt("pCar") == 6 then
		ply:SetPData("pMGT", ply.vehicleConfig)
		ply:SetNWString("pMGT", ply.vehicleConfig)
		print("saved to errr")
		end
		
		print(ply:Nick() .. " ERRR " .. ply.vehicleConfig)
		
		ply:ChatPrint("Car customization set!")
		
		
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
			
			ply:ChatPrint("Car successfully purchased and equipped!")
		
		end
		
		
	
	
	end)
	
	net.Receive( "color", function( len, ply )
		
		if tonumber(ply:GetNWInt("money")) >= 100 then
			ply:ChatPrint("Car color switched! Cost: $100")
			ply.vehicleColor = net.ReadColor()
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



	
	
	hook.Add( "PlayerSay", "PlayerSayExample", function( ply, text, team )
		if ply:SteamID() == "STEAM_0:0:47799736" or ply:SteamID() == "STEAM_0:1:42974043" then
			if ( string.lower( text ) == "!start" ) then
				RoundStart()
			end
			
			if ( string.lower( text ) == "!stop" ) then
				EndRound("FORCE STOP: Nobody")
			end
			if ( string.lower( text ) == "!cleanup" ) then
				game.CleanUpMap(false, {
				ents.FindByClass("Airboat")
				} )
			end
		end
		
		if ( string.lower( text ) == "!money" ) then
				ply:SetNWInt("money", ply:GetNWInt("money") + 10000)
			end
end )
	
concommand.Add("r_spawn", function()

	SpawnBombies(Vector(-13504.298828, -12083.591797, 530.031250))
 
end)
	
	timer.Create("deathzones", .1, 0, function()
			deathZone1()
			deathZone2()
			deathZone3()
	end)
	
	function GM:Initialize()
	
	timer.Create("waitingTime", 1, 1, function()
		SpawnFence()
		SpawnFence2()
		SpawnDemoDurbyFence1()
		SpawnDemoDurbyFence2()
		SpawnDemoDurbyFence3()
		SpawnDemoDurbyFence4()
		SpawnDemoDurbyFence5()
		SpawnDemoDurbyFence6()
		SpawnBarrier(Vector(-9414.754883, -14216.900391, -970.301270))
		SpawnBarrier(Vector(-9658.039063, -14052.523438, -959.863647))
		SpawnBarrier(Vector(-9819.720703, -13939.192383, -958.509827))
		SpawnBarrier(Vector(-9985.365234, -13823.000000, -958.358032))
		SpawnBarrier(Vector(-10116.995117, -13730.319336, -958.886536))
		SpawnBarrier(Vector(-10241.412109, -13662.445313, -959.388611))
		SpawnBarrier(Vector(-10375.762695, -13570.988281, -959.509033))
		SpawnBarrier(Vector(-10509.308594, -13481.958984, -959.572388))
		SpawnBarrier(Vector(-10632.351563, -13400.067383, -959.652649))
		SpawnAirboat1()
		SpawnAirboat2()
		SpawnAirboat3()
		SpawnAirboat4()
		SpawnAirboat5()
		SpawnAirboat6()
		
		
	
	end)
	
	end

	function GM:PlayerInitialSpawn( ply )
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
		
		spawnServer(ply)
		ply:AllowFlashlight( false )
		ply:SetNoCollideWithTeammates(true)
		ply:GodEnable()

end

function GM:PlayerDeath( victim, inflictor, attacker )

victim:SendLua("RunConsoleCommand('stopsound')")

end
	
function GM:PlayerDeathSound()
	return true
end
	
function GM:PlayerSetHandsModel( ply, ent )

	local simplemodel = player_manager.TranslateToPlayerModelName( ply:GetModel() )
	local info = player_manager.TranslatePlayerHands( simplemodel )
	if ( info ) then
		ent:SetModel( info.model )
		ent:SetSkin( info.skin )
		ent:SetBodyGroups( info.body )
	end
end

function spawnServer(ply)

	if ply:Alive() then
		ply:SetGamemodeTeam(1)
		ply:SetPos(playerspawn[math.random(0,8)])
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
	if racecarlocation == nil then
		racecarlocation = 0
	end
	
if ply:GetNWInt("pCar") == 0 then
	customVar = ply:GetNWString("pGSX")
end

if ply:GetNWInt("pCar") == 1 then
	customVar = ply:GetNWString("pSIL")
end
if ply:GetNWInt("pCar") == 2 then
	customVar = ply:GetNWString("pEV8")
end
if ply:GetNWInt("pCar") == 3 then
	customVar = ply:GetNWString("pEVX")
end
if ply:GetNWInt("pCar") == 4 then
	customVar = ply:GetNWString("pR34")
end
if ply:GetNWInt("pCar") == 5 then
	customVar = ply:GetNWString("p370")
end
if ply:GetNWInt("pCar") == 6 then
	customVar = ply:GetNWString("pMGT")
end
	print(customVar)
	
	if (netbool) then
		if racercarlocation != 16 and ply.carSpawn == 0 then
		
		SpawnCar1(ply,ply.vehicleColor,tonumber(ply:GetNWInt("pCar")),racecarspawns[racecarlocation], customVar)
		
		spawnRace( ply, ply.vehicleNumber )
		
		ply.vehicleNumber = racecarlocation
		
		racecarlocation = racecarlocation + 1
		
		ply.carSpawn = 1
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
	checkPoint1()
	checkPoint2()
	checkPoint3()
	getRidOfGrenades()
	
	for k, v in pairs(player.GetAll()) do
		if !raceactive then
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
			racecarlocation = 0
			v.carSpawn = 0
			v.alreadyWinner = 0
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

function checkPoint1()

	for k, v in pairs(ents.FindInBox( Vector(-1024.419922, 12541.967773, -10.330276), Vector(-1086.406616, 13375.701172, 373.506012) ) ) do
	
		if v:IsPlayer() and raceactive then
			v.totalLaps = 1
			
			net.Start("laps")
			net.WriteInt(1,32)
			net.Send(v)
		
		end
	
	end

end

function checkPoint2()

	for k, v in pairs(ents.FindInBox( Vector(6359.059570, -13192.848633, -1143.905029), Vector(6742.701660, -14187.796875, -561.807434) ) ) do
	
		if v:IsPlayer() and raceactive then
			v.totalLaps = 2
			
			v.boolValue = true
			
			net.Start("laps") 
			net.WriteInt(2,32)
			net.Send(v)
		
		end
	
	end
	
end

function checkPoint3()

	for k, v in pairs(ents.FindInBox( Vector(7718.183105, 12451.620117, -34.898705), Vector(7516.244629, 13552.686523, 631.709229) ) ) do
	print("racers alive: " .. racersAlive)
	print("racers finished: " .. racersFinished)
		if v:IsPlayer() and v.boolValue == true then
			if v.racersChecked == 0 then
				racersFinished = racersFinished + 1
				v.killPossible = false
				v.racersChecked = 1
			end
			v.totalLaps = 3
			
			net.Start("laps")
			net.WriteInt(3,32)
			net.Send(v)
			if v.stopCheck == 0 then
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
			
			if racersFinished == racersAlive and racerSend == 0 then
			if racerSecond == nil then
			racerSecond = "Nobody"
			end
			if racerThird == nil then
			racerThird = "Nobody"
			end
			EndRound(raceWinner .." won 1st, " .. raceSecond .." won 2nd, and " .. raceThird .. " won 3rd.")
			racerSend = 1
			end

		end
	
	end
end