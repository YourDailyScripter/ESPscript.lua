local Players = game:GetService("Players")
local RunService = game:GetService("RunService")

local nameTagTemplate = Instance.new("TextLabel")
nameTagTemplate.TextSize = 14 -- Adjust as needed
nameTagTemplate.Font = Enum.Font.Gotham
nameTagTemplate.BackgroundTransparency = 1
nameTagTemplate.TextColor3 = Color3.fromRGB(255, 255, 255) -- White text
nameTagTemplate.Parent = nil -- Hide until attached to players

local function highlightPlayer(player)
    local selectionBox = Instance.new("SelectionBox")
    selectionBox.Adornee = player.Character
    selectionBox.LineThickness = 0.05 -- Adjust outline thickness
    selectionBox.Color3 = Color3.fromRGB(255, 0, 0) -- Red box
    selectionBox.SurfaceColor3 = Color3.fromRGB(0, 0, 255) -- Blue outline
    selectionBox.Parent = player.Character

    local nameTag = nameTagTemplate:Clone()
    nameTag.Text = player.Name
    nameTag.Parent = player.Character.Head
    nameTag.Position = Vector3.new(0, 3, 0) -- Adjust nametag position
end

RunService.RenderStepped:Connect(function()
    for _, player in pairs(Players:GetPlayers()) do
        highlightPlayer(player)
    end
end)

Players.PlayerAdded:Connect(highlightPlayer)
