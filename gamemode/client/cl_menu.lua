


CreateClientConVar("ColorRed",0,true,false,"")
CreateClientConVar("ColorGreen",0,true,false,"")
CreateClientConVar("ColorBlue",0,true,false,"")

carlist = {}

carlist[0] = {
shrt = "pGSX",
secret = false,
car = "Mitsubishi Eclipse GSX", 
price = "2000",
fbumper = 5, 
rbumper = 4, 
skirts = 3, 
wheels = 0, 
spoilers = 2, 
hoods = 0,

fbumperoffset = 3,
bbumperoffset = 4,
skirtsoffset = 5,
hoodsoffset = 6,
wingsoffset = 8,
wheelsoffset = 9

}	
carlist[1] = {car = "Nissan Silvia S15",
shrt = "pSIL",
secret = false,
price = "5000", 
fbumper = 6, 
rbumper = 5, 
skirts = 3, 
wheels = 1, 
spoilers = 5, 
hoods = 0,

fbumperoffset = 3,
bbumperoffset = 4,
skirtsoffset = 6,
hoodsoffset = 5,
wingsoffset = 7,
wheelsoffset = 8

}
carlist[2] = {car = "Mitsubishi Evolution VIII", 
shrt = "pEV8",
secret = false,
price = "5500",
fbumper = 5, 
rbumper = 5, 
skirts = 1, 
wheels = 0, 
spoilers = 5, 
hoods = 5,

fbumperoffset = 3,
bbumperoffset = 4,
skirtsoffset = 6,
hoodsoffset = 5,
wingsoffset = 7,
wheelsoffset = 9

}
carlist[3] = {car = "Mitsubishi Evolution X",
shrt = "pEVX",
secret = false,
price = "6000",
fbumper = 2, 
rbumper = 1, 
skirts = 1, 
wheels = 0, 
spoilers = 2,
hoods = 1,

fbumperoffset = 3,
bbumperoffset = 4,
skirtsoffset = 5,
hoodsoffset = 6,
wingsoffset = 7,
wheelsoffset = 8

}
carlist[4] = {car = "Nissan Skyline R34", 
shrt = "pR34",
secret = false,
price = "8000",
fbumper = 2, 
rbumper = 1, 
skirts = 1, 
wheels = 0, 
spoilers = 2, 
hoods = 1,

fbumperoffset = 3,
bbumperoffset = 4,
skirtsoffset = 5,
hoodsoffset = 6,
wingsoffset = 7,
wheelsoffset = 8

}
carlist[5] = {car = "Nissan 370Z", 
shrt = "p370",
secret = false,
price = "4000",
fbumper = 2, 
rbumper = 1, 
skirts = 1, 
wheels = 1, 
spoilers = 2, 
hoods = 1,

fbumperoffset = 3,
bbumperoffset = 4,
skirtsoffset = 5,
hoodsoffset = 6,
wingsoffset = 7,
wheelsoffset = 9

}
carlist[6] = {car = "Mitsubishi Eclipse GT", 
shrt = "pMGT",
secret = false,
price = "3000",
fbumper = 2, 
rbumper = 1, 
skirts = 0, 
wheels = 1, 
spoilers = 0, 
hoods = 0,

fbumperoffset = 3,
bbumperoffset = 5,
skirtsoffset = 4,
hoodsoffset = -1,
wingsoffset = 7,
wheelsoffset = -1

}
carlist[7] = {car = "Nissan 350Z",
shrt = "p350",
secret = true,
price = " ??",
fbumper = 1,
rbumper = 1, 
skirts = 1,
wheels = -1,
spoilers = 2,
hoods = 1,

fbumperoffset = 2,
bbumperoffset = 3,
skirtsoffset = 4,
hoodsoffset = 5,
wingsoffset = 6,
wheelsoffset = 7

}

carlist[8] = {car = "Nissan Leaf",
shrt = "pNSL",
secret = true,
price = " ??",
fbumper = 0,
rbumper = -1, 
skirts = -1,
wheels = -1,
spoilers = 0,
hoods = -1,

fbumperoffset = 4,
bbumperoffset = 0,
skirtsoffset = 0,
hoodsoffset = 0,
wingsoffset = 5,
wheelsoffset = 6

}

carlist[9] = {car = "Mitsubishi Coltrallart",
secret = true,
shrt = "pMCL",
price = " ??",
fbumper = 0,
rbumper = -1, 
skirts = -1,
wheels = -1,
spoilers = 0,
hoods = -1,

fbumperoffset = 2,
bbumperoffset = 0,
skirtsoffset = 0,
hoodsoffset = 0,
wingsoffset = 3,
wheelsoffset = 0

}

carlist[10] = {car = "Nissan GTR",
shrt = "pGTR",
secret = true,
price = " ??",
fbumper = 0,
rbumper = -1, 
skirts = -1,
wheels = -1,
spoilers = 1,
hoods = -1,

fbumperoffset = 4,
bbumperoffset = 0,
skirtsoffset = 0,
hoodsoffset = 0,
wingsoffset = 5,
wheelsoffset = 6

}

carlist[11] = {car = "Buggy",
shrt = "pBGY",
secret = true,
price = " ??",
fbumper = 0,
rbumper = -1, 
skirts = -1,
wheels = -1,
spoilers = -1,
hoods = -1,

fbumperoffset = 1,
bbumperoffset = 0,
skirtsoffset = 0,
hoodsoffset = 0,
wingsoffset = 0,
wheelsoffset = 0

}

carlist[12] = {car = "...",
shrt = "pSEC",
secret = true,
price = " ??",
fbumper = -1,
rbumper = -1,
skirts = -1,
wheels = -1,
spoilers = -1,
hoods = -1,

fbumperoffset = 0,
bbumperoffset = 0,
skirtsoffset = 0,
hoodsoffset = 0,
wingsoffset = 0,
wheelsoffset = 0

}



cars = {}

cars[0] = {car = "models/tdmcars/mit_eclipsegsx.mdl"}
cars[1] = {car = "models/tdmcars/nissan_silvias15.mdl"}
cars[2] = {car = "models/tdmcars/mitsu_evo8.mdl"}
cars[3] = {car = "models/tdmcars/mitsu_evox.mdl"}
cars[4] = {car = "models/tdmcars/skyline_r34.mdl"}
cars[5] = {car = "models/tdmcars/nis_370z.mdl"}
cars[6] = {car = "models/tdmcars/mitsu_eclipgt.mdl"}
cars[7] = {car = "models/tdmcars/350z.mdl"}
cars[8] = {car = "models/tdmcars/nis_leaf.mdl"}
cars[9] = {car = "models/tdmcars/coltralliart.mdl"}
cars[10] = {car = "models/tdmcars/nissan_gtr.mdl"}
cars[11] = {car = "models/buggy.mdl"}
cars[12] = {car = "models/tdmcars/gtaiv_airtug.mdl"}


sound.Add( {
	name = "menumusic",
	channel = CHAN_STATIC,
	volume = 1.0,
	level = 80,
	pitch = { 100 },
	sound = "race/menumusic.wav"
	} )


net.Receive("openCustomMenu", function()

	if LocalPlayer():InVehicle() then return end
	
	for i = 0, table.Count(cars) - 1 do
		util.PrecacheModel(cars[i].car)
	end

	LocalPlayer():StartLoopingSound( "menumusic" )
	
	local col = Color(GetConVarNumber( "ColorRed" ), GetConVarNumber("ColorGreen"), GetConVarNumber("ColorBlue"), 255)
	local ply = LocalPlayer()
	local number = tonumber(ply:GetNWInt("pCar"))
	local total = 0
	local frontbump = 0
	local rearbump = 0
	local skirts = 0
	local hood = 0
	local wing = 0
	local wheels = 0
	local avg = 0
	local customVar = 0
	local fchoices = 0
	
	local menu = vgui.Create("DFrame")
	menu:SetSize(250,500)
	menu:SetPos((ScrW()/2) - 125, (ScrH()/2) - 250)
	menu:SetTitle("Customization Menu")
	menu:SetDraggable(false)
	menu:ShowCloseButton(true)
	menu:MakePopup(true)
	menu.Paint = function()
	draw.RoundedBox( 8, 0, 0, menu:GetWide(), menu:GetTall(), Color( 0, 0, 0, 200 ) )
	Derma_DrawBackgroundBlur( menu, 4 )
	menu.OnClose = function()
	LocalPlayer():StopSound( "menumusic" )
end
end

local colormenubutton = vgui.Create("Button", menu)
colormenubutton:SetSize(50,50)
colormenubutton:Dock( TOP )
colormenubutton:SetText("Customize Car Color")
colormenubutton.Paint = function()
draw.RoundedBox( 8, 0, 0, colormenubutton:GetWide(), colormenubutton:GetTall(), Color( 255,255,255, 255 ) )
colormenubutton:SetImage("icon16/color_wheel.png")
end



local carmenubutton = vgui.Create("Button", menu)
carmenubutton:SetSize(245,50)
carmenubutton:Center()
carmenubutton:DockPadding( 10, 0, 10, 0 )
carmenubutton:SetText("Buy Cars")
carmenubutton.Paint = function()
draw.RoundedBox( 8, 0, 0, carmenubutton:GetWide(), carmenubutton:GetTall(), Color( 255,255,255, 255 ) )
carmenubutton:SetImage("icon16/car_add.png")
end


local customizecarsbutton = vgui.Create("Button", menu)
customizecarsbutton:SetSize(50,50)
customizecarsbutton:Dock( BOTTOM )
customizecarsbutton:SetText("Customize Car")
customizecarsbutton.Paint = function()
draw.RoundedBox( 8, 0, 0, customizecarsbutton:GetWide(), customizecarsbutton:GetTall(), Color( 255,255,255, 255 ) )
customizecarsbutton:SetImage("icon16/wrench.png")
end

local ColorMenu = vgui.Create("DFrame")

ColorMenu:SetSize(ScrW()/1.5,700)
ColorMenu:SetPos((ScrW()/2.5) -(ScrW()/4), (ScrH()/2) - 350)
ColorMenu:SetTitle("Color Picker")
ColorMenu:SetDraggable(false)
ColorMenu:SetVisible(false)
ColorMenu:ShowCloseButton(false)
ColorMenu:MakePopup(true)
ColorMenu.Paint = function()
draw.RoundedBox( 8, 0, 0, ColorMenu:GetWide(), ColorMenu:GetTall(), Color( 0, 0, 0, 200 ) )
Derma_DrawBackgroundBlur( ColorMenu, 4 )
end

local preview = vgui.Create( "DModelPanel", ColorMenu )
preview:SetSize( 600,600 )
preview:Dock( FILL )

local vehiCheck = tonumber(ply:GetNWInt("pCar"))

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

preview:SetModel( cars[number].car )
preview.Entity:SetBodyGroups( customVar )
preview:SetColor(Color(ply:GetNWInt("colorR"),ply:GetNWInt("colorG"),ply:GetNWInt("colorB")))

local mn, mx = preview.Entity:GetRenderBounds()
local size = 0
size = math.max( size, math.abs( mn.x ) + math.abs( mx.x ) )
size = math.max( size, math.abs( mn.y ) + math.abs( mx.y ) )
size = math.max( size, math.abs( mn.z ) + math.abs( mx.z ) )
preview:SetFOV( 45 )
preview:SetCamPos( Vector( size, size, size ) )
preview:SetLookAt( ( mn + mx ) *.2 )

local colorpick = vgui.Create( "DColorMixer", ColorMenu )
colorpick:Dock( LEFT )
colorpick:SetPalette( true )
colorpick:SetAlphaBar( false )	
colorpick:SetWangs( true )
colorpick:SetColor(Color(ply:GetNWInt("colorR"),ply:GetNWInt("colorG"),ply:GetNWInt("colorB")))
function colorpick:ValueChanged( color )
	colorpick:SetConVarR("ColorRed")
	colorpick:SetConVarG("ColorGreen")
	colorpick:SetConVarB("ColorBlue")
	preview:SetColor(color)
end



local colorbutton = vgui.Create( "Button", ColorMenu )
colorbutton:SetSize( 250, 30 )
colorbutton:Dock( BOTTOM )
colorbutton:SetVisible( true )
colorbutton.Paint = function()
draw.RoundedBox( 8, 0, 0, colorbutton:GetWide(), colorbutton:GetTall(), Color( 255,255,255, 100 ) )
colorbutton:SetImage("icon16/money.png")
end
colorbutton:SetText("Set This Car's Color for $100")

local backColorButton = vgui.Create("Button", ColorMenu)
backColorButton:SetSize(24,16)
backColorButton:SetPos(ColorMenu:GetWide() - ColorMenu:GetWide() * .02, ColorMenu:GetTall() - ColorMenu:GetTall() * .99)
backColorButton.Paint = function()
draw.RoundedBox( 8, 0, 0, backColorButton:GetWide(), backColorButton:GetTall(), Color( 55,55,55, 255 ) )
backColorButton:SetImage("icon16/cancel.png")
backColorButton.DoClick = function() 
ColorMenu:SetVisible(false)
menu:SetVisible(true)
end
end

local vendermenu = vgui.Create("DFrame")

vendermenu:SetSize(ScrW() - 50 ,ScrH() - 50)
vendermenu:Center()
vendermenu:SetTitle("Buy Cars")
vendermenu:SetVisible( false )
vendermenu:SetDraggable( false )
vendermenu:ShowCloseButton(false)
vendermenu:MakePopup(true)
vendermenu.Paint = function()
draw.RoundedBox( 8, 0, 0, vendermenu:GetWide(), vendermenu:GetTall(), Color( 0, 0, 0, 200 ) )
Derma_DrawBackgroundBlur( vendermenu, 4 )
end

local backColorButton = vgui.Create("Button", vendermenu)
backColorButton:SetSize(24,16)
backColorButton:SetPos(vendermenu:GetWide() - vendermenu:GetWide() * .02, vendermenu:GetTall() - vendermenu:GetTall() * .99)
backColorButton:DockMargin( 1512,8,8,8 )
backColorButton.Paint = function()
draw.RoundedBox( 8, 0, 0, backColorButton:GetWide(), backColorButton:GetTall(), Color( 55,55,55, 255 ) )
backColorButton:SetImage("icon16/cancel.png")
backColorButton.DoClick = function() 
vendermenu:SetVisible(false)
menu:SetVisible(true)
end
end

local ds = vgui.Create( "DScrollPanel", vendermenu )
ds:SetSize(350,500)
ds:Dock( RIGHT )

local car = vgui.Create( "DModelPanel", vendermenu )
car:SetSize( 800,800 )
car:Dock(FILL)


car:SetModel( cars[number].car )
car:SetColor(col)

local mn, mx = car.Entity:GetRenderBounds()
local size = 0
size = math.max( size, math.abs( mn.x ) + math.abs( mx.x ) )
size = math.max( size, math.abs( mn.y ) + math.abs( mx.y ) )
size = math.max( size, math.abs( mn.z ) + math.abs( mx.z ) )

car:SetFOV( 55 )
car:SetCamPos( Vector( size, size, size ) )
car:SetLookAt( ( mn + mx ) *.2 )

local buyButton = vgui.Create("DButton", vendermenu )
buyButton:SetText("Buy the " .. carlist[number].car .. " for $" .. carlist[number].price .. "?")
buyButton:SetSize(350,150)
buyButton.Paint = function()
draw.RoundedBox( 8, 0, 0, buyButton:GetWide(), buyButton:GetTall(), Color( 255,255,255, 100 ) )
buyButton:SetImage("icon16/money.png")
end
--buyButton:SetPos(ScrW() -ScrW()/4.75, ScrH() - ScrH()/5)
buyButton:Dock(BOTTOM)

for i=0, table.Count(carlist) - 1 do
	
	local DButton = ds:Add( "DButton" )
	
	DButton:SetText( carlist[i].car ..": $" .. carlist[i].price)

	if carlist[i].secret then
		if tobool(ply:GetNWBool("Secret" .. carlist[i].shrt)) == false then
			DButton:SetText( "???")
		else
			DButton:SetText("Equip the secret car: " .. carlist[i].car)
		end
	else
		if tobool(LocalPlayer():GetNWBool("Regular" .. carlist[i].shrt)) == false then
			DButton:SetText( carlist[i].car ..": $" .. carlist[i].price)
		else
			DButton:SetText("Equip the " .. carlist[i].car )
		end
	end

	DButton:Dock( TOP )
	DButton:SetSize(350, 100)
	DButton:DockMargin( 0, 0, 0, 5 )
	DButton:SetMouseInputEnabled( true )
	DButton.Paint = function()
	draw.RoundedBox( 8, 0, 0, DButton:GetWide(), DButton:GetTall(), Color( 1*(i*4), 1*(i*6), 1*(i*8), 100 ) )
	end
	function DButton:DoClick()
		print(i)
		buyButton:SetText("Buy the " .. carlist[i].car .. " for $" .. carlist[i].price .. "?")

		if carlist[i].secret then
			if tobool(LocalPlayer():GetNWBool("Secret" .. carlist[i].shrt)) == false then
				buyButton:SetText("Unlock this car by getting one of the secret achievements!")
				car:SetAmbientLight( Color(255,255,255,255) )
				car:SetModel("models/race/question/question.mdl")
				car:SetColor( Color(0,0,0,255) )
				number = -1
			else
				car:SetModel( cars[i].car )
				buyButton:SetText("Equip the secret car:".. carlist[i].car .."?")
				car:SetAmbientLight( Color(255,255,255, 255))
				car:SetColor(col)
				number = i
			end
		else
			if tobool(LocalPlayer():GetNWBool("Regular" .. carlist[i].shrt)) == false then
				car:SetModel( cars[i].car )
				car:SetColor(col)
				buyButton:SetText("Buy the " .. carlist[i].car .. " for $" .. carlist[i].price .. "?")
				number = i
			else
				car:SetModel( cars[i].car )
				car:SetColor(col)
				buyButton:SetText("Equip the " .. carlist[i].car .. "?")
				number = i
			end

		chat.PlaySound()

		end
	end
end


local flamemenu = vgui.Create("DFrame")


flamemenu:SetSize(256,400)
flamemenu:Center()
flamemenu:SetTitle("Boost Flame Menu")
flamemenu:SetVisible( false )
flamemenu:SetDraggable( false )
flamemenu:ShowCloseButton(false)
flamemenu:MakePopup(true)
flamemenu.Paint = function()
draw.RoundedBox( 8, 0, 0, flamemenu:GetWide(), flamemenu:GetTall(), Color( 0, 0, 0, 200 ) )
Derma_DrawBackgroundBlur( flamemenu, 4 )
end

local flamebutton = vgui.Create("DButton", flamemenu )
flamebutton:SetText("Buy flames for " .. carlist[number].car .. ": $500")
flamebutton:SetSize(0,45)
flamebutton:Dock(BOTTOM)
flamebutton.Paint = function()
draw.RoundedBox( 8, 0, 0, flamebutton:GetWide(), flamebutton:GetTall(), Color( 255,255,255, 100 ) )
end

local backbutton = vgui.Create("DButton", flamemenu )
backbutton:SetText("Auto Body Customization")
backbutton:SetSize(20,20)
backbutton:Dock(TOP)	
backbutton.Paint = function()
draw.RoundedBox( 8, 0, 0, backbutton:GetWide(), backbutton:GetTall(), Color( 50,50,50, 100 ) )
end

local filler = vgui.Create("DButton", flamemenu )
filler:SetText("")
filler:SetSize(20,20)
filler:Dock(TOP)	
filler.Paint = function()
draw.RoundedBox( 8, 0, 0, filler:GetWide(), filler:GetTall(), Color( 0,0,0,0 ) )
end

local flamechoices = vgui.Create( "DComboBox", flamemenu )

flamechoices:SetPos(450,150)
flamechoices:Dock(TOP)
flamechoices:SetSize(200,100)
flamechoices.Paint = function()
draw.RoundedBox( 8, 0, 0, flamechoices:GetWide(), flamechoices:GetTall(), Color( 255,255,255, 100 ) )
end
flamechoices:SetValue("Flame Choices:")
flamechoices:AddChoice("Default", 0, false)
flamechoices:AddChoice("Super Red", 1, false)
flamechoices:AddChoice("Nuclear Orange", 2, false)
flamechoices:AddChoice("Blue Bunsen Burner", 3, false)
flamechoices:AddChoice("Hot Pink", 4, false)
flamechoices:AddChoice("4000 Degrees Kelvin Purple", 5, false)
flamechoices:AddChoice("Spillway Green", 6, false)
flamechoices:AddChoice("Dull Grey", 7, false)
flamechoices.OnSelect = function( panel, index, value )
fchoices = index
total = 500
flamebutton:SetText("Buy flames for " .. carlist[number].car .. ": $500")
end




local customize = vgui.Create("DFrame")

customize:SetSize(ScrW() - 50 ,ScrH() - 50)
customize:Center()
customize:SetTitle("Customization Menu")
customize:SetVisible( false )
customize:SetDraggable( false )
customize:ShowCloseButton(false)
customize:MakePopup(true)
customize.Paint = function()
draw.RoundedBox( 8, 0, 0, customize:GetWide(), customize:GetTall(), Color( 0, 0, 0, 200 ) )
Derma_DrawBackgroundBlur( customize, 4 )
end

local backColorButton = vgui.Create("Button", customize)
backColorButton:SetSize(24,16)
backColorButton:SetPos(customize:GetWide() - customize:GetWide() * .02, customize:GetTall() - customize:GetTall() * .99)
backColorButton.Paint = function()
backColorButton:DockMargin( 1512,8,8,8 )
draw.RoundedBox( 8, 0, 0, backColorButton:GetWide(), backColorButton:GetTall(), Color( 55,55,55, 255 ) )
backColorButton:SetImage("icon16/cancel.png")
backColorButton.DoClick = function() 
customize:SetVisible(false)
menu:SetVisible(true)
end
end

local nextbutton = vgui.Create( "DButton", customize )

nextbutton:SetPos(50,150)
nextbutton:SetSize(25,25)
nextbutton:SetText("Boost Flames")
nextbutton:Dock(BOTTOM)
nextbutton:DockMargin( 8,8,8,8 )
nextbutton.Paint = function( self, w, h ) draw.RoundedBox( 4, 0, 0, w, h, Color( 255,255,255, 100 ) ) end
nextbutton.DoClick = function()
customize:SetVisible(false)
flamemenu:SetVisible(true)
end


local prev = vgui.Create( "DModelPanel", customize )

prev:SetSize(900,900)
prev:Dock(LEFT)
prev:SetModel(cars[tonumber(ply:GetNWInt("pCar"))].car)
prev:SetColor(col)
prev.Angles = Angle( 0, 0, 0 )
local mn, mx = prev.Entity:GetRenderBounds()
local size = 0
size = math.max( size, math.abs( mn.x ) + math.abs( mx.x ) )
size = math.max( size, math.abs( mn.y ) + math.abs( mx.y ) )
size = math.max( size, math.abs( mn.z ) + math.abs( mx.z ) )

prev:SetFOV( 35 )
prev:SetCamPos( Vector( size, size, size ) )
prev:SetLookAt( ( mn + mx ) * 0.2 )


function prev:DragMousePress()
	self.PressX, self.PressY = gui.MousePos()
	self.Pressed = true
end

function prev:DragMouseRelease() self.Pressed = false end

function prev:LayoutEntity( Entity )

	if ( self.Pressed ) then
		local mx, my = gui.MousePos()
		self.Angles = self.Angles - Angle( 0, ( self.PressX or mx ) - mx, 0 )

		self.PressX, self.PressY = gui.MousePos()
	end

	Entity:SetAngles( self.Angles )
end

local buycustomsButton = vgui.Create("DButton", customize )
buycustomsButton:SetText("Buy upgrades for " .. carlist[number].car .. ": $" .. total)
buycustomsButton:SetSize(0,45)
buycustomsButton:Dock(BOTTOM)	
buycustomsButton:DockMargin( 8,8,8,8 )
buycustomsButton:SetIcon("icon16/money.png")
buycustomsButton.Paint = function( self, w, h ) draw.RoundedBox( 4, 0, 0, w, h, Color( 255,255,255, 100 ) ) end

local sheet = vgui.Create( "DPropertySheet", customize )
sheet:Dock( FILL )
sheet.Paint = function()
draw.RoundedBox( 8, 0, 0, sheet:GetWide(), sheet:GetTall(), Color( 0, 0, 0, 0 ) )
end


local panel = vgui.Create( "DPanel", sheet )
panel.Paint = function( self, w, h ) draw.RoundedBox( 4, 0, 0, w, h, Color( 100,100,100, 0 ) ) end
sheet:AddSheet( "", panel, "icon16/wrench.png" )


local fbumper = vgui.Create( "DComboBox", panel )



fbumper:SetPos(0,0)
fbumper:SetSize(350,100)
fbumper:Dock(BOTTOM)
fbumper:SetValue("Front Bumpers:")
for i=0, (carlist[vehiCheck].fbumper) do
	fbumper:AddChoice("Front Bumper " .. i + 1, i, false)
end
fbumper.Paint = function( self, w, h ) draw.RoundedBox( 4, 0, 0, w, h, Color( 50,50,50, 100 ) ) end
fbumper.OnSelect = function( panel, index, value )
chat.PlaySound()
frontbump = index
prev.Entity:SetBodygroup(carlist[vehiCheck].fbumperoffset,index)
total = 1000
buycustomsButton:SetText("Buy upgrades for " .. carlist[number].car .. ": $" .. total)
end

local bbumper = vgui.Create( "DComboBox", panel )

bbumper:SetPos(0,0)
bbumper:Dock(BOTTOM)
bbumper:SetSize(350,100)
bbumper:SetValue("Rear Bumpers:")
for i=0, (carlist[vehiCheck].rbumper) do
	bbumper:AddChoice("Rear Bumper " .. i + 1, i, false)
end
bbumper.Paint = function( self, w, h ) draw.RoundedBox( 4, 0, 0, w, h, Color( 50,50,50, 100 ) ) end
bbumper.OnSelect = function( panel, index, value )
chat.PlaySound()
rearbump = index
prev.Entity:SetBodygroup(carlist[vehiCheck].bbumperoffset,index)
total = 1000
buycustomsButton:SetText("Buy upgrades for " .. carlist[number].car .. ": $" .. total)
end

local skirt = vgui.Create( "DComboBox", panel )

skirt:SetPos(450,250)
skirt:SetSize(350,100)
skirt:Dock(BOTTOM)
skirt:SetValue("Skirts:")
for i=0, (carlist[vehiCheck].skirts) do
	skirt:AddChoice("Skirts Option " .. i + 1, i, false)
end
skirt.Paint = function( self, w, h ) draw.RoundedBox( 4, 0, 0, w, h, Color( 50,50,50, 100 ) ) end
skirt.OnSelect = function( panel, index, value )
chat.PlaySound()
skirts = index
total = 1000
prev.Entity:SetBodygroup(carlist[vehiCheck].skirtsoffset,index)
buycustomsButton:SetText("Buy upgrades for " .. carlist[number].car .. ": $" .. total)
end

image = vgui.Create( "DImage", panel )
image:Dock(FILL)				// Set position
image:SetImage( "race/race.png" )	// Set the material - relative to /materials/ directory
image:SizeToContents()

local hood = vgui.Create( "DComboBox", panel )

hood:SetPos(675,250)
hood:SetSize(200,100)
hood:Dock(TOP)
hood:SetValue("Hoods:")
for i=0, (carlist[vehiCheck].hoods) do
	hood:AddChoice("Hood Option " .. i + 1, i, false)
end
hood.Paint = function( self, w, h ) draw.RoundedBox( 4, 0, 0, w, h, Color( 50,50,50, 100 ) ) end
hood.OnSelect = function( panel, index, value )
chat.PlaySound()
hoods = index
prev.Entity:SetBodygroup(carlist[vehiCheck].hoodsoffset,index)
total = 1000
buycustomsButton:SetText("Buy upgrades for " .. carlist[number].car .. ": $" .. total)
end

local wing = vgui.Create( "DComboBox", panel )

wing:SetPos(450,350)
wing:SetSize(200,100)
wing:Dock(TOP)
wing:SetValue("Spoilers:")
for i=0, (carlist[vehiCheck].spoilers) do
	wing:AddChoice("Spoiler Option " .. i + 1, i, false)
end
wing.Paint = function( self, w, h ) draw.RoundedBox( 4, 0, 0, w, h, Color( 50,50,50, 100 ) ) end
wing.OnSelect = function( panel, index, value )
chat.PlaySound()
wings = index
prev.Entity:SetBodygroup(carlist[vehiCheck].wingsoffset,index)
total = 1000
buycustomsButton:SetText("Buy upgrades for " .. carlist[number].car .. ": $" .. total)
end

local wheels = vgui.Create( "DComboBox", panel )

wheels:SetPos(675,350)
wheels:Dock(TOP)
wheels:SetSize(200,100)
wheels:SetValue("Wheels:")
for i=0, (carlist[vehiCheck].wheels) do
	wheels:AddChoice("Wheels Option " .. i + 1, i, false)
end
wheels.Paint = function( self, w, h ) draw.RoundedBox( 4, 0, 0, w, h, Color( 50,50,50, 100 ) ) end
wheels.OnSelect = function( panel, index, value )
chat.PlaySound()
wheelz = index
prev.Entity:SetBodygroup(carlist[vehiCheck].wheelsoffset,index)
total = 1000
buycustomsButton:SetText("Buy upgrades for " .. carlist[number].car .. ": $" .. total)
end


function buyButton:DoClick()
	net.Start("buyCar")
	net.WriteInt(number,32)
	net.SendToServer()
	
end

function colorbutton:OnMousePressed()
	chat.PlaySound()
	local coloris = Color(GetConVarNumber( "ColorRed" ), GetConVarNumber("ColorGreen"), GetConVarNumber("ColorBlue"))
	net.Start("color")
	net.WriteInt(GetConVarNumber("ColorRed"), 32)
	net.WriteInt(GetConVarNumber("ColorGreen"), 31)
	net.WriteInt(GetConVarNumber("ColorBlue"), 30)
	net.WriteColor(coloris)
	net.SendToServer()

end

function colormenubutton:OnMousePressed()
	chat.PlaySound()
	menu:SetVisible(false)
	ColorMenu:SetVisible(true)

end



function carmenubutton:OnMousePressed()
	chat.PlaySound()
	menu:SetVisible(false)
	vendermenu:SetVisible(true)
end

function backbutton:OnMousePressed()
	chat.PlaySound()
	flamemenu:SetVisible(false)
	customize:SetVisible(true)
end

function flamebutton:OnMousePressed() 
	chat.PlaySound()
	if fchoices == nil then
		fchoices = 0
	end
	
	net.Start("buyFlames")
	net.WriteString(tostring(fchoices))
	net.SendToServer()
end

function customizecarsbutton:OnMousePressed()
	chat.PlaySound()
	menu:SetVisible(false)
	customize:SetVisible(true)
end

function buycustomsButton:DoClick() 
	chat.PlaySound()
	if frontbump == nil then
		frontbump = 0
	end
	if rearbump == nil then
		rearbump = 0
	end
	if skirts == nil then
		skirts = 0
	end
	if hoods == nil then
		hoods = 0
	end
	if wings == nil then
		wings = 0
	end
	if wheelz == nil then
		wheelz = 0
	end
	
	if number == 0 then
		avg = ("000" .. frontbump .. rearbump .. skirts .. hoods  .. "0" .. wings  .. wheelz )
	end
	if number == 1 then
		avg = ("000" .. frontbump  .. rearbump  .. hoods  .. skirts  .. wings  .. wheelz )
	end
	if number == 2 then
		avg = ("000" .. frontbump  .. rearbump  .. hoods  .. skirts  .. wings  .. "0" .. wheelz )
	end
	if number == 3 then
		avg = ("000" .. frontbump  .. rearbump  .. skirts  .. hoods  .. wings  .. wheelz )
	end
	if number == 4 then
		avg = ("000" .. frontbump  .. rearbump  .. skirts  .. hoods  .. wings  .. wheelz )
	end
	if number == 5 then
		avg = ("000" .. frontbump  .. rearbump  .. skirts  .. wings  .. "0" .. wheelz )
	end
	if number == 6 then
		avg = ("000" .. frontbump  .. skirts  .. rearbump  .. wings  )
	end

	
	net.Start("buyCustoms")
	net.WriteString(avg)
	net.SendToServer()
	frontbump = 0
	rearbump = 0
	skirts = 0
	hoods = 0
	wings = 0
	wheelz = 0
end



end)



