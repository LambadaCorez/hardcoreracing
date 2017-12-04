function racePoint3()


	for k, v in pairs(ents.FindInBox( Vector(7718.183105, 12451.620117, -34.898705), Vector(7516.244629, 13552.686523, 631.709229) ) ) do

	net.Receive( "lapBool", function( len, racer )
	
	if ( IsValid( racer ) and racer:IsPlayer() ) then
	lapBool = net.ReadBool(32)
			
			
		end
	
	end)
		
		if v:IsVehicle() then
			if lapBool then
				laps = 3
				net.Start("laps")
				net.WriteInt(laps,32)
				net.Send(v:GetDriver())
			end
		end
	end
	
	
end