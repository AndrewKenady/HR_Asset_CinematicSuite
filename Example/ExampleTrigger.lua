--!Type(Client)

--!SerializeField
local enableOnEnter : {GameObject} = {}


function self:OnTriggerEnter(collider: Collider)
    local char = collider.gameObject:GetComponent(Character)
    if char ~= nil then
        if char == client.localPlayer.character then
            for i, o in ipairs(enableOnEnter) do
                self.gameObject.SetActive(o, true)
            end
        end
    end
end
