--RACE CL_INIT

include("shared.lua")
include("logo.lua")
include("cl_music.lua")
include("customizationmenu.lua")
musicActive = true

net.Receive("totalLapNum", function( len, pl )

	totalLaps = net.ReadInt( 32 )
	print(totalLaps)
	
	
end)

concommand.Add("race_music",function(ply, cmd, args)

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
			musicLogic()
		end
end
end)

local screenx = ScrW()/2

local screeny = ScrH()/2

net.Receive( "laps", function( len, pl )
	laps = net.ReadInt(32)
	end)

net.Receive( "lapBool", function( len, racer )
	lapBool = net.ReadBool()
	end)

net.Receive( "race_active", function( len )
	raceactive = net.ReadBool()
	end)
	
net.Receive( "10secondBool", function( len )
	netbool = net.ReadBool()
	
	end)
	
net.Receive( "10secondInt", function( len )

	seconds = net.ReadInt(32)
	
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
	   
surface.CreateFont("RacingHUDBold", {
       size = 100,
       weight = 0,
       antialias = true,
       shadow = true,
	   italic = false,
	   outline = true,
       font = "Roboto Black"})


function hoveringNames()
 local ply = LocalPlayer()
	for id,target in pairs(ents.FindByClass("Player")) do
		
		if target:Alive() then
			
			local name = tostring(target:Nick())
			
			local targetPos = target:GetPos() + Vector(0,0,90)
			
			local targetDistance = math.floor((ply:GetPos():Distance(targetPos))/40)
			
			local targetScreenpos = targetPos:ToScreen()
			
			surface.SetTextColor(255,255,255,100)
			surface.SetTextPos( tonumber( targetScreenpos.x ), tonumber( targetScreenpos.y) )
			if targetDistance < 75 then
				draw.DrawText(target:Nick(),"HoveringFont",targetScreenpos.x,targetScreenpos.y,Color(255,255,255,100),TEXT_ALIGN_CENTER)
			end
		end
		
	end

end

hook.Add("Think", "musicEnable", musicLogic)

hook.Add( "HUDPaint", "DrawNames", function()
 
 local ply = LocalPlayer()
 local car = ply:GetVehicle()
 local laps = ply:GetNWInt( "TotalCP" )
	
	if IsValid(car) then
	
	local vehicleclass = car:GetClass()
	
if  ply:InVehicle() and vehicleclass != "prop_vehicle_airboat" then
	
	if !netbool and roundactive then
	timer.Start("timerHUD")
	draw.SimpleText((timerMinutes .. ":"..timerSeconds .. ":" .. timerMs), "RacingHUDSmall", ScrW()/2, ScrH()/2, Color(255,255,255,150), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
	else
	timer.Remove("timerHUD")
	end
	draw.SimpleText("CHECKPOINTS:", "RacingHUDSmall", ScrW()-235, ScrH()-125, Color(255,255,255,150), TEXT_ALIGN_RIGHT, TEXT_ALIGN_CENTER)
	draw.SimpleText(laps, "RacingHUDV2", ScrW()-185, ScrH()-130, Color(255,255,255,150), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
	draw.SimpleText("/", "RacingHUD", ScrW()-125, ScrH()-110, Color(255,255,255,150), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
	draw.SimpleText(totalLaps, "RacingHUD", ScrW()-65, ScrH()-90, Color(255,255,255,150), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
	if seconds == 3 then	
	draw.SimpleText(3, "RacingHUDBold", (ScrW()/2+25), (ScrH()/2 -100), Color(255,255,255,255), TEXT_ALIGN_RIGHT, TEXT_ALIGN_CENTER)
	end
	
	if seconds == 2 then	
	draw.SimpleText(2, "RacingHUDBold", (ScrW()/2+25), (ScrH()/2 -100), Color(255,255,255,255), TEXT_ALIGN_RIGHT, TEXT_ALIGN_CENTER)
	end
	
	if seconds == 1 then	 
	draw.SimpleText(1, "RacingHUDBold", (ScrW()/2+25), (ScrH()/2 -100), Color(255,255,255,255), TEXT_ALIGN_RIGHT, TEXT_ALIGN_CENTER)
	end
	
	if seconds == 0 then
	draw.SimpleText("GO!", "RacingHUDBold", (ScrW()/2+75), (ScrH()/2 -100), Color(255,255,255,255), TEXT_ALIGN_RIGHT, TEXT_ALIGN_CENTER)
	end
end
end
draw.SimpleText("MONEY: $" .. ply:GetNWInt("money"), "RacingHUDSmall", ScrW()/2, ScrH()-10, Color(255,255,255,150), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
hoveringNames()
end)

timer.Create( "timerDisableGO!", 2, 0, function()

	if seconds == 0 then
	seconds = seconds - 1
	end
	
end)

timer.Create("ifGameOver", 1, 0, function()

	if !raceactive then
		laps = 1
	end
end)


