--RACE CL_INIT

include("shared.lua")
include("logo.lua")
include("cl_music.lua")
include("customizationmenu.lua")

musicActive = true

local boost = false

net.Receive("helpMenu", function(len, pl )

	local DermaPanel = vgui.Create( "DFrame" )
	DermaPanel:SetSize( 800,600 )
	DermaPanel:Center()
	DermaPanel:SetTitle( "Help Menu" )
	DermaPanel:SetDraggable( true )
	DermaPanel:MakePopup()
	DermaPanel:SetContentAlignment( 5 )
		hook.Add( "HUDPaint", "HelloThere", function()
	draw.DrawText( "Hello there!", "TargetID", ScrW() * 0.5, ScrH() * 0.25, Color( 255, 255, 255, 255 ), TEXT_ALIGN_CENTER )
end )
		
		local DScrollPanel = vgui.Create( "DScrollPanel", DermaPanel )
			DScrollPanel:Dock( FILL )
		 
	local dlab = DScrollPanel:Add( "DButton" )
	dlab:SetText( "Hello, and welcome to Race! \nRace is all about racing, winning, and earning money.\n\nTo earn money, race! Coming in the first 3 places gives you a bonus, however you still earn money for participating.\nYou can spend that hard-earned cash by pressing F2 or typing 'race_customization' in console. If for any reason you can't race anymore (fell in a ditch, etc.),\nyou can press F1 to fix the problem." )
	dlab:SizeToContents()
	dlab:Center()
	dlab:Dock(TOP)

end)

net.Receive("totalLapNum", function( len, pl )

	totalLaps = net.ReadInt( 32 )  
	
	
end)

net.Receive("changeBools", function(len, ply)
	
	boost = net.ReadBool()
	
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
 local boostnum = (ply:GetNWInt("boostnum"))
 local boost2 = boostnum + 1 
	if boostnum == 2  then 
	boostval = 1
	bval = boostval
	end
	if boostnum == 1 then
	boostval = Lerp(FrameTime()*10, boostval, boostnum  + 1 )
	bval = boostval * 1
	end
	if boostnum == 0 then
	boostval = Lerp(FrameTime()*10, boostval, 471 )
	bval = boostval * 1
	end
	
	if IsValid(car) then
	local MPH = math.floor(LocalPlayer():GetVehicle():GetVelocity():Length() / 22.65 )
	local vehicleclass = car:GetClass()
	
	if ply:InVehicle() and vehicleclass != "prop_vehicle_airboat" then
	 
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
	draw.SimpleText(MPH, "RacingHUDV2", ScrW()-ScrW()*.92, ScrH()-90, Color(255,255,255,150), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
	draw.SimpleText("MPH", "RacingHUDSmall", ScrW()-ScrW()*.87, ScrH()-90, Color(255,255,255,150), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
	draw.SimpleText("MPH", "RacingHUDSmall", ScrW()-ScrW()*.87, ScrH()-90, Color(255,255,255,150), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
	draw.SimpleText("BOOST", "RacingHUDSuperSmall", ScrW()-ScrW()*.985, ScrH() - ScrH() / 3.7, Color(255,255,255,150), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
	draw.RoundedBox( 4, ScrW()-ScrW()*.99, ScrH() - ScrH()*.5 - 240, 21, 480, Color(50,50,50,200))
	surface.SetTexture( 10 )
	surface.SetDrawColor( 100,100,255,255 )
	surface.DrawTexturedRect(  ScrW()-ScrW()*.9891, ScrH() - ScrH()*.5 - 235, 18, 470 / bval)
	
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

function buttonInputs()
 local boostnum = (LocalPlayer():GetNWInt("boostnum"))
	if LocalPlayer():InVehicle() then
	if !boost then
			if input.IsKeyDown( KEY_LSHIFT ) and boostnum != 0 then
				boostActivate()
			end
		end
	end
end
	
hook.Add("Think", "aimView", buttonInputs)
	
	local tab = {
	[ "$pp_colour_addr" ] = 0,
	[ "$pp_colour_addg" ] = .002,
	[ "$pp_colour_addb" ] = fadelerp,
	[ "$pp_colour_brightness" ] = 0,
	[ "$pp_colour_contrast" ] = 1,
	[ "$pp_colour_colour" ] = 2,
	[ "$pp_colour_mulr" ] = 0,
	[ "$pp_colour_mulg" ] = 0,
	[ "$pp_colour_mulb" ] = .9
}
	
	function GM:RenderScreenspaceEffects()
	if boost then
	local boostlerp = Lerp(FrameTime()*4, 0, 1)
	local fadelerp = Lerp(FrameTime()*1000, 0, .2)
	util.ScreenShake( Vector( 0, 0, 0 ), .6, 5000, 3, 10 )
	DrawMotionBlur( .4, .4, 0.02 )
	DrawColorModify( tab )
	DrawSobel( 6 )
	DrawBloom( .65, 2, 9, 9, 1, 1, 1, 1, 1 )
	DrawToyTown( 2, ScrH()/2 )
	end
end
	
function boostActivate()
	
	if boost == false then
	net.Start("boostActivate")
	net.SendToServer()
	boost = true
	end
end

function HideThings( name )
	if(name == "CHudHealth") or (name == "CHudBattery") or(name=="CHudAmmo") or(name=="CHudSecondaryAmmo")then
		return false
	end
end
hook.Add( "HUDShouldDraw", "HideThings", HideThings )