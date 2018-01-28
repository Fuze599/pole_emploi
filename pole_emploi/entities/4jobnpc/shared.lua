ENT.Base	    			= "base_ai"
ENT.Type	    			= "ai"
 
ENT.PrintName		= "4Job NPC"
ENT.Author			= "Fuze"
ENT.Contact			= "Contact me on Steam : Fuze (French)"

ENT.Spawnable = true
ENT.AdminSpawnable = false
ENT.Category = "4Job"



function ENT:SetAutomaticFrameAdvance(byUsingAnim)
	self.AutomaticFrameAdvance = byUsingAnim
end