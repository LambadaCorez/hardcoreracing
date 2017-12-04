
var = 0

local music = {}

music[0] = {links="https://racehosting.000webhostapp.com/music/track1.mp3"}
music[1] = {links="https://racehosting.000webhostapp.com/music/track2.mp3"}
music[2] = {links="https://racehosting.000webhostapp.com/music/track3.mp3"}
music[3] = {links="https://racehosting.000webhostapp.com/music/track4.mp3"}
music[4] = {links="https://racehosting.000webhostapp.com/music/track5.mp3"}


function musicLogic()


  if !raceactive or (ply:Alive() == false) then

    var = 0

    backupPlan()

  end

  if raceactive then

    backupPlan()

  end


end

function backupPlan()

  local car = ply:GetVehicle()


  if IsValid(car) then

    local vehicleclass = car:GetClass()


    if raceactive and var == 0 and (vehicleclass != "prop_vehicle_airboat") then
      var = 1
      sound.PlayURL( music[math.random(0,4)].links, "", function( station )


      if ( IsValid( station ) ) and vehicleclass !="prop_vehicle_airboat" then
        station:Play()
      else
        station:Stop()
      end

      end)
    end
  end
end

