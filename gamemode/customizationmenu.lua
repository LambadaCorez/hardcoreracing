


CreateClientConVar("ColorRed",0,true,false,"")
CreateClientConVar("ColorGreen",0,true,false,"")
CreateClientConVar("ColorBlue",0,true,false,"")

carlist = {}


carlist[1] = {car = "Nissan Silvia S15"}


carlist[4] = {car = "Nissan Skyline R34"}


carlist[5] = {car = "Nissan 370Z"}
carlist[3] = {car = "Mitsubishi Evolution X"}
carlist[0] = {car = "Mitsubishi Eclipse GSX"}
carlist[6] = {car = "Mitsubishi Eclipse GT"}
carlist[2] = {car = "Mitsubishi Evolution VIII"}


cars = {}

cars[0] = {car = "models/tdmcars/mit_eclipsegsx.mdl"}
cars[1] = {car = "models/tdmcars/nissan_silvias15.mdl"}
cars[2] = {car = "models/tdmcars/mitsu_evo8.mdl"}
cars[3] = {car = "models/tdmcars/mitsu_evox.mdl"}
cars[4] = {car = "models/tdmcars/skyline_r34.mdl"}
cars[5] = {car = "models/tdmcars/nis_370z.mdl"}
cars[6] = {car = "models/tdmcars/mitsu_eclipgt.mdl"}

net.Receive("openCustomMenu", function()
local col = Color(GetConVarNumber( "ColorRed" ), GetConVarNumber("ColorGreen"), GetConVarNumber("ColorBlue"), 255)
local ply = LocalPlayer()
local menu = vgui.Create("DFrame")
local number = tonumber(ply:GetNWInt("pCar"))
local total = 0
local frontbump = 0
local rearbump = 0
local skirts = 0
local hood = 0
local wing = 0
local wheels = 0
local avg = 0
	
	menu:SetSize(250,500)
	menu:SetPos((ScrW()/2) - 125, (ScrH()/2) - 250)
	menu:SetTitle("Customization Menu")
	menu:SetDraggable(false)
	menu:ShowCloseButton(true)
	menu:MakePopup(true)
	
	local colormenubutton = vgui.Create("Button", menu)
	colormenubutton:SetSize(50,50)
	colormenubutton:Dock( TOP )
	colormenubutton:SetText("Customize Car Color")
	
	local carmenubutton = vgui.Create("Button", menu)
	carmenubutton:SetSize((ScrW()/2)-400,50)
	carmenubutton:Center()
	carmenubutton:DockPadding( 0, 0, 0, 0 )
	carmenubutton:SetText("Buy Cars")
	
	local customizecarsbutton = vgui.Create("Button", menu)
	customizecarsbutton:SetSize(50,50)
	customizecarsbutton:Dock( BOTTOM )
	customizecarsbutton:SetText("Customize Car")
	
	
	
	
	
	
	
	
	
	
	
	local ColorMenu = vgui.Create("DFrame")
	
	ColorMenu:SetSize(250,500)
	ColorMenu:SetPos((ScrW()/2) +125, (ScrH()/2) - 250)
	ColorMenu:SetTitle("Color Picker")
	ColorMenu:SetDraggable(false)
	ColorMenu:SetVisible(false)
	ColorMenu:ShowCloseButton(true)
	ColorMenu:MakePopup(true)
	
	local preview = vgui.Create( "DModelPanel", ColorMenu )
	preview:SetSize( 100,100 )
	preview:Dock(FILL)
	
	preview:SetModel( cars[tonumber(ply:GetNWInt("pCar"))].car )
	
	
	local mn, mx = preview.Entity:GetRenderBounds()
	local size = 0
	size = math.max( size, math.abs( mn.x ) + math.abs( mx.x ) )
	size = math.max( size, math.abs( mn.y ) + math.abs( mx.y ) )
	size = math.max( size, math.abs( mn.z ) + math.abs( mx.z ) )

	preview:SetFOV( 35 )
	preview:SetCamPos( Vector( size, size, size ) )
	preview:SetLookAt( ( mn + mx ) *.2 )
	
	local colorpick = vgui.Create( "DColorMixer", ColorMenu )
	colorpick:Dock( TOP )
	colorpick:SetPalette( true )
	colorpick:SetAlphaBar( false )	
	colorpick:SetWangs( true )
	colorpick:SetColor( col )
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
	colorbutton:SetText("Set This Color")
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	local vendermenu = vgui.Create("DFrame")
	
	vendermenu:SetSize(750,500)
	vendermenu:SetPos((ScrW()/2)-110, (ScrH()/2)-250)
	vendermenu:SetTitle("Buy Cars")
	vendermenu:SetVisible( false )
	vendermenu:SetDraggable( false )
	vendermenu:ShowCloseButton(true)
	vendermenu:MakePopup(true)
	
	
	
	
	local DScrollPanel = vgui.Create( "DScrollPanel", vendermenu )
	DScrollPanel:Dock( FILL )

		local buttonlist0 = DScrollPanel:Add( "DButton" )
		local buttonlist1 = DScrollPanel:Add( "DButton" )
		local buttonlist2 = DScrollPanel:Add( "DButton" )
		local buttonlist3 = DScrollPanel:Add( "DButton" )
		local buttonlist4 = DScrollPanel:Add( "DButton" )
		local buttonlist5 = DScrollPanel:Add( "DButton" )
		local buttonlist6 = DScrollPanel:Add( "DButton" )
		buttonlist0:SetText( "Mitsubishi Eclipse GSX: $2000" )
		
		buttonlist1:SetText( "Nissan Silvia S15: $5000" )
		
		buttonlist2:SetText( "Mitsubishi Evolution VIII: $5500" )
		
		buttonlist3:SetText( "Mitsubishi Evolution X: $6000" )
		
		buttonlist4:SetText( "Nissan Skyline R34: $8000" )
		
		buttonlist5:SetText( "Nissan 370Z: $4000" )
		
		buttonlist6:SetText( "Mitsubishi Eclipse GT: $3000" )
		
		buttonlist0:SetSize( 150, 100 )
		buttonlist0:Dock( TOP )
		buttonlist0:DockMargin( 0, 0, 0, 5 )
	
		buttonlist1:SetSize( 150, 100 )
		buttonlist1:Dock( TOP )
		buttonlist1:DockMargin( 0, 0, 0, 5 )
		
		buttonlist2:SetSize( 150, 100 )
		buttonlist2:Dock( TOP )
		buttonlist2:DockMargin( 0, 0, 0, 5 )
		
		buttonlist3:SetSize( 150, 100 )
		buttonlist3:Dock( TOP )
		buttonlist3:DockMargin( 0, 0, 0, 5 )
		
		buttonlist4:SetSize( 150, 100 )
		buttonlist4:Dock( TOP )
		buttonlist4:DockMargin( 0, 0, 0, 5 )
		
		buttonlist5:SetSize( 150, 100 )
		buttonlist5:Dock( TOP )
		buttonlist5:DockMargin( 0, 0, 0, 5 )
		
		buttonlist6:SetSize( 150, 100 )
		buttonlist6:Dock( TOP )
		buttonlist6:DockMargin( 0, 0, 0, 5 )
		
		buttonlist0:SetMouseInputEnabled( true )
		buttonlist1:SetMouseInputEnabled( true )
		buttonlist2:SetMouseInputEnabled( true )
		buttonlist3:SetMouseInputEnabled( true )
		buttonlist4:SetMouseInputEnabled( true )
		buttonlist5:SetMouseInputEnabled( true )
		buttonlist6:SetMouseInputEnabled( true )
		
	
	
	
	local car = vgui.Create( "DModelPanel", vendermenu )
	car:SetSize( 400,400 )
	car:Dock(LEFT)
	
	car:SetModel( cars[number].car )
	car:SetColor(col)
	
	local mn, mx = car.Entity:GetRenderBounds()
	local size = 0
	size = math.max( size, math.abs( mn.x ) + math.abs( mx.x ) )
	size = math.max( size, math.abs( mn.y ) + math.abs( mx.y ) )
	size = math.max( size, math.abs( mn.z ) + math.abs( mx.z ) )

	car:SetFOV( 35 )
	car:SetCamPos( Vector( size, size, size ) )
	car:SetLookAt( ( mn + mx ) *.2 )
	
	local buyButton = vgui.Create("DButton", vendermenu )
	buyButton:SetText("Buy the " .. carlist[number].car .. "?")
	buyButton:SetSize(0,45)
	buyButton:Dock(BOTTOM)
	
	function buttonlist0:DoClick()
	car:SetModel( cars[0].car )
	buyButton:SetText("Buy the " .. carlist[0].car .. "?")
	number = 0
	end
	
	function buttonlist1:DoClick()
	car:SetModel( cars[1].car )
	buyButton:SetText("Buy the " .. carlist[1].car .. "?")
	number = 1
	end
	
	function buttonlist2:DoClick()
	buyButton:SetText("Buy the " .. carlist[2].car .. "?")
	car:SetModel( cars[2].car )
	number = 2
	end
	
	function buttonlist3:DoClick()
	buyButton:SetText("Buy the " .. carlist[3].car .. "?")
	car:SetModel( cars[3].car )
	number = 3
	end
	
	function buttonlist4:DoClick()
	buyButton:SetText("Buy the " .. carlist[4].car .. "?")
	car:SetModel( cars[4].car )
	number = 4
	end 
	
	function buttonlist5:DoClick()
	buyButton:SetText("Buy the " .. carlist[5].car .. "?")
	car:SetModel( cars[5].car )
	number = 5
	end
	
	function buttonlist6:DoClick()
	buyButton:SetText("Buy the " .. carlist[6].car .. "?")
	car:SetModel( cars[6].car )
	number = 6
	end		
	
	
	
	
	
	local customize = vgui.Create("DFrame")
	
	
	customize:SetSize(900,600)
	customize:Center()
	customize:SetTitle("Customization Menu")
	customize:SetVisible( false )
	customize:SetDraggable( false )
	customize:ShowCloseButton(true)
	customize:MakePopup(true)
	
	local prev = vgui.Create( "DModelPanel", customize )
	
		prev:SetSize(400,400)
		prev:Dock(LEFT)
		prev:SetModel(cars[tonumber(ply:GetNWInt("pCar"))].car)
		prev:SetColor(col)
		prev.Angles = Angle( 0, 0, 0 )
	local mn, mx = prev.Entity:GetRenderBounds()
local size = 0
size = math.max( size, math.abs( mn.x ) + math.abs( mx.x ) )
size = math.max( size, math.abs( mn.y ) + math.abs( mx.y ) )
size = math.max( size, math.abs( mn.z ) + math.abs( mx.z ) )

prev:SetFOV( 45 )
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
	
	if number == 0 then -- mit gsx
	
	local fbumper = vgui.Create( "DComboBox", customize )
	
	fbumper:SetPos(450,150)
	fbumper:SetSize(200,100)
	fbumper:SetValue("Front Bumpers:")
	fbumper:AddChoice("Bumper 1", 0, false)
	fbumper:AddChoice("Bumper 2", 0, false)
	fbumper:AddChoice("Bumper 3", 1, false)
	fbumper:AddChoice("Bumper 4", 2, false)
	fbumper:AddChoice("Bumper 5", 3, false)
	fbumper:AddChoice("Bumper 6", 4, false)
	fbumper:AddChoice("Bumper 7", 5, false)
	fbumper.OnSelect = function( panel, index, value )
		frontbump = index
		prev.Entity:SetBodygroup(3,index - 1)
		total = 1000
		buycustomsButton:SetText("Buy upgrades for " .. carlist[number].car .. ": $" .. total)
	end
	
	local bbumper = vgui.Create( "DComboBox", customize )
	
	bbumper:SetPos(675,150)
	bbumper:SetSize(200,100)
	bbumper:SetValue("Rear Bumpers:")
	bbumper:AddChoice("Rear Bumper 1", 0, false)
	bbumper:AddChoice("Rear Bumper 2", 0, false)
	bbumper:AddChoice("Rear Bumper 3", 1, false)
	bbumper:AddChoice("Rear Bumper 4", 2, false)
	bbumper:AddChoice("Rear Bumper 5", 3, false)
	bbumper:AddChoice("Rear Bumper 6", 4, false)
	bbumper:AddChoice("Rear Bumper 7", 5, false)
	bbumper.OnSelect = function( panel, index, value )
		rearbump = index
		prev.Entity:SetBodygroup(4,index - 1)
		total = 1000
		buycustomsButton:SetText("Buy upgrades for " .. carlist[number].car .. ": $" .. total)
	end
	
	local skirt = vgui.Create( "DComboBox", customize )
	 
	skirt:SetPos(450,250)
	skirt:SetSize(200,100)
	skirt:SetValue("Skirts:")
	skirt:AddChoice("Skirt Option 1", 0, false)
	skirt:AddChoice("Skirt Option 2", 0, false)
	skirt:AddChoice("Skirt Option 3", 1, false)
	skirt:AddChoice("Skirt Option 4", 2, false)
	skirt:AddChoice("Skirt Option 5", 3, false)
	skirt:AddChoice("Skirt Option 6", 4, false)
	skirt.OnSelect = function( panel, index, value )
		skirts = index
		total = 1000
		prev.Entity:SetBodygroup(5,index - 1)
		
		buycustomsButton:SetText("Buy upgrades for " .. carlist[number].car .. ": $" .. total)
	end
	
	local hood = vgui.Create( "DComboBox", customize )
	
	hood:SetPos(675,250)
	hood:SetSize(200,100)
	hood:SetValue("Hoods:")
	hood:AddChoice("Hood Option 1", 0, false)
	hood:AddChoice("Hood Option 2", 0, false)
	hood.OnSelect = function( panel, index, value )
		hoods = index
		prev.Entity:SetBodygroup(6,index - 1)
		total = 1000
		buycustomsButton:SetText("Buy upgrades for " .. carlist[number].car .. ": $" .. total)
	end
	
	local wing = vgui.Create( "DComboBox", customize )
	
	wing:SetPos(450,350)
	wing:SetSize(200,100)
	wing:SetValue("Spoilers:")
	wing:AddChoice("Remove Spoiler", 0, false)
	wing:AddChoice("Spoiler Option 1", 0, false)
	wing:AddChoice("Spoiler Option 2", 1, false)
	wing:AddChoice("Spoiler Option 3", 2, false)
	wing.OnSelect = function( panel, index, value )
		wings = index
		prev.Entity:SetBodygroup(8,index - 1)
		total = 1000
		buycustomsButton:SetText("Buy upgrades for " .. carlist[number].car .. ": $" .. total)
	end
	
	local wheels = vgui.Create( "DComboBox", customize )
	
	wheels:SetPos(675,350)
	wheels:SetSize(200,100)
	wheels:SetValue("Wheels:")
	wheels:AddChoice("Tire Option 1", 0, false)
	wheels:AddChoice("Tire Option 2", 0, false)
	wheels:AddChoice("Tire Option 3", 1, false)
	wheels.OnSelect = function( panel, index, value )
		wheelz = index
		prev.Entity:SetBodygroup(9,index - 1)
		total = 1000
		buycustomsButton:SetText("Buy upgrades for " .. carlist[number].car .. ": $" .. total)
	end
	
	end
	
	if number == 1 then -- silvia
	
	local fbumper = vgui.Create( "DComboBox", customize )
	
	fbumper:SetPos(450,150)
	fbumper:SetSize(200,100)
	fbumper:SetValue("Front Bumpers:")
	fbumper:AddChoice("Bumper 1", 0, false)
	fbumper:AddChoice("Bumper 2", 0, false)
	fbumper:AddChoice("Bumper 3", 1, false)
	fbumper:AddChoice("Bumper 4", 2, false)
	fbumper:AddChoice("Bumper 5", 3, false)
	fbumper:AddChoice("Bumper 6", 4, false)
	fbumper:AddChoice("Bumper 7", 5, false)
	fbumper:AddChoice("Bumper 8", 6, false)
	fbumper.OnSelect = function( panel, index, value )
		frontbump = index
		prev.Entity:SetBodygroup(3,index - 1)
		total = 1000
		buycustomsButton:SetText("Buy upgrades for " .. carlist[number].car .. ": $" .. total)
	end
	
	local bbumper = vgui.Create( "DComboBox", customize )
	
	bbumper:SetPos(675,150)
	bbumper:SetSize(200,100)
	bbumper:SetValue("Rear Bumpers:")
	bbumper:AddChoice("Rear Bumper 1", 0, false)
	bbumper:AddChoice("Rear Bumper 2", 0, false)
	bbumper:AddChoice("Rear Bumper 3", 1, false)
	bbumper:AddChoice("Rear Bumper 4", 2, false)
	bbumper:AddChoice("Rear Bumper 5", 3, false)
	bbumper:AddChoice("Rear Bumper 6", 4, false)
	bbumper:AddChoice("Rear Bumper 7", 5, false)
	bbumper:AddChoice("Rear Bumper 8", 6, false)
	bbumper.OnSelect = function( panel, index, value )
		rearbump = index
		prev.Entity:SetBodygroup(4,index - 1)
		total = 1000
		buycustomsButton:SetText("Buy upgrades for " .. carlist[number].car .. ": $" .. total)
	end
	
	local skirt = vgui.Create( "DComboBox", customize )
	
	skirt:SetPos(450,250)
	skirt:SetSize(200,100)
	skirt:SetValue("Skirts:")
	skirt:AddChoice("Skirt Option 1", 0, false)
	skirt:AddChoice("Skirt Option 2", 0, false)
	skirt:AddChoice("Skirt Option 3", 1, false)
	skirt:AddChoice("Skirt Option 4", 2, false)
	skirt:AddChoice("Skirt Option 5", 3, false)
	skirt.OnSelect = function( panel, index, value )
		skirts = index
		total = 1000
		prev.Entity:SetBodygroup(6,index - 1)
		
		buycustomsButton:SetText("Buy upgrades for " .. carlist[number].car .. ": $" .. total)
	end
	
	local hood = vgui.Create( "DComboBox", customize )
	
	hood:SetPos(675,250)
	hood:SetSize(200,100)
	hood:SetValue("Hoods:")
	hood:AddChoice("Hood Option 1", 0, false)
	hood:AddChoice("Hood Option 2", 0, false)
	hood:AddChoice("Hood Option 3", 1, false)
	hood.OnSelect = function( panel, index, value )
		hoods = index
		prev.Entity:SetBodygroup(5,index - 1)
		total = 1000
		buycustomsButton:SetText("Buy upgrades for " .. carlist[number].car .. ": $" .. total)
	end
	
	
	local wing = vgui.Create( "DComboBox", customize )
	
	wing:SetPos(450,350)
	wing:SetSize(200,100)
	wing:SetValue("Spoilers:")
	wing:AddChoice("Remove Spoiler", 0, false)
	wing:AddChoice("Spoiler Option 1", 0, false)
	wing:AddChoice("Spoiler Option 2", 1, false)
	wing:AddChoice("Spoiler Option 3", 2, false)
	wing.OnSelect = function( panel, index, value )
		
		wings = index
		prev.Entity:SetBodygroup(7,index - 1)
		total = 1000
		buycustomsButton:SetText("Buy upgrades for " .. carlist[number].car .. ": $" .. total)
	end
	
	local wheels = vgui.Create( "DComboBox", customize )
	
	wheels:SetPos(675,350)
	wheels:SetSize(200,100)
	wheels:SetValue("Wheels:")
	wheels:AddChoice("Tire Option 1", 0, false)
	wheels:AddChoice("Tire Option 2", 0, false)
	wheels:AddChoice("Tire Option 3", 1, false)
	wheels.OnSelect = function( panel, index, value )
		wheelz = index
		prev.Entity:SetBodygroup(8,index - 1)
		total = 1000
		buycustomsButton:SetText("Buy upgrades for " .. carlist[number].car .. ": $" .. total)
	end
	
	end
	
	if number == 2 then -- mit evo 8
	
	local fbumper = vgui.Create( "DComboBox", customize )
	
	fbumper:SetPos(450,150)
	fbumper:SetSize(200,100)
	fbumper:SetValue("Front Bumpers:")
	fbumper:AddChoice("Bumper 1", 0, false)
	fbumper:AddChoice("Bumper 2", 0, false)
	fbumper:AddChoice("Bumper 3", 1, false)
	fbumper:AddChoice("Bumper 4", 2, false)
	fbumper:AddChoice("Bumper 5", 3, false)
	fbumper:AddChoice("Bumper 6", 4, false)
	fbumper:AddChoice("Bumper 7", 5, false)
	fbumper:AddChoice("Bumper 8", 6, false)
	fbumper.OnSelect = function( panel, index, value )
		frontbump = index
		prev.Entity:SetBodygroup(3,index - 1)
		total = 1000
		buycustomsButton:SetText("Buy upgrades for " .. carlist[number].car .. ": $" .. total)
	end
	
	local bbumper = vgui.Create( "DComboBox", customize )
	
	bbumper:SetPos(675,150)
	bbumper:SetSize(200,100)
	bbumper:SetValue("Rear Bumpers:")
	bbumper:AddChoice("Rear Bumper 1", 0, false)
	bbumper:AddChoice("Rear Bumper 2", 0, false)
	bbumper:AddChoice("Rear Bumper 3", 1, false)
	bbumper:AddChoice("Rear Bumper 4", 2, false)
	bbumper:AddChoice("Rear Bumper 5", 3, false)
	bbumper:AddChoice("Rear Bumper 6", 4, false)
	bbumper:AddChoice("Rear Bumper 7", 5, false)
	bbumper.OnSelect = function( panel, index, value )
		rearbump = index
		prev.Entity:SetBodygroup(4,index - 1)
		total = 1000
		buycustomsButton:SetText("Buy upgrades for " .. carlist[number].car .. ": $" .. total)
	end
	
	local skirt = vgui.Create( "DComboBox", customize )
	
	skirt:SetPos(450,250)
	skirt:SetSize(200,100)
	skirt:SetValue("Skirts:")
	skirt:AddChoice("Skirt Option 1", 0, false)
	skirt:AddChoice("Skirt Option 2", 0, false)
	skirt.OnSelect = function( panel, index, value )
		skirts = index
		total = 1000
		prev.Entity:SetBodygroup(6,index - 1)
		
		buycustomsButton:SetText("Buy upgrades for " .. carlist[number].car .. ": $" .. total)
	end
	
	local hood = vgui.Create( "DComboBox", customize )
	
	hood:SetPos(675,250)
	hood:SetSize(200,100)
	hood:SetValue("Hoods:")
	hood:AddChoice("Hood Option 1", 0, false)
	hood:AddChoice("Hood Option 2", 0, false)
	hood:AddChoice("Hood Option 3", 1, false)
	hood:AddChoice("Hood Option 4", 2, false)
	hood:AddChoice("Hood Option 5", 3, false)
	hood:AddChoice("Hood Option 6", 4, false)
	hood:AddChoice("Hood Option 7", 5, false)
	hood.OnSelect = function( panel, index, value )
		hoods = index
		prev.Entity:SetBodygroup(5,index - 1)
		total = 1000
		buycustomsButton:SetText("Buy upgrades for " .. carlist[number].car .. ": $" .. total)
	end
	
	
	local wing = vgui.Create( "DComboBox", customize )
	
	wing:SetPos(450,350)
	wing:SetSize(200,100)
	wing:SetValue("Spoilers:")
	wing:AddChoice("Remove Spoiler", 0, false)
	wing:AddChoice("Spoiler Option 1", 0, false)
	wing:AddChoice("Spoiler Option 2", 1, false)
	wing:AddChoice("Spoiler Option 3", 2, false)
	wing:AddChoice("Spoiler Option 4", 3, false)
	wing:AddChoice("Spoiler Option 5", 4, false)
	wing:AddChoice("Spoiler Option 6", 5, false)
	wing.OnSelect = function( panel, index, value )
		
		wings = index
		prev.Entity:SetBodygroup(7,index - 1)
		total = 1000
		buycustomsButton:SetText("Buy upgrades for " .. carlist[number].car .. ": $" .. total)
	end
	
	local roll = vgui.Create( "DComboBox", customize )
	
	roll:SetPos(675,350)
	roll:SetSize(200,100)
	roll:SetValue("Rollcages:")
	roll:AddChoice("Rollcage Off", 0, false)
	roll:AddChoice("Rollcage On", 1, false)
	roll.OnSelect = function( panel, index, value )
		rollcage = index
		prev.Entity:SetBodygroup(8,index - 1)
		total = 1000
		buycustomsButton:SetText("Buy upgrades for " .. carlist[number].car .. ": $" .. total)
	end
	
	local wheels = vgui.Create( "DComboBox", customize )
	
	wheels:SetPos(675,350)
	wheels:SetSize(200,100)
	wheels:SetValue("Wheels:")
	wheels:AddChoice("Tire Option 1", 0, false)
	wheels:AddChoice("Tire Option 2", 0, false)
	wheels.OnSelect = function( panel, index, value )
		wheelz = index
		prev.Entity:SetBodygroup(9,index - 1)
		total = 1000
		buycustomsButton:SetText("Buy upgrades for " .. carlist[number].car .. ": $" .. total)
	end
	
	end
	
	if number == 3 then -- mit evo x
	
	
	local fbumper = vgui.Create( "DComboBox", customize )
	
	fbumper:SetPos(450,150)
	fbumper:SetSize(200,100)
	fbumper:SetValue("Front Bumpers:")
	fbumper:AddChoice("Bumper 1", 0, false)
	fbumper:AddChoice("Bumper 2", 1, false)
	fbumper:AddChoice("Bumper 3", 2, false)
	fbumper:AddChoice("Bumper 4", 3, false)
	fbumper:AddChoice("Bumper 5", 4, false)
	fbumper:AddChoice("Bumper 6", 5, false)
	fbumper:AddChoice("Bumper 7", 6, false)
	fbumper:AddChoice("Bumper 8", 7, false)
	fbumper.OnSelect = function( panel, index, value )
		frontbump = index
		prev.Entity:SetBodygroup(3,index)
		total = 1000
		buycustomsButton:SetText("Buy upgrades for " .. carlist[number].car .. ": $" .. total)
	end
	
	local bbumper = vgui.Create( "DComboBox", customize )
	
	bbumper:SetPos(675,150)
	bbumper:SetSize(200,100)
	bbumper:SetValue("Rear Bumpers:")
	bbumper:AddChoice("Rear Bumper 1", 0, false)
	bbumper:AddChoice("Rear Bumper 2", 1, false)
	bbumper:AddChoice("Rear Bumper 3", 2, false)
	bbumper:AddChoice("Rear Bumper 4", 3, false)
	bbumper:AddChoice("Rear Bumper 5", 4, false)
	bbumper:AddChoice("Rear Bumper 6", 5, false)
	bbumper:AddChoice("Rear Bumper 7", 6, false)
	bbumper:AddChoice("Rear Bumper 8", 7, false)
	bbumper.OnSelect = function( panel, index, value )
		rearbump = index
		prev.Entity:SetBodygroup(4,index)
		total = 1000
		buycustomsButton:SetText("Buy upgrades for " .. carlist[number].car .. ": $" .. total)
	end
	
	local skirt = vgui.Create( "DComboBox", customize )
	
	skirt:SetPos(450,250)
	skirt:SetSize(200,100)
	skirt:SetValue("Skirts:")
	skirt:AddChoice("Skirt Option 1", 0, false)
	skirt:AddChoice("Skirt Option 2", 1, false)
	skirt.OnSelect = function( panel, index, value )
		skirts = index
		total = 1000
		prev.Entity:SetBodygroup(5,index)
		
		buycustomsButton:SetText("Buy upgrades for " .. carlist[number].car .. ": $" .. total)
	end
	
	local hood = vgui.Create( "DComboBox", customize )
	
	hood:SetPos(675,250)
	hood:SetSize(200,100)
	hood:SetValue("Hoods:")
	hood:AddChoice("Hood Option 1", 0, false)
	hood:AddChoice("Hood Option 2", 1, false)
	hood.OnSelect = function( panel, index, value )
		hoods = index
		prev.Entity:SetBodygroup(6,index)
		total = 1000
		buycustomsButton:SetText("Buy upgrades for " .. carlist[number].car .. ": $" .. total)
	end
	
	
	local wing = vgui.Create( "DComboBox", customize )
	
	wing:SetPos(450,350)
	wing:SetSize(200,100)
	wing:SetValue("Spoilers:")
	wing:AddChoice("Spoiler Option 1", 0, false)
	wing:AddChoice("Spoiler Option 2", 1, false)
	wing:AddChoice("Spoiler Option 3", 2, false)
	wing:AddChoice("Remove Spoiler", 0, false)
	wing.OnSelect = function( panel, index, value )
		
		wings = index
		prev.Entity:SetBodygroup(7,index)
		total = 1000
		buycustomsButton:SetText("Buy upgrades for " .. carlist[number].car .. ": $" .. total)
	end
	
	local wheels = vgui.Create( "DComboBox", customize )
	
	wheels:SetPos(675,350)
	wheels:SetSize(200,100)
	wheels:SetValue("Wheels:")
	wheels:AddChoice("Tire Option 1", 0, false)
	wheels:AddChoice("Tire Option 2", 1, false)
	wheels.OnSelect = function( panel, index, value )
		wheelz = index
		prev.Entity:SetBodygroup(8,index)
		total = 1000
		buycustomsButton:SetText("Buy upgrades for " .. carlist[number].car .. ": $" .. total)
	end
	end
	
	if number == 4 then -- gtr
	
	local fbumper = vgui.Create( "DComboBox", customize )
	
	fbumper:SetPos(450,150)
	fbumper:SetSize(200,100)
	fbumper:SetValue("Front Bumpers:")
	fbumper:AddChoice("Bumper 2", 0, false)
	fbumper:AddChoice("Bumper 3", 1, false)
	fbumper:AddChoice("Bumper 4", 2, false)
	fbumper:AddChoice("Bumper 5", 3, false)
	fbumper:AddChoice("Bumper 6", 4, false)
	fbumper:AddChoice("Bumper 7", 5, false)
	fbumper.OnSelect = function( panel, index, value )
		frontbump = index - 2
		prev.Entity:SetBodygroup(3,index - 1)
		total = 1000
		buycustomsButton:SetText("Buy upgrades for " .. carlist[number].car .. ": $" .. total)
	end
	
	local bbumper = vgui.Create( "DComboBox", customize )
	
	bbumper:SetPos(675,150)
	bbumper:SetSize(200,100)
	bbumper:SetValue("Rear Bumpers:")
	bbumper:AddChoice("Rear Bumper 2", 0, false)
	bbumper:AddChoice("Rear Bumper 3", 1, false)
	bbumper:AddChoice("Rear Bumper 4", 2, false)
	bbumper:AddChoice("Rear Bumper 5", 3, false)
	bbumper:AddChoice("Rear Bumper 6", 4, false)
	bbumper:AddChoice("Rear Bumper 7", 5, false)
	bbumper.OnSelect = function( panel, index, value )
		rearbump = index
		prev.Entity:SetBodygroup(4,index - 1)
		total = 1000
		buycustomsButton:SetText("Buy upgrades for " .. carlist[number].car .. ": $" .. total)
	end
	
	local skirt = vgui.Create( "DComboBox", customize )
	
	skirt:SetPos(450,250)
	skirt:SetSize(200,100)
	skirt:SetValue("Skirts:")
	skirt:AddChoice("Skirt Option 2", 0, false)
	skirt:AddChoice("Skirt Option 3", 1, false)
	skirt:AddChoice("Skirt Option 4", 2, false)
	skirt:AddChoice("Skirt Option 5", 3, false)
	skirt:AddChoice("Skirt Option 6", 4, false)
	skirt.OnSelect = function( panel, index, value )
		skirts = index
		total = 1000
		prev.Entity:SetBodygroup(5,index - 1)
		
		buycustomsButton:SetText("Buy upgrades for " .. carlist[number].car .. ": $" .. total)
	end
	
	local hood = vgui.Create( "DComboBox", customize )
	
	hood:SetPos(675,250)
	hood:SetSize(200,100)
	hood:SetValue("Hoods:")
	hood:AddChoice("Hood Option 2", 0, false)
	hood:AddChoice("Hood Option 3", 1, false)
	hood.OnSelect = function( panel, index, value )
		hoods = index
		prev.Entity:SetBodygroup(6,index - 1)
		total = 1000
		buycustomsButton:SetText("Buy upgrades for " .. carlist[number].car .. ": $" .. total)
	end
	
	
	local wing = vgui.Create( "DComboBox", customize )
	
	wing:SetPos(450,350)
	wing:SetSize(200,100)
	wing:SetValue("Spoilers:")
	wing:AddChoice("Spoiler Option 1", 0, false)
	wing:AddChoice("Spoiler Option 2", 1, false)
	wing:AddChoice("Spoiler Option 3", 2, false)
	wing:AddChoice("Spoiler Option 4", 3, false)
	wing.OnSelect = function( panel, index, value )
		
		wings = index
		prev.Entity:SetBodygroup(7,index - 1)
		total = 1000
		buycustomsButton:SetText("Buy upgrades for " .. carlist[number].car .. ": $" .. total)
	end
	
	local wheels = vgui.Create( "DComboBox", customize )
	
	wheels:SetPos(675,350)
	wheels:SetSize(200,100)
	wheels:SetValue("Wheels:")
	wheels:AddChoice("Tire Option 2", 0, false)
	wheels:AddChoice("Tire Option 3", 1, false)
	wheels.OnSelect = function( panel, index, value )
		wheelz = index
		prev.Entity:SetBodygroup(8,index - 1)
		total = 1000
		buycustomsButton:SetText("Buy upgrades for " .. carlist[number].car .. ": $" .. total)
	end
	
	end
	
	if number == 5 then -- 370z

	local fbumper = vgui.Create( "DComboBox", customize )
	
	fbumper:SetPos(450,150)
	fbumper:SetSize(200,100)
	fbumper:SetValue("Front Bumpers:")
	fbumper:AddChoice("Bumper 2", 0, false)
	fbumper:AddChoice("Bumper 3", 1, false)
	fbumper:AddChoice("Bumper 4", 2, false)
	fbumper.OnSelect = function( panel, index, value )
		frontbump = index
		prev.Entity:SetBodygroup(3,index - 1)
		total = 1000
		buycustomsButton:SetText("Buy upgrades for " .. carlist[number].car .. ": $" .. total)
	end
	
	local bbumper = vgui.Create( "DComboBox", customize )
	
	bbumper:SetPos(675,150)
	bbumper:SetSize(200,100)
	bbumper:SetValue("Rear Bumpers:")
	bbumper:AddChoice("Rear Bumper 2", 0, false)
	bbumper:AddChoice("Rear Bumper 3", 1, false)
	bbumper.OnSelect = function( panel, index, value )
		rearbump = index
		prev.Entity:SetBodygroup(4,index - 1)
		total = 1000
		buycustomsButton:SetText("Buy upgrades for " .. carlist[number].car .. ": $" .. total)
	end
	
	local skirt = vgui.Create( "DComboBox", customize )
	
	skirt:SetPos(450,250)
	skirt:SetSize(200,100)
	skirt:SetValue("Skirts:")
	skirt:AddChoice("Skirt Option 1", 0, false)
	skirt:AddChoice("Skirt Option 2", 1, false)
	skirt.OnSelect = function( panel, index, value )
		skirts = index
		total = 1000
		prev.Entity:SetBodygroup(5,index - 1)
		
		buycustomsButton:SetText("Buy upgrades for " .. carlist[number].car .. ": $" .. total)
	end
	
	local roll = vgui.Create( "DComboBox", customize )
	
	roll:SetPos(450,350)
	roll:SetSize(200,100)
	roll:SetValue("Rollcages:")
	roll:AddChoice("Rollcage Off", 0, false)
	roll:AddChoice("Rollcage On", 1, false)
	roll.OnSelect = function( panel, index, value )
		rollcage = index
		prev.Entity:SetBodygroup(7,index - 1)
		total = 1000
		buycustomsButton:SetText("Buy upgrades for " .. carlist[number].car .. ": $" .. total)
	end
	
	local wing = vgui.Create( "DComboBox", customize )
	
	wing:SetPos(675,250)
	wing:SetSize(200,100)
	wing:SetValue("Spoilers:")
	wing:AddChoice("Remove Spoiler", 0, false)
	wing:AddChoice("Spoiler Option 1", 0, false)	
	wing:AddChoice("Spoiler Option 2", 1, false)
	wing:AddChoice("Spoiler Option 3", 2, false)
	wing.OnSelect = function( panel, index, value )
		
		wings = index
		prev.Entity:SetBodygroup(6,index - 1)
		total = 1000
		buycustomsButton:SetText("Buy upgrades for " .. carlist[number].car .. ": $" .. total)
	end
	
	local wheels = vgui.Create( "DComboBox", customize )
	
	wheels:SetPos(675,350)
	wheels:SetSize(200,100)
	wheels:SetValue("Wheels:")
	wheels:AddChoice("Tire Option 1", 0, false)
	wheels:AddChoice("Tire Option 2", 1, false)
	wheels:AddChoice("Tire Option 3", 2, false)
	wheels.OnSelect = function( panel, index, value )
		wheelz = index
		prev.Entity:SetBodygroup(8,index - 1)
		total = 1000
		buycustomsButton:SetText("Buy upgrades for " .. carlist[number].car .. ": $" .. total)
	end
	end
	
	if number == 6 then -- mit gt
	
	local fbumper = vgui.Create( "DComboBox", customize )
	
	fbumper:SetPos(450,150)
	fbumper:SetSize(200,100)
	fbumper:SetValue("Front Bumpers:")
	fbumper:AddChoice("Bumper 1", 0, false)
	fbumper:AddChoice("Bumper 2", 0, false)
	fbumper:AddChoice("Bumper 3", 1, false)
	fbumper:AddChoice("Bumper 4", 2, false)
	fbumper.OnSelect = function( panel, index, value )
		frontbump = index
		prev.Entity:SetBodygroup(3,index - 1)
		total = 1000
		buycustomsButton:SetText("Buy upgrades for " .. carlist[number].car .. ": $" .. total)
	end
	
	local skirt = vgui.Create( "DComboBox", customize )
	
	skirt:SetPos(450,250)
	skirt:SetSize(200,100)
	skirt:SetValue("Skirts:")
	skirt:AddChoice("Skirt Option 1", 0, false)
	skirt:AddChoice("Skirt Option 2", 1, false)
	skirt:AddChoice("Skirt Option 3", 2, false)
	skirt.OnSelect = function( panel, index, value )
		total = 1000
		prev.Entity:SetBodygroup(4,index - 1)
		skirts = index
		buycustomsButton:SetText("Buy upgrades for " .. carlist[number].car .. ": $" .. total)
	end
	
	local bbumper = vgui.Create( "DComboBox", customize )
	
	bbumper:SetPos(675,150)
	bbumper:SetSize(200,100)
	bbumper:SetValue("Rear Bumpers:")
	bbumper:AddChoice("Rear Bumper 1", 0, false)
	bbumper:AddChoice("Rear Bumper 2", 0, false)
	bbumper:AddChoice("Rear Bumper 3", 1, false)
	bbumper.OnSelect = function( panel, index, value )
		rearbump = index
		prev.Entity:SetBodygroup(5,index - 1)
		total = 1000
		buycustomsButton:SetText("Buy upgrades for " .. carlist[number].car .. ": $" .. total)
	end

	local wing = vgui.Create( "DComboBox", customize )
	
	wing:SetPos(450,350)
	wing:SetSize(200,100)
	wing:SetValue("Spoilers:")
	wing:AddChoice("Remove Spoiler", 0, false)
	wing:AddChoice("Spoiler Option 1", 0, false)
	wing.OnSelect = function( panel, index, value )
		
		wings = index - 1
		prev.Entity:SetBodygroup(6,index - 1)
		total = 1000
		buycustomsButton:SetText("Buy upgrades for " .. carlist[number].car .. ": $" .. total)
	end
	
	end
	 
	function buyButton:DoClick()
	net.Start("buyCar")
	net.WriteInt(number,32)
	net.SendToServer()
	
	end
	

	function colorbutton:OnMousePressed()
		local coloris = Color(GetConVarNumber( "ColorRed" ), GetConVarNumber("ColorGreen"), GetConVarNumber("ColorBlue"), 255)
		net.Start("color")
		net.WriteColor(coloris)
		net.SendToServer()
		
	end
	
	function colormenubutton:OnMousePressed()
	menu:SetVisible(false)
	ColorMenu:SetVisible(true)
		
	end
	
	function carmenubutton:OnMousePressed()
	menu:SetVisible(false)
	vendermenu:SetVisible(true)
	end
	
	function buycustomsButton:DoClick() 
	if number == 0 then
	avg = ("00" .. frontbump - 2 .. rearbump .. skirts .. hoods  .. "0" .. wings  .. wheelz )
	end
	if number == 1 then
	avg = ("00" .. frontbump  .. rearbump  .. hoods  .. skirts  .. wings  .. wheelz )
	end
	if number == 2 then
	avg = ("00" .. frontbump  .. rearbump  .. hoods  .. skirts  .. wings  .. "0" .. wheelz )
	end
	if number == 3 then
	avg = ("00" .. frontbump  .. rearbump  .. skirts  .. hoods  .. wings  .. wheelz )
	end
	if number == 4 then
	avg = ("00" .. frontbump  .. rearbump  .. skirts  .. hoods  .. wings  .. wheelz )
	end
	if number == 5 then
	avg = ("00" .. frontbump  .. rearbump  .. skirts  .. wings  .. "0" .. wheelz )
	end
	if number == 6 then
	avg = ("00" .. frontbump  .. skirts  .. rearbump  .. wings  )
	end
	net.Start("buyCustoms")
	net.WriteString(avg)
	net.SendToServer()
	end
	
	function customizecarsbutton:OnMousePressed()
	menu:SetVisible(false)
	customize:SetVisible(true)
	end
	
end)



