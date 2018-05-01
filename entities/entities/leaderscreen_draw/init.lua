
AddCSLuaFile( "cl_init.lua" )
AddCSLuaFile( "shared.lua" )

include('shared.lua')

function ENT:Initialize()
	self:SetColor(255, 255, 255, 255);
end

function ENT:KeyValue( key, value )
end

function ENT:OnRestore()
end

function ENT:AcceptInput( name, activator, caller, data )
	return false
end

function ENT:UpdateTransmitState()
	return TRANSMIT_PVS
end

function ENT:Think () 

end

function ENT:OnTakeDamage ( )

end