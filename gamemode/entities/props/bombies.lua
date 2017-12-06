
function SpawnBombies(pos)
		local bombs = ents.Create("item_ammo_crate")
		bombs:SetModel("models/items/ammocrate_grenade.mdl") 
		bombs:SetKeyValue("AmmoType","5")
		bombs:SetPos(pos) 
		bombs:SetAngles(Angle(0,315,0))
		bombs:Spawn()
	end