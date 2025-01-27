--!Type(Client)

--!SerializeField
--!Tooltip("Custom event string from the CinematicSequence Custom Event")
local _myCustomEventString : string = "PlayNiceSound"

--!SerializeField
--!Tooltip("Audio shader to play. To create an Audio Shader, right click an audio file then go to Create->Highrise->Audio->Audio Shader")
local _soundEffect: AudioShader = nil

local events = require("CinematicSuiteEvents")

function PlayNiceSound()
	if _soundEffect then
		if #_soundEffect.clips == 0 then
			print("<color=red>Error: No sound clips found in Audio Shader: " .. _soundEffect.name .. "</color>")
			return
		end
		Audio:PlayShader(_soundEffect)
	end
end

events.CustomEvents:Connect(function(customString:string)
    if customString == _myCustomEventString then
        PlayNiceSound()
    end
end)