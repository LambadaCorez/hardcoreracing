
function SpawnAirboat2()
		local car = ents.Create("prop_vehicle_airboat")  
		car:SetModel("models/airboat.mdl") 
		car:SetKeyValue("vehiclescript","scripts/vehicles/airboat.txt")
		car:SetPos(Vector(13054.789063, 6019.326660, -1471.968750)) 
		car:SetAngles(Angle(0,-90,0))
		car:Spawn()
		car:Activate( )
	end