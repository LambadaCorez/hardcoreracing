
ENT.Base = "base_brush"
ENT.Type = "brush"

function ENT:Initialize()
	self.ID = self.ID or 1;
	self.Setup = 10;
end

function ENT:StartTouch( ent )

	print(ent:GetPos())
	local ply = ent
	
	local vehiCheck = tonumber(ply:GetNWInt("pCar"))

	local colorR = ply:GetNWInt("colorR")
	local colorG = ply:GetNWInt("colorG")
	local colorB = ply:GetNWInt("colorB")

	if vehiCheck == 0 then
		customVar = ply:GetNWString("pGSX") 
	end
	if vehiCheck == 1 then
		customVar = ply:GetNWString("pSIL")
	end
	if vehiCheck == 2 then
		customVar = ply:GetNWString("pEV8")
	end
	if vehiCheck == 3 then
		customVar = ply:GetNWString("pEVX")
	end
	if vehiCheck == 4 then
		customVar = ply:GetNWString("pR34")
	end 
	if vehiCheck == 5 then
		customVar = ply:GetNWString("p370")
	end
	if vehiCheck == 6 then
		customVar = ply:GetNWString("pMGT")
	end
	
	if ent:IsPlayer() and !ent:InVehicle() then
	
	ply:SetNWBool("playerRacing", false)
	SpawnCar1(ent,Color(colorR,colorG,colorB),tonumber(ply:GetNWInt("pCar")),ent:GetPos() + Vector(0,0,15),ent:GetAngles(),customVar, false)
	table.insert(garageCars, ent:GetVehicle())

	PrintTable(garageCars)
	
	end
 end

function ENT:EndTouch( Ent ) end
function ENT:Touch( Ent ) end
function ENT:PassesTriggerFilters( Ent ) return Ent:IsPlayer() end
function ENT:Think()
	end
function ENT:OnRemove() end