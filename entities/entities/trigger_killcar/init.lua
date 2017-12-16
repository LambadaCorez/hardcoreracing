entity.Base = "base_brush"
entity.Type = "brush"

function entity:Initialize()

end

function entity:StartTouch( entity )
	
	if entity:IsValid() and entity:IsPlayer() then

		entity:Kill() 
	
	end
end

function entity:EndTouch( entity ) end
function entity:Touch( entity ) end
