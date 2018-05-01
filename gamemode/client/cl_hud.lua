
local screenx = ScrW()/2

local screeny = ScrH()/2

local ply = LocalPlayer()

local w = ScrW() / 110

local h = ScrH() / 50

local x = 0

local y = ScrH() - h  

net.Receive("inRaceBool", function()

	playerRacing = net.ReadBool()

end)

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
			if targetDistance < 75 and (name != ply:Nick()) then
				draw.DrawText(target:Nick(),"HoveringFont",targetScreenpos.x,targetScreenpos.y,Color(255,255,255,100),TEXT_ALIGN_CENTER)
			end
		end
		
	end

end

net.Receive("helpMenu", function(len, pl )

	local DermaPanel = vgui.Create( "DFrame" )
	DermaPanel:SetSize( 800,600 )
	DermaPanel:Center()
	DermaPanel:SetTitle( "Help Menu" )
	DermaPanel:SetDraggable( true )
	DermaPanel:MakePopup()
	DermaPanel:SetContentAlignment( 5 )
	
	local DScrollPanel = vgui.Create( "DScrollPanel", DermaPanel )
	DScrollPanel:Dock( FILL )
	
	local dlab = DScrollPanel:Add( "DButton" )
	dlab:SetText( "Hello, and welcome to Race! \nRace is all about racing, winning, and earning money.\n\nTo earn money, race! Coming in the first 3 places gives you a bonus, however you still earn money for participating.\nYou can spend that hard-earned cash by pressing F2 or typing 'race_customization' in console. If for any reason you can't race anymore (fell in a ditch, etc.),\nyou can press F1 to fix the problem." )
	dlab:SizeToContents()
	dlab:Center()
	dlab:Dock(TOP)
	
	local stats =  vgui.Create("DButton", DermaPanel )
	stats:SetText( "Statistics:\n\nAmount of Times Boosted: " .. LocalPlayer():GetNWInt("boostCounter") .. "\n\nWins: " .. LocalPlayer():GetNWInt("wins") .. "\n\nVehicles Owned: TBA\n\nSecret Items Unlocked: TBA" )
	stats:SizeToContents()
	stats:SetSize(128,128)
	stats:Center()
	stats:Dock(BOTTOM)

	end)


net.Receive( "laps", function( len )
	laps = net.ReadInt(32)
	end)

net.Receive( "lapBool", function( len )
	lapBool = net.ReadBool()
	end)



net.Receive( "10secondInt", function( len )
	secondsUntilStartOfRace = net.ReadInt(32)
	end)

local timerSounds = false

hook.Add( "HUDPaint", "DrawNames", function() -- HUD

	raceActive = GetGlobalBool("raceActive")
	raceCountdown = GetGlobalBool("raceCountdown")
	

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
		if (boostval == nil) then return end
		boostval = Lerp(FrameTime()*10, boostval, 471 )
		bval = boostval * 1
	end

	if raceActive then
			if !playerRacing then
				draw.SimpleText("There is an ongoing race. Wait until the race is over to join!", "RacingHUDSmall", x, y, Color(255,255,255,25))
			end
		end
	
	if IsValid(car) then
		local MPH = math.floor(LocalPlayer():GetVehicle():GetVelocity():Length() / 22.65 )
		local vehicleclass = car:GetClass()
		
		

		if ply:InVehicle() and vehicleclass != "prop_vehicle_airboat" then
			
			if !netbool and roundactive then
				timer.Start("timerHUD")
				draw.SimpleText((timerMinutes .. ":"..timerseconds .. ":" .. timerMs), "RacingHUDSmall", ScrW()/2, ScrH()/2, Color(255,255,255,150), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
			else
				timer.Remove("timerHUD")
			end
			
			if playerRacing then
				draw.SimpleText("CHECKPOINTS:", "RacingHUDSmall", ScrW()-235, ScrH()-125, Color(255,255,255,150), TEXT_ALIGN_RIGHT, TEXT_ALIGN_CENTER)
				draw.SimpleText(laps, "RacingHUDV2", ScrW()-185, ScrH()-130, Color(255,255,255,150), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
				draw.SimpleText("/", "RacingHUD", ScrW()-125, ScrH()-110, Color(255,255,255,150), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
				draw.SimpleText(totalLaps, "RacingHUD", ScrW()-65, ScrH()-90, Color(255,255,255,150), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
			end
				draw.SimpleText(MPH, "RacingHUDV2", ScrW()-ScrW()*.92, ScrH()-90, Color(255,255,255,150), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
				draw.SimpleText("MPH", "RacingHUDSmall", ScrW()-ScrW()*.87, ScrH()-90, Color(255,255,255,150), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
				draw.SimpleText("MPH", "RacingHUDSmall", ScrW()-ScrW()*.87, ScrH()-90, Color(255,255,255,150), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
				draw.SimpleText("BOOST", "RacingHUDSuperSmall", ScrW()-ScrW()*.985, ScrH() - ScrH() / 3.7, Color(255,255,255,150), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
				draw.RoundedBox( 4, ScrW()-ScrW()*.99, ScrH() - ScrH()*.5 - 240, 21, 480, Color(50,50,50,200))
				surface.SetTexture( 10 )
				surface.SetDrawColor( string.ToColor(ply:GetNWString("boostColor1")) )
				surface.DrawTexturedRect(  ScrW()-ScrW()*.989, ScrH() - ScrH()*.5 - 235, 17, 470 / bval)
			if playerRacing then
				if (secondsUntilStartOfRace != nil) then
					if secondsUntilStartOfRace == 4 then
						if !timerSounds then
							timerSounds = true
							raceStartingSound()
						end
					else
						timerSounds = false
					end

					if (secondsUntilStartOfRace <= 3 and secondsUntilStartOfRace > 0) then
						draw.SimpleText(secondsUntilStartOfRace, "RacingHUDBold", (ScrW()/2+25), (ScrH()/2 -100), Color(255,255,255,255), TEXT_ALIGN_RIGHT, TEXT_ALIGN_CENTER)
					end
					
					if secondsUntilStartOfRace == 0 then
						draw.SimpleText("GO!", "RacingHUDBold", (ScrW()/2+75), (ScrH()/2 -100), Color(255,255,255,255), TEXT_ALIGN_RIGHT, TEXT_ALIGN_CENTER)
						timer.Simple(2, function()
							secondsUntilStartOfRace = secondsUntilStartOfRace - 1
					end)
				end
			end
			end
		end
	end
	draw.SimpleText("MONEY: $" .. ply:GetNWInt("money"), "RacingHUDSmall", ScrW()/2, ScrH()-10, Color(255,255,255,150), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
	hoveringNames()
	end)

function GM:HUDPaintBackground ( )
	
	
	
end

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

function raceStartingSound()
	print("Race countdown happening now!")
	local num = 4
	timer.Create("playSounds", 1, num, function()
		num = num - 1
		if num > 0 then
			surface.PlaySound("race/incar/beep.wav")
		end
		if num == 0 then
			surface.PlaySound("race/incar/finalbeep.wav")

		end

				end)
	end