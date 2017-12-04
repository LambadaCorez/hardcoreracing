
function SpawnAirboat4()
		local car = ents.Create("prop_vehicle_airboat")  
		car:SetModel("models/airboat.mdl") 
		car:SetKeyValue("vehiclescript","scripts/vehicles/airboat.txt")
		car:SetPos(Vector(14642.157227, 5524.540039, -1471.968750)) 
		car:SetAngles(Angle(0,142,0))
		car:Spawn()
		car:Activate( )
	end