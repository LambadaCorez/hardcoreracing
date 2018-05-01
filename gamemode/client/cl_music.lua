
var = 0

local music = {}

local ply = LocalPlayer()

music[0] = {links="https://lambadacorez.github.io/music/track1.mp3"}
music[1] = {links="https://lambadacorez.github.io/music/track2.mp3"}
music[2] = {links="https://lambadacorez.github.io/music/track3.mp3"}
music[3] = {links="https://lambadacorez.github.io/music/track4.mp3"}
music[4] = {links="https://lambadacorez.github.io/music/track5.mp3"}
music[5] = {links="https://lambadacorez.github.io/music/track6.mp3"}
music[6] = {links="https://lambadacorez.github.io/music/track7.mp3"}
music[7] = {links="https://lambadacorez.github.io/music/track8.mp3"}
music[8] = {links="https://lambadacorez.github.io/music/track9.mp3"}
music[9] = {links="https://lambadacorez.github.io/music/track10.mp3"}
music[10] = {links="https://lambadacorez.github.io/music/track11.mp3"}

function musicLogic()
      var = 1
      sound.PlayURL( music[math.random(0,10)].links, "", function( station )


        if ( IsValid( station ) ) and vehicleclass !="prop_vehicle_airboat" then
          station:Play()
        else
          station:Stop()
        end

        end)
end


