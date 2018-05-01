hiddenCarList = {}

hiddenCarList[0] = {car = "Nissan 350Z",
shrt = "p350",
price = " ??",
fbumper = 1,
rbumper = 1, 
skirts = 1,
wheels = -1,
spoilers = 2,
hoods = 1,

fbumperoffset = 2,
bbumperoffset = 3,
skirtsoffset = 4,
hoodsoffset = 5,
wingsoffset = 6,
wheelsoffset = 7

}

hiddenCarList[1] = {car = "Nissan Leaf",
shrt = "pNSL",
price = " ??",
fbumper = 0,
rbumper = -1, 
skirts = -1,
wheels = -1,
spoilers = 0,
hoods = -1,

fbumperoffset = 4,
bbumperoffset = 0,
skirtsoffset = 0,
hoodsoffset = 0,
wingsoffset = 5,
wheelsoffset = 6

}

hiddenCarList[2] = {
shrt = "pMCL",
car = "Mitsubishi Coltrallart",
price = " ??",
fbumper = 0,
rbumper = -1, 
skirts = -1,
wheels = -1,
spoilers = 0,
hoods = -1,

fbumperoffset = 2,
bbumperoffset = 0,
skirtsoffset = 0,
hoodsoffset = 0,
wingsoffset = 3,
wheelsoffset = 0

}

hiddenCarList[3] = {car = "Nissan GTR",
shrt = "pGTR",
price = " ??",
fbumper = 0,
rbumper = -1, 
skirts = -1,
wheels = -1,
spoilers = 1,
hoods = -1,

fbumperoffset = 4,
bbumperoffset = 0,
skirtsoffset = 0,
hoodsoffset = 0,
wingsoffset = 5,
wheelsoffset = 6

}

hiddenCarList[4] = {car = "Buggy",
shrt = "pBGY",
price = " ??",
fbumper = 0,
rbumper = -1, 
skirts = -1,
wheels = -1,
spoilers = -1,
hoods = -1,

fbumperoffset = 1,
bbumperoffset = 0,
skirtsoffset = 0,
hoodsoffset = 0,
wingsoffset = 0,
wheelsoffset = 0

}

hiddenCarList[5] = {car = "...",
shrt = "pSEC",
price = " ??",
fbumper = -1,
rbumper = -1,
skirts = -1,
wheels = -1,
spoilers = -1,
hoods = -1,

fbumperoffset = 0,
bbumperoffset = 0,
skirtsoffset = 0,
hoodsoffset = 0,
wingsoffset = 0,
wheelsoffset = 0

}

carList = {}

carList[0] = {
shrt = "pGSX",
car = "Mitsubishi Eclipse GSX", 
price = "2000",
fbumper = 5, 
rbumper = 4, 
skirts = 3, 
wheels = 0, 
spoilers = 2, 
hoods = 0,

fbumperoffset = 3,
bbumperoffset = 4,
skirtsoffset = 5,
hoodsoffset = 6,
wingsoffset = 8,
wheelsoffset = 9

}	
carList[1] = {car = "Nissan Silvia S15",
shrt = "pSIL",
price = "5000", 
fbumper = 6, 
rbumper = 5, 
skirts = 3, 
wheels = 1, 
spoilers = 5, 
hoods = 0,

fbumperoffset = 3,
bbumperoffset = 4,
skirtsoffset = 6,
hoodsoffset = 5,
wingsoffset = 7,
wheelsoffset = 8

}
carList[2] = {car = "Mitsubishi Evolution VIII", 
shrt = "pEV8",
price = "5500",
fbumper = 5, 
rbumper = 5, 
skirts = 1, 
wheels = 0, 
spoilers = 5, 
hoods = 5,

fbumperoffset = 3,
bbumperoffset = 4,
skirtsoffset = 6,
hoodsoffset = 5,
wingsoffset = 7,
wheelsoffset = 9

}
carList[3] = {car = "Mitsubishi Evolution X",
shrt = "pEVX",
price = "6000",
fbumper = 2, 
rbumper = 1, 
skirts = 1, 
wheels = 0, 
spoilers = 2,
hoods = 1,

fbumperoffset = 3,
bbumperoffset = 4,
skirtsoffset = 5,
hoodsoffset = 6,
wingsoffset = 7,
wheelsoffset = 8

}
carList[4] = {car = "Nissan Skyline R34", 
shrt = "pR34",
price = "8000",
fbumper = 2, 
rbumper = 1, 
skirts = 1, 
wheels = 0, 
spoilers = 2, 
hoods = 1,

fbumperoffset = 3,
bbumperoffset = 4,
skirtsoffset = 5,
hoodsoffset = 6,
wingsoffset = 7,
wheelsoffset = 8

}
carList[5] = {car = "Nissan 370Z", 
shrt = "p370",
price = "4000",
fbumper = 2, 
rbumper = 1, 
skirts = 1, 
wheels = 1, 
spoilers = 2, 
hoods = 1,

fbumperoffset = 3,
bbumperoffset = 4,
skirtsoffset = 5,
hoodsoffset = 6,
wingsoffset = 7,
wheelsoffset = 9

}
carList[6] = {car = "Mitsubishi Eclipse GT", 
shrt = "pMGT",
price = "3000",
fbumper = 2, 
rbumper = 1, 
skirts = 0, 
wheels = 1, 
spoilers = 0, 
hoods = 0,

fbumperoffset = 3,
bbumperoffset = 5,
skirtsoffset = 4,
hoodsoffset = -1,
wingsoffset = 7,
wheelsoffset = -1

}

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
	
	if ply:GetPData("wins") == nil then
		ply:SetPData("wins", "0")
		ply:SetNWInt("wins", "0")
	else
		ply:SetNWInt("wins", ply:GetPData("wins"))
	end
	
	if ply:GetPData("boostCounter") == nil then
		ply:SetPData("boostCounter", "0")
		ply:SetNWInt("boostCounter", "0")
	else
		ply:SetNWInt("boostCounter", ply:GetPData("boostCounter"))
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

	for i = 0, table.Count(carList) - 1 do
			if ply:GetPData("Regular" .. carList[i].shrt) == nil then
				ply:SetPData("Regular" .. carList[i].shrt, false)
				ply:SetNWBool("Regular" .. carList[i].shrt, false)
			else
				ply:SetNWBool("Regular" .. carList[i].shrt, ply:GetPData("Regular".. carList[i].shrt))
			end
	end

	for i = 0, table.Count(hiddenCarList) - 1 do --HIDDEN CAR LOGIC FOR LOADING
		if ply:GetPData("Secret" .. hiddenCarList[i].shrt) == nil then
			ply:SetPData("Secret" .. hiddenCarList[i].shrt, false)
			ply:SetNWBool("Secret" .. hiddenCarList[i].shrt, false)
		else
			ply:SetNWBool("Secret" .. hiddenCarList[i].shrt, ply:GetPData("Secret".. hiddenCarList[i].shrt))
		end
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
	
	ply:SetPData("boostColor1", ply:GetNWString("boostColor1"))
	ply:SetPData("boostColor2", ply:GetNWString("boostColor2"))
	
	ply:SetPData("wins", ply:GetNWInt("wins"))
	
	ply:SetPData("boostCounter", ply:GetNWInt("boostCounter"))

	for i = 0, table.Count(carList) - 1 do
		ply:SetPData("Regular"..carList[i].shrt, ply:GetNWBool("Regular"..carList[i].shrt))
	end

	for i = 0, table.Count(hiddenCarList) - 1 do
		ply:SetPData("Secret"..hiddenCarList[i].shrt, ply:GetNWBool("Secret"..hiddenCarList[i].shrt))
	end
	
end