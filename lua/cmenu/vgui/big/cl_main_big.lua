local PANEL = PANEL or {}
local buttonColor, panelOutline, niceGrey = Color(53, 59, 72, 255), Color(0, 0, 0, 255), Color(53, 59, 72, 255)
print("Loading CMenu_BMain.lua")

function PANEL:Init()
    if IsValid(self) then return end
    self:MakePopup()
    -- Create an inner panel that starts a little lower
    self.innerPanel = vgui.Create("DPanel", self)
    self.innerPanel:SetPos(1, 30)
    self.innerPanel:SetSize(self:GetWide() - 1, self:GetTall() - 30)

    -- Paint function to give it a black outline
    self.innerPanel.Paint = function(s, w, h)
        draw.RoundedBox(0, 0, 0, w, h, panelOutline)
    end

    -- Create a close button
    self.closeButton = vgui.Create("DButton", self)
    self.closeButton:SetPos(self:GetWide() - 30, 0)
    self.closeButton:SetSize(30, 30)
    self.closeButton:SetText("X")

    -- When the close button is clicked, close the panel
    self.closeButton.DoClick = function()
        self:Close()
    end

    -- Paint function to give it a black outline
    self.closeButton.Paint = function(s, w, h)
        draw.RoundedBox(0, 0, 0, w, h, panelOutline)
        -- and paint the background buttonColor
        draw.RoundedBox(0, 1, 1, w - 2, h - 2, buttonColor)
    end
end

function PANEL:Paint(w, h)
    -- Create a black outline
    draw.RoundedBox(0, 0, 0, w, h, panelOutline)
    -- Create a dark grey background
    draw.RoundedBox(0, 1, 1, w - 2, h - 2, niceGrey)
end

function PANEL:Think()
    do
        return
    end

    if not self.PostInitCalled then
        self:PostInit()
        self.PostInitCalled = true
    end
end

function PANEL:PerformLayout(w, h)
    self:SetSize(ScrW() / 2.15, ScrH() / 1.5)
    self:SetPos(ScrW() / 4.30, ScrH() / 4.30)
end

vgui.Register("CMenu_BMain", PANEL, "EditablePanel")