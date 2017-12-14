resource.AddFile("music/export.mp3")
include("entities/props/fence.lua")
include("entities/props/fence2.lua")

local ExtraFilters = {"prop_vehicle_airboat", "prop_dynamic"}



local spawnrate = 0

include("entities/props/fence.lua")
include("entities/buggies/buggy1.lua")
include("entities/buggies/buggy2.lua")
include("entities/buggies/buggy3.lua")
include("entities/buggies/buggy4.lua")
include("entities/buggies/buggy5.lua")
include("entities/buggies/buggy6.lua")
include("entities/buggies/buggy7.lua")
include("entities/buggies/buggy8.lua")

function UpdateTimer( time )
		net.Start("race_timer")
		net.WriteInt( time, 10 )
		net.Broadcast()
end


function RoundStart()
pregame = true

	if ((#player.GetAll()) < 2) then
	
	PrintMessage(HUD_PRINTCENTER, "Not enough players in the game! Get some in here!" )

	return end
	
	local time = 16
	UpdateTimer(time)
		
		timer.Create( "roundstart", 1, time, function()
		pregame = false
		if time != 2 then
		PrintMessage(HUD_PRINTCENTER, "Race starting in " .. time - 1 .. " seconds!" )
		else
		PrintMessage(HUD_PRINTCENTER, "Race starting in " .. time - 1 .. " second!" )
		end
		time = time - 1
		
			local Alive = 0
			
			for k, v in pairs ( player.GetAll() ) do
				
				if (v:Alive() ) then
					v:SetHealth(100)
					Alive = Alive + 1
				end
				
			end
			
			if ( time <= 0) then
				
				
				
				RoundEndCheck()
			return
			
			end
			UpdateTimer( time )
		end)
	

end



function RoundEndCheck()
	seconds = math.Clamp(20,0,20)
	netbool = false
	timer.Create("repeatMessage", 1, 3, function()
	PrintMessage(HUD_PRINTCENTER,"RACE STARTED! Press F4 quickly to get in your car! Be fast, you only have 20 seconds!")
	end)
		timer.Create("10Seconds", 1, seconds, function()
			seconds = seconds - 1
			netbool = true
				net.Start("10secondInt")
				net.WriteInt(seconds,32)
				net.Broadcast()
					net.Start("10secondBool")
					net.WriteBool(netbool)
					net.Broadcast()
			raceactive = true
			
				net.Start("race_active")
					net.WriteBool( true )
				net.Broadcast()
	
			if seconds == 4 then
			for k, v in pairs(ents.FindByName("Startbutton1")) do
				v:Fire("Use")
			end
			end

			if seconds == 0 then
				netbool = false
				timer.Remove("10Seconds")
				net.Start("10secondBool")
				net.WriteBool(netbool)
				net.Broadcast()
			
			local localTime = 2
				
			timer.Start("checkforPeople", 1, localTime, function()
			
			localTime = localTime - 1
			
			if localTime == 0 then
			timer.Remove("checkforPeople")
			end
			end)
			for k, v in pairs(team.GetPlayers( 0 )) do
			if v:InVehicle() == false then
			v:Kill()
			end
			end
			end
	end)
 
	
	RunConsoleCommand( "r_spawn" )
	
	game.CleanUpMap(false, ExtraFilters  )
	
	for _, v in pairs(player.GetAll() ) do
			if ( v:Alive() ) then
				v:SetHealth(100)
			end
	end
	
		time = 180
	
	timer.Create( "checkdelay", 1, time, function()
		if !netbool and raceactive then
			
			
			
			time = time - 1
			UpdateTimer( time )
			
			racersAlive = 0
			for k, v in pairs( team.GetPlayers( 0 ) ) do
					racersAlive = racersAlive + 1
			end
			
			if racersAlive == 1 then
			for k, v in pairs(team.GetPlayers( 0 )) do
			if v:Alive() then
			
			v:SetNWInt("money", v:GetNWInt("money") + 500)
			EndRound("Every racer but " .. v:Nick() .." is dead: " .. v:Nick())
			
			end
			end
			end
			
			if racersAlive == 0 then
			EndRound("Nobody is alive! Nobody")
			end
			
			if time == 0 then
			EndRound("Time Ran Out! Nobody")
			end
			end
		end)
	
	
	
end


function EndRound(winners)
	PrintMessage(HUD_PRINTCENTER, winners .. " won the race! New one starting soon..." )
	
	
	for k, v in pairs(team.GetPlayers( 0 )) do
			v:Kill()
		end
		
	timer.Remove("checkdelay")
	
	timer.Create( "cleanup", 3, 1, function()
		
		game.CleanUpMap(false, ExtraFilters )
	
		for _, v in pairs(player.GetAll() ) do
			if ( v:Alive() ) then
				v:StripWeapon("weapon_frag")
				
			end
		
		v:SetGamemodeTeam(1) 
		
		end
		
		
		RoundStart()
		net.Start("race_active")
			net.WriteBool( false )
		net.Broadcast()
		raceactive = false
		pregame = true
		SpawnFence()
		SpawnFence2()
		SpawnDemoDurbyFence1()
	SpawnDemoDurbyFence2()
	SpawnDemoDurbyFence3()
	SpawnDemoDurbyFence4()
	SpawnDemoDurbyFence5()
	SpawnDemoDurbyFence6()
	
	

	end)
end


function spawnRace( ply, veh )

		if ply:Alive() then
		local pos = ply:GetPos()
			ply:SetGamemodeTeam(0)
			ply:GodEnable()
			ply:SetNoCollideWithTeammates(true)
			ply:StripWeapons()
				if spawnrate == 8 then
					spawnrate  = 0
				else
					spawnrate = spawnrate + 1
				end
	
		end
	end
