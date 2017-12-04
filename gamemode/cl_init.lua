--RACE CL_INIT

resource.AddFile("resource/fonts/titilliumweb-light.ttf")
resource.AddFile("resource/fonts/titilliumweb-regular.ttf")


include("shared.lua")
include("logo.lua")
include("cl_music.lua")


local screenx = ScrW()/2

local screeny = ScrH()/2



timer.Create("lapReset",.2,0,function()
	
	if laps == nil then
		laps = 1
		lapBool = false
	end
	if !raceactive then
		laps = 1
		lapBool = false
	end
	

end)



timer.Create("lapsSend",.2,0,function()
if laps >= 2 then
	net.Start("lapBool")
	net.WriteBool(lapBool)
	net.SendToServer()
	net.Start("lapsclient")
	net.WriteInt(laps,32)
	net.SendToServer()
	if laps == 3 then
	laps = 1
	lapBool = false
	end
	end
	

end)

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

surface.CreateFont("", {
        size = 23,
        weight = 400,
        antialias = true,
        shadow = false,
        font = "Coolvetica"})
		
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

	   hook.Add( "Think", "includeMusic", musicLogic)
	   
function hoveringNames()

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





hook.Add( "HUDPaint", "DrawNames", function()
 
 local car = ply:GetVehicle()
	
	if IsValid(car) then
	
	local vehicleclass = car:GetClass()
	
if  ply:InVehicle() and vehicleclass != "prop_vehicle_airboat" then
	draw.SimpleText("CHECKPOINTS:", "RacingHUDSmall", ScrW()-150, ScrH()-125, Color(255,255,255,150), TEXT_ALIGN_RIGHT, TEXT_ALIGN_CENTER)
	draw.SimpleText(laps, "RacingHUDV2", ScrW()-90, ScrH()-130, Color(255,255,255,150), TEXT_ALIGN_RIGHT, TEXT_ALIGN_CENTER)
	draw.SimpleText("/", "RacingHUD", ScrW()-60, ScrH()-110, Color(255,255,255,150), TEXT_ALIGN_RIGHT, TEXT_ALIGN_CENTER)
	draw.SimpleText(3, "RacingHUD", ScrW()-15, ScrH()-90, Color(255,255,255,150), TEXT_ALIGN_RIGHT, TEXT_ALIGN_CENTER)
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
hoveringNames()
end)


timer.Create( "timerDisableGO!", 2, 0, function()

	if seconds == 0 then
	seconds = seconds - 1
	end
	
end)



