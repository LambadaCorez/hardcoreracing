

function StatLoad( ply )

	--MONEY
	if ply:GetPData("money") == nil then
		print("A new player has arrived! " .. ply:Nick() .. " has joined for the first time! Setting up necessary systems...")
		ply:SetPData("money", 0 )
		ply:SetNWInt("money", 0 )
	else
		ply:SetNWInt("money", ply:GetPData("money"))
	end

	--CAR
	if ply:GetPData("pCar") == nil then
		ply:SetPData("pCar", 0 )
		ply:SetNWInt("pCar", 0 )
	else
		ply:SetNWInt("pCar", ply:GetPData("pCar"))
	end
	
	if ply:GetPData("color") == nil then
		ply:SetPData("color", "colorSet")
		ply:SetNWInt("colorR", 0)
		ply:SetNWInt("colorG", 0)
		ply:SetNWInt("colorB", 0)
		else
		ply:SetNWInt("colorR", ply:GetPData("colorR"))
		ply:SetNWInt("colorG", ply:GetPData("colorG"))
		ply:SetNWInt("colorB", ply:GetPData("colorB"))
		ply:SetNWString("color", ply:GetPData("color"))
	end
	
	if ply:GetPData("boostColor") == nil then
		ply:SetPData("boostColor", "1")
		ply:SetPData("boostColor1", "244 134 66 255")
		ply:SetPData("boostColor2", "0 156 255 255")
		ply:SetNWString("boostColor1",  ply:GetPData("boostColor1"))
		ply:SetNWString("boostColor2",  ply:GetPData("boostColor2"))
		else
		ply:SetNWString("boostColor1",  ply:GetPData("boostColor1"))
		ply:SetNWString("boostColor2",  ply:GetPData("boostColor2"))
	end
	
if ply:GetPData("pGSX") == nil then
	ply:SetPData("pGSX", "00000000")
	ply:SetNWString("pGSX","00000000")
else
	ply:SetNWString("pGSX", ply:GetPData("pGSX"))
end
if ply:GetPData("pSIL") == nil then
	ply:SetPData("pSIL", "00000000") 
	ply:SetNWString("pSIL","00000000")
else
	ply:SetNWString("pSIL", ply:GetPData("pSIL"))
end
if ply:GetPData("pEV8") == nil then
	ply:SetPData("pEV8", "00000000")
	ply:SetNWString("pEV8","00000000")
else
	ply:SetNWString("pEV8", ply:GetPData("pEV8"))
end
if ply:GetNWInt("pEVX") == nil then
	ply:SetPData("pEVX", "00000000")
	ply:SetNWString("pEVX","00000000")
else
	ply:SetNWString("pEVX", ply:GetPData("pEVX"))
end
if ply:GetNWInt("pR34") == nil then
	ply:SetPData("pR34", "00000000")
	ply:SetNWString("pR34","00000000")
else
	ply:SetNWString("pR34", ply:GetPData("pR34"))
end
if ply:GetNWInt("p370") == nil then
	ply:SetPData("p370", "00000000")
	ply:SetNWString("p370","00000000")
else
	ply:SetNWString("p370", ply:GetPData("p370"))
end
if ply:GetNWInt("pMGT") == nil then
	ply:SetPData("pMGT", "00000000")
	ply:SetNWString("pMGT","00000000")
else
	ply:SetNWString("pMGT", ply:GetPData("pMGT"))
end
	
end


function StatSave( ply )

	ply:SetPData("pCar", ply:GetNWInt("pCar"))
	
	ply:SetPData("money", ply:GetNWInt("money"))
	
	ply:SetPData("pGSX", ply:GetNWString("pGSX"))
	ply:SetPData("pSIL", ply:GetNWString("pSIL"))
	ply:SetPData("pEV8", ply:GetNWString("pEV8"))
	ply:SetPData("pEVX", ply:GetNWString("pEVX"))
	ply:SetPData("pR34", ply:GetNWString("pR34"))
	ply:SetPData("p370", ply:GetNWString("p370"))
	ply:SetPData("pMGT", ply:GetNWString("pMGT"))
	
	ply:SetPData("color", ply:GetNWString("color"))
	ply:SetPData("colorR", ply:GetNWInt("colorR"))
	ply:SetPData("colorG", ply:GetNWInt("colorG"))
	ply:SetPData("colorB", ply:GetNWInt("colorB"))
	
end