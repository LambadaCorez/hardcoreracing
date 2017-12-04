
function SpawnAirboat3()
		local car = ents.Create("prop_vehicle_airboat")  
		car:SetModel("models/airboat.mdl") 
		car:SetKeyValue("vehiclescript","scripts/vehicles/airboat.txt")
		car:SetPos(Vector(13082.184570, 5508.511719, -1471.968750)) 
		car:SetAngles(Angle(0,29,0))
		car:Spawn()
		car:Activate( )
	end