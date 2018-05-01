--RACE Clientside script.

--This will be documented soon!

include("shared.lua")
include("client/cl_music.lua")
include("client/cl_hud.lua")
include("client/cl_menu.lua")
include("client/cl_map.lua")

musicActive = true

boost = false

net.Receive("totalLapNum", function( len, pl )
	totalLaps = net.ReadInt( 32 )
	end)

net.Receive("changeBools", function(len, ply) --Boost boolean value
	boost = net.ReadBool()
	end)

net.Receive("playMusic", function(len, ply)
		musicLogic()
	end)

concommand.Add("race_music",function(ply, cmd, args) --Make it so that the player can turn off music.

	local validEntries = {"0", "1"}

	for k, v in pairs(validEntries) do
		if args[1] == "0" then
			RunConsoleCommand("stopsound")
			print("Music disabled!")
			musicActive = false
		end
		if args[1] == "1" then
			print("Music activated!")
			musicActive = true
		end
	end
	end)

surface.CreateFont( "HoveringFont", {
	font="Titillium Web",
	size= 15,
	weight=1000,
	outline=true,

	} )
surface.CreateFont("RacingHUD", { 
	size = 100,
	weight = 0,
	antialias = true,
	shadow = true,
	font = "Roboto Light"})

surface.CreateFont("RacingHUDV2", {
	size = 100,
	weight = 0,
	antialias = true,
	shadow = true,
	font = "Roboto Medium"})

surface.CreateFont("RacingHUDSmall", {
	size = 20,
	weight = 0,
	antialias = true,
	shadow = true,
	italic = true,
	font = "Roboto Medium"})

surface.CreateFont("RacingHUDSuperSmall", {
	size = 10,
	weight = 0,
	antialias = true,
	shadow = true,
	italic = true,
	font = "Roboto Medium"})

surface.CreateFont("RacingHUDBold", {
	size = 100,
	weight = 0,
	antialias = true,
	shadow = true,
	italic = false,
	outline = true,
	font = "Roboto Black"})

function buttonInputs()
	raceCountdown = GetGlobalBool("raceCountdown")
	local boostnum = (LocalPlayer():GetNWInt("boostnum"))
	if LocalPlayer():InVehicle() then
		if !boost then
			if playerRacing then
				if !raceCountdown then
					if input.IsKeyDown( KEY_LSHIFT ) and (boostnum != 0) then
						boostActivate()
					end
				end
			else
				if input.IsKeyDown( KEY_LSHIFT ) and (boostnum != 0) then
						boostActivate()
					end
			end
		end
	end
end

function boostActivate()
	
	if boost == false then
		net.Start("boostActivate")
		net.SendToServer()
		boost = true
		timer.Simple(2, function()
			boost=false
			end)
	end
	
end

function HideThings( name )
	if(name == "CHudHealth") or (name == "CHudBattery") or(name=="CHudAmmo") or(name=="CHudSecondaryAmmo")then
		return false
	end
end

hook.Add("Think", "aimView", buttonInputs)
hook.Add( "HUDShouldDraw", "HideThings", HideThings )