


CreateClientConVar("ColorRed",0,true,false,"")
CreateClientConVar("ColorGreen",0,true,false,"")
CreateClientConVar("ColorBlue",0,true,false,"")

carlist = {}

carlist[0] = {car = "Mitsubishi Eclipse GSX for $2000"}
carlist[1] = {car = "Nissan Silvia S15 for $5000"}
carlist[2] = {car = "Mitsubishi Evolution VIII for $5500"}
carlist[3] = {car = "Mitsubishi Evolution X for $6000"}
carlist[4] = {car = "Nissan Skyline R34 for $8000"}
carlist[5] = {car = "Nissan 370Z for $4000"}
carlist[6] = {car = "Mitsubishi Eclipse GT for $3000"}

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
local number = 0
	
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
	ColorMenu:SetPos((ScrW()/2) - 125, (ScrH()/2) - 250)
	ColorMenu:SetTitle("Color Picker")
	ColorMenu:SetDraggable(false)
	ColorMenu:SetVisible(false)
	ColorMenu:ShowCloseButton(true)
	ColorMenu:MakePopup(true)
	
	local colorpick = vgui.Create( "DColorMixer", ColorMenu )
	colorpick:Dock( TOP )
	colorpick:SetPalette( true )	
	colorpick:SetAlphaBar( false )	
	colorpick:SetWangs( true )
	colorpick:SetColor( col )
	function colorpick:ValueChanged()
		colorpick:SetConVarR("ColorRed")
		colorpick:SetConVarG("ColorGreen")
		colorpick:SetConVarB("ColorBlue")
	end
	
	
	local colorbutton = vgui.Create( "Button", ColorMenu )
	colorbutton:SetSize( 150, 30 )
	colorbutton:Dock( BOTTOM )
	colorbutton:SetVisible( true )
	colorbutton:SetText("Set This Color")
	
	
	
	local vendermenu = vgui.Create("DFrame")
	
	vendermenu:SetSize(750,500)
	vendermenu:Center()
	vendermenu:SetTitle("Buy Cars")
	vendermenu:SetVisible( false )
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
	buyButton:SetText("Are you going to buy the " .. carlist[number].car .. "?")
	buyButton:SetSize(0,45)
	buyButton:Dock(BOTTOM)
	
	function buttonlist0:DoClick()
	car:SetModel( cars[0].car )
	buyButton:SetText("Are you going to buy the " .. carlist[0].car .. "?")
	number = 0
	end
	
	function buttonlist1:DoClick()
	car:SetModel( cars[1].car )
	buyButton:SetText("Are you going to buy the " .. carlist[1].car .. "?")
	number = 1
	end
	
	function buttonlist2:DoClick()
	buyButton:SetText("Are you going to buy the " .. carlist[2].car .. "?")
	car:SetModel( cars[2].car )
	number = 2
	end
	
	function buttonlist3:DoClick()
	buyButton:SetText("Are you going to buy the " .. carlist[3].car .. "?")
	car:SetModel( cars[3].car )
	number = 3
	end
	
	function buttonlist4:DoClick()
	buyButton:SetText("Are you going to buy the " .. carlist[4].car .. "?")
	car:SetModel( cars[4].car )
	number = 4
	end
	
	function buttonlist5:DoClick()
	buyButton:SetText("Are you going to buy the " .. carlist[5].car .. "?")
	car:SetModel( cars[5].car )
	number = 5
	end
	
	function buttonlist6:DoClick()
	buyButton:SetText("Are you going to buy the " .. carlist[6].car .. "?")
	car:SetModel( cars[6].car )
	number = 6
	end		
	
		function buyButton:DoClick()
	
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
	
	
	
end)


function buttons()

	end


function view()



end