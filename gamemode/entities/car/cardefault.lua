


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


keyvalues = {}

keyvalues[0]={keyvalue="scripts/vehicles/tdmcars/mit_eclipsegsx.txt"}
keyvalues[1]={keyvalue="scripts/vehicles/tdmcars/nissilvs15.txt"}
keyvalues[2]={keyvalue="scripts/vehicles/tdmcars/mitsu_evo8.txt"}
keyvalues[3]={keyvalue="scripts/vehicles/tdmcars/mitsu_evox.txt"}
keyvalues[4]={keyvalue="scripts/vehicles/tdmcars/skyline_r34.txt"}		
keyvalues[5]={keyvalue="scripts/vehicles/tdmcars/370z.txt"}
keyvalues[6]={keyvalue="scripts/vehicles/tdmcars/mitsu_eclipgt.txt"}
keyvalues[7]={keyvalue="scripts/vehicles/tdmcars/mit_eclipsegsx.txt"}
keyvalues[8]={keyvalue="scripts/vehicles/tdmcars/mit_eclipsegsx.txt"}
keyvalues[9]={keyvalue="scripts/vehicles/tdmcars/mit_eclipsegsx.txt"}
keyvalues[10]={keyvalue="scripts/vehicles/tdmcars/mit_eclipsegsx.txt"}
keyvalues[11]={keyvalue="scripts/vehicles/tdmcars/mit_eclipsegsx.txt"}
keyvalues[12]={keyvalue="scripts/vehicles/tdmcars/mit_eclipsegsx.txt"}

positions = {}

positions[0] = ""

		
	function SpawnCar1(ply,color,model,loc,rotation,bodygroups, headlightboolean)
		local car = ents.Create("prop_vehicle_jeep_old")
		car:SetModel(cars[model].car)
		car:SetKeyValue("vehiclescript",keyvalues[model].keyvalue)
		car:SetLocalPos( Vector( 0, 0, 0 ) )
		car:SetLocalAngles( Angle( 0, 0, 0 ) )
		car:SetPos(loc)
		car:SetAngles(rotation)
		
		car:Spawn()
		car:SetBodyGroups(bodygroups)
		car:SetColor(color)
		ply:EnterVehicle(car)
		
		ply:SetFOV(85,0)
		
		ply.HeadLights = ents.Create("env_projectedtexture")
		ply.HeadLights2 = ents.Create("env_projectedtexture")
		ply.sprite = ents.Create( "env_sprite" )
		ply.sprite2 = ents.Create( "env_sprite" )
		PrintTable(car:GetBodyGroups())
		
		if headlightboolean then
		
			if IsValid(ply.HeadLights) then
					
				ply.sprite2:SetColor( Color( 255, 255, 255 ) )

				ply.sprite2:SetKeyValue( "model", "sprites/light_glow01.vmt" )
				ply.sprite2:SetParent(car, 11)
				ply.sprite2:SetLocalPos(Vector(26,-30,-6))
				ply.sprite2:SetKeyValue( "scale", .6 )
				ply.sprite2:SetKeyValue( "rendermode", 5 )
				ply.sprite2:SetKeyValue( "renderfx", 7 )

				ply.sprite2:Spawn()
				ply.sprite2:Activate()
				--
				
				ply.sprite:SetColor( Color( 255, 255, 255 ) )
				ply.sprite:SetKeyValue( "model", "sprites/light_glow01.vmt" )
				ply.sprite:SetParent(car, 11)
				ply.sprite:SetLocalPos(Vector(-26,-30,-6))
				ply.sprite:SetKeyValue( "scale", .6 )
				ply.sprite:SetKeyValue( "rendermode", 5 )
				ply.sprite:SetKeyValue( "renderfx", 7 )
				ply.sprite:Spawn()
				ply.sprite:Activate()
				
				local ang = ( car:GetAttachment(11).Pos - car:GetPos() ):Angle() 
				
				
				ply.HeadLights:SetLocalAngles( Angle( 0, 0, 0 ) )
				ply.HeadLights:SetAngles( ang + Angle(35,0,0) )
				ply.HeadLights:SetKeyValue( "lightcolor", "181 209 255 255" )
				ply.HeadLights:SetKeyValue( "lightfov", "80" )
				ply.HeadLights:SetParent(car, 11)
				ply.HeadLights:SetLocalPos( Vector( 20, 0, 0 ) )
				ply.HeadLights:Spawn()	
				
				ply.HeadLights2:SetLocalAngles( Angle( 0, 0, 0 ) )
				ply.HeadLights2:SetAngles( ang + Angle(35,0,0) )
				ply.HeadLights2:SetKeyValue( "lightcolor", "181 209 255 255" )
				ply.HeadLights2:SetKeyValue( "lightfov", "80" )
				ply.HeadLights2:SetParent(car, 11)
				ply.HeadLights2:SetLocalPos( Vector( -20, 0, 0 ) )
				ply.HeadLights2:Spawn()	

				
			end
		
		end
	end  