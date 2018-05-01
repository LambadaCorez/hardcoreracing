
mapRotation = {}

mapRotation[0] = {name="gmr_black_v2", path = "gmr_black_v2.bsp"}
mapRotation[1] = {name="gmr_figure8_v3", path = "gmr_figure8_v3.bsp"}
mapRotation[2] = {name="gmr_wariostadium", path = "gmr_wariostadium.bsp"}
mapRotation[3] = {name="gmr_doom_rc2", path = "gmr_doom_rc2.bsp"}
mapRotation[4] = {name="gmr_derby_v2", path = "gmr_derby_v2.bsp"}
mapRotation[4] = {name="gmr_cyberspace_rc", path = "gmr_cyberspace_rc.bsp"}


net.Receive("mapMenu", function( len )

	surface.PlaySound("UI/buttonclick.wav")

	local w = ScrW() / 2

	local h = ScrH() / 2

	local menu = vgui.Create("DFrame")
	menu:SetSize(w - (w / 64), h - (h / 64))
	menu:Center()
	menu:SetTitle("Changing map...")
	menu:SetDraggable(false)
	menu:ShowCloseButton(true)
	menu:MakePopup(true)
	menu.Paint = function()
	draw.RoundedBox( 8, 0, 0, menu:GetWide(), menu:GetTall(), Color( 0, 0, 0, 200 ) )
	Derma_DrawBackgroundBlur( menu, 4 )
end


local ds = vgui.Create( "DScrollPanel", menu )
ds:Dock( FILL )

for i = 0, table.Count(mapRotation) - 1 do

	local button = ds:Add( "DButton" )
	button:SetSize(50,50)
	button:SetText( mapRotation[i].name )
	button:Dock( TOP )
	button:DockMargin( 0, 0, 0, 5 )

end
end)