function racePoint2()


	for k, v in pairs(ents.FindInBox( Vector(6359.059570, -13192.848633, -1143.905029), Vector(6742.701660, -14187.796875, -561.807434) ) ) do

		
		if v:IsVehicle() then
			laps = 2
			net.Start("laps")
			net.WriteInt(laps,32)
			net.Send(v:GetDriver())
			net.Start("lapBool")
			net.WriteBool(true)
			net.Send(v:GetDriver())
			
		end
	end
	
	
end


net.Receive( "lapsclient", function( len, racer )
	
	if ( IsValid( racer ) and racer:IsPlayer() ) then

	countlaps = net.ReadInt(32)
	
		if countlaps == 3 then
			raceactive = false
			EndRound(racer:Nick())
			
			
		end
	
	end
	end)