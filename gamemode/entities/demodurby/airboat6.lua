
function SpawnAirboat6()
		local car = ents.Create("prop_vehicle_airboat")  
		car:SetModel("models/airboat.mdl") 
		car:SetKeyValue("vehiclescript","scripts/vehicles/airboat.txt")
		car:SetPos(Vector(14627.765625, 6568.424316, -1471.968750)) 
		car:SetAngles(Angle(0,75,0))
		car:Spawn()
		car:Activate( )
	end