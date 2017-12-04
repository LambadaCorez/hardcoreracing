
function SpawnAirboat1()
		local car = ents.Create("prop_vehicle_airboat")
		car:SetModel("models/airboat.mdl") 
		car:SetKeyValue("vehiclescript","scripts/vehicles/airboat.txt")
		car:SetPos(Vector(13086.849609, 6431.895508, -1471.968750)) 
		car:SetAngles(Angle(0,29,0))
		car:Spawn()
		car:Activate()
	end