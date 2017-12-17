--THESE ARE ENTITIES FROM GMRacer, IF ANY OF THE AUTHORS WANTS THIS MOD REMOVED, I WILL DO SO IMMEDIATELY
ENT.Base = "base_brush"
ENT.Type = "brush"

function ENT:Initialize()

end

function ENT:StartTouch( entity )
	
	if entity:IsValid() and entity:IsPlayer() then

		entity:Kill() 
	
	end
end

function ENT:EndTouch( entity ) end
function ENT:Touch( entity ) end
