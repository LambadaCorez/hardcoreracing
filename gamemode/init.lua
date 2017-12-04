--init

resource.AddFile("materials/hud/race.vmt")
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

local living = (#player.GetAll())

local ply = FindMetaTable("Player")


net.Receive( "lapsclient", function( len, racer )
	
	if ( IsValid( racer ) and racer:IsPlayer() ) then
	countlaps = net.ReadInt(32)
		
		if countlaps == 3 and lapBool == true then
			raceactive = false
			EndRound(racer:Nick())
			net.Start("lapBool")
		net.WriteBool(false)
		net.Broadcast()
		net.Start("lapsclient")
		net.WriteInt(1,32)
		net.Broadcast()
		
			
		end
	
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



AddCSLuaFile("shared.lua")
AddCSLuaFile("cl_init.lua")
AddCSLuaFile("player.lua")
AddCSLuaFile("logo.lua")
AddCSLuaFile("cl_music.lua")

include("shared.lua")
include("player.lua")
include("round.lua")
include("points/racepoint1.lua")
include("points/racepoint2.lua")
include("points/racepoint3.lua")
include("points/deathzones/deathzone1.lua")
include("points/deathzones/deathzone2.lua")
include("points/deathzones/deathzone3.lua")

include("entities/props/fence.lua")
include("entities/props/fence2.lua")
include("entities/buggies/buggy1.lua")
include("entities/buggies/buggy2.lua")
include("entities/buggies/buggy3.lua")
include("entities/buggies/buggy4.lua")
include("entities/buggies/buggy5.lua")
include("entities/buggies/buggy6.lua")
include("entities/buggies/buggy7.lua")
include("entities/buggies/buggy8.lua")
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


	raceactive = false
	
	hook.Add( "PlayerSay", "PlayerSayExample", function( ply, text, team )
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
end )
	
concommand.Add("r_spawn", function()

	SpawnCar1()
	SpawnCar2()
	SpawnCar3()
	SpawnCar4()
	SpawnCar5()
	SpawnCar6()
	SpawnCar7()
	SpawnCar8()
	

end)
	
	timer.Create("deathzones", .1, 0, function()
			deathZone1()
			deathZone2()
			deathZone3()
	end)
	
	hook.Add("Think", "runPoints", function()
			racePoint1()
			racePoint2()
			racePoint3()
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
		
	end
		
		if !raceactive then
			RoundStart()
		end	
	
function GM:PlayerSpawn( ply )	
		spawnServer(ply)
		ply:AllowFlashlight( false )
		
end
	
	
	net.Receive( "race_active", function( len )
	raceactive = net.ReadBool()
	end)

	
	 
	
	
	
	
	
	
	
	
	
	
	
	
	
function GM:PlayerSetHandsModel( ply, ent )

	local simplemodel = player_manager.TranslateToPlayerModelName( ply:GetModel() )
	local info = player_manager.TranslatePlayerHands( simplemodel )
	if ( info ) then
		ent:SetModel( info.model )
		ent:SetSkin( info.skin )
		ent:SetBodyGroups( info.body )
	end

			 
			end
			 

			function GM:PlayerDeathSound()
	return true
end


--Disables the pickups on the right of the screen, they usually show up in sandbox when you pick stuff up!
function GM:HUDDrawPickupHistory()
return false
end
local spawnrate = math.Clamp(0, 0, 8)

function spawnServer(ply)

		if ply:Alive() then
		ply:SetGamemodeTeam(1)
		ply:SetPos(playerspawn[spawnrate])
		
		if spawnrate == 8 then
		spawnrate  = 0
		else
		spawnrate = spawnrate + 1
		end
		
		end
	
end

function GM:ShowHelp( ply )
	ply:Kill()
end


function GM:ShowSpare1( ply )
	
	local car = ply:GetVehicle()
	if IsValid(car) then
	local vehicleclass = car:GetClass()
	
	if vehicleclass != "prop_vehicle_airboat" then
	timer.Create("getUnstuck",2,1,function()
	local position = ply:GetVehicle():GetPos()
	local newposition
	newposition = position + (Vector(0,0,75))
	
	ply:GetVehicle():SetPos(newposition)
	
	end)
	end
	end
	end
	
function GM:ShowSpare2( ply )
	
	if ( netbool ) then
	
		spawnRace( ply )
		
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
	if !raceactive then
	countlaps = 1
	lapBool = false
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