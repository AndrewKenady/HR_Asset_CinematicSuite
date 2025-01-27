--!Type(Client)

--!SerializeField
--!Tooltip("Audio shader to play. To create an Audio Shader, right click an audio file then go to Create->Highrise->Audio->Audio Shader")
local _audioShader: AudioShader = nil

function PlayCoolSound()
	if _audioShader then
		if #_audioShader.clips == 0 then
			print("<color=red>Error: No sound clips found in Audio Shader: " .. _audioShader.name .. "</color>")
			return
		end
		Audio:PlayShader(_audioShader)
	end
end