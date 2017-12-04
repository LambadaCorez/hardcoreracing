
resource.AddFile("materials/hud/race.vmt")
resource.AddFile("resource/fonts/titilliumweb-light.ttf")
resource.AddFile("resource/fonts/titilliumweb-regular.ttf")

surface.CreateFont( "HoveringFont", {
  font="Titillium Web",
  size= 15,
  weight=1000,
  outline=true,


} )

surface.CreateFont( "TimeFont", {
  font="Titillium Web Light",
  size= 15,
  weight=1000,
  outline=true,


} )

local texture = "layer/race"

local screenx = ScrW()/2

local screeny = ScrH()/2

hook.Add("HUDPaint", "hudTeam1", function()

	surface.SetDrawColor( 200, 0, 0, 255 );
	surface.SetTexture( surface.GetTextureID( texture ) );
	surface.DrawTexturedRect(ScrW()-135,ScrH()-250, 256,256);

end)