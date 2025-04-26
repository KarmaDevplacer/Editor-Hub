local TweenService = game:GetService("TweenService")
local StarterGui = game:GetService("StarterGui")

-- Creamos la ScreenGui
local screenGui = Instance.new("ScreenGui")
screenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
screenGui.ResetOnSpawn = false

-- Pestaña principal
local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0.5, 0, 0.3, 0)
mainFrame.Position = UDim2.new(0.25, 0, 1, 0) -- Fuera de pantalla abajo
mainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
mainFrame.BorderSizePixel = 0
mainFrame.Parent = screenGui

-- Título
local title = Instance.new("TextLabel")
title.Text = "Verificación del Hub"
title.Size = UDim2.new(1, 0, 0.3, 0)
title.Position = UDim2.new(0, 0, 0, 0)
title.BackgroundTransparency = 1
title.Font = Enum.Font.GothamBold
title.TextSize = 28
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.Parent = mainFrame

-- Subtexto
local subtitle = Instance.new("TextLabel")
subtitle.Text = "Comprobando compatibilidad..."
subtitle.Size = UDim2.new(1, 0, 0.3, 0)
subtitle.Position = UDim2.new(0, 0, 0.35, 0)
subtitle.BackgroundTransparency = 1
subtitle.Font = Enum.Font.Gotham
subtitle.TextSize = 20
subtitle.TextColor3 = Color3.fromRGB(180, 180, 180)
subtitle.Parent = mainFrame

-- Icono de estado
local statusIcon = Instance.new("ImageLabel")
statusIcon.Size = UDim2.new(0, 50, 0, 50)
statusIcon.Position = UDim2.new(0.5, -25, 0.7, 0)
statusIcon.BackgroundTransparency = 1
statusIcon.Image = "rbxassetid://1234567890" -- AQUI pones la imagen de palomita o error
statusIcon.Parent = mainFrame

-- Animación de aparición
local appearTween = TweenService:Create(mainFrame, TweenInfo.new(0.8, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
    Position = UDim2.new(0.25, 0, 0.35, 0)
})
appearTween:Play()

-- Después de animación: hacer la verificación
appearTween.Completed:Connect(function()
    -- AQUI verificamos compatibilidad
    local compatible = true -- cambiar dinámicamente

    if compatible then
        subtitle.Text = "Compatible: ¡Listo para usar!"
        statusIcon.Image = "rbxassetid://ID_DE_PALOMITA_VERDE"
        -- (opcional) efecto de resplandor verde
    else
        subtitle.Text = "Error: Este juego no es compatible."
        statusIcon.Image = "rbxassetid://ID_DE_ERROR_ROJO"
        -- (opcional) efecto de parpadeo rojo
    end
end)
