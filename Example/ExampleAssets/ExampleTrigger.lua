--!Type(Client)

--!SerializeField
local enableOnEnter : {GameObject} = {}
--!SerializeField
local toggleWhenPresent : {GameObject} = {}

local _cachedCharacter = nil

function self:OnTriggerEnter(collider: Collider)
    local char = collider.gameObject:GetComponent(Character)
    if char ~= nil then
        if char == client.localPlayer.character then
            _cachedCharacter = char
            for i, o in ipairs(enableOnEnter) do
                self.gameObject.SetActive(o, true)
            end
            for i, o in ipairs(toggleWhenPresent) do
                self.gameObject.SetActive(o, not o.activeInHierarchy)
            end
        end
    end
end


function self:OnTriggerExit(collider: Collider)
    local char = collider.gameObject:GetComponent(Character)
    if char ~= nil then
        if char == _cachedCharacter then
            _cachedCharacter = nil

            for i, o in ipairs(toggleWhenPresent) do
                self.gameObject.SetActive(o, not o.activeInHierarchy)
            end
        end
    end
end