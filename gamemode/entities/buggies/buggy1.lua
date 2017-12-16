include("addon.lua")

cars = {}

cars[0] = {car = "models/tdmcars/mit_eclipsegsx.mdl"}
cars[1] = {car = "models/tdmcars/nissan_silvias15.mdl"}
cars[2] = {car = "models/tdmcars/mitsu_evo8.mdl"}
cars[3] = {car = "models/tdmcars/mitsu_evox.mdl"}
cars[4] = {car = "models/tdmcars/skyline_r34.mdl"}
cars[5] = {car = "models/tdmcars/nis_370z.mdl"}
cars[6] = {car = "models/tdmcars/mitsu_eclipgt.mdl"}

keyvalues = {}

keyvalues[0]={keyvalue="scripts/vehicles/tdmcars/mit_eclipsegsx.txt"}
keyvalues[1]={keyvalue="scripts/vehicles/tdmcars/nissilvs15.txt"}
keyvalues[2]={keyvalue="scripts/vehicles/tdmcars/mitsu_evo8.txt"}
keyvalues[3]={keyvalue="scripts/vehicles/tdmcars/mitsu_evox.txt"}
keyvalues[4]={keyvalue="scripts/vehicles/tdmcars/skyline_r34.txt"}		
keyvalues[5]={keyvalue="scripts/vehicles/tdmcars/370z.txt"}
keyvalues[6]={keyvalue="scripts/vehicles/tdmcars/mitsu_eclipgt.txt"}		
		
		function SpawnCar1(ply,color,model,loc,rotation,bodygroups)
		local car = ents.Create("prop_vehicle_jeep_old")
		car:SetModel(cars[model].car)
		car:SetKeyValue("vehiclescript",keyvalues[model].keyvalue)
		car:SetPos(loc)
		car:SetAngles(rotation)
		car:Spawn()
		car:SetBodyGroups(bodygroups)
		car:SetColor(color)
		
		ply:EnterVehicle(car)

		print("bodygroups sent over: " .. bodygroups)
	end 