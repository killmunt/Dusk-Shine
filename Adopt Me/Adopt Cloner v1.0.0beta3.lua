-- discord.gg/syncrypt

if not game:IsLoaded() then game.Loaded:Wait() end

local HttpService = game:GetService("HttpService")
local LocalPlayer = game:GetService("Players").LocalPlayer
local VirtualUser = game:GetService("VirtualUser")
local DuskDomain = "https://duskandshine.com"  
local Clonefunction = print
local Clonefunction2 = warn
local Env = getgenv()
Env.ScriptID = "adopt_cloner"
Env.DuskDomain = DuskDomain
Env.DuskVersion = Env.DuskVersion or "Local capture"
Env.DS_StopExecution = false
Env.AllDuskModulesLoaded = false

local __HouseClonerSources = {
    ["/raw/dusk_library_test"] = [===[ 

local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local Players = game:GetService("Players")

game:GetService("RunService")
game:GetService("CoreGui")

local LocalPlayer = Players.LocalPlayer or Players.PlayerAdded:Wait()
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui", 10)
local font = Font.new("rbxassetid://16658237174")
local Font2 = Font.new("rbxassetid://12187365104")

if getgenv().DuskShine_Core then
	getgenv().DuskShine_Core:Destroy()
end

local DuskShineCore = {
	Flags = {},
	ConfigUpdaters = {},
	Connections = {},
	ThemeObjects = {},
	AnonItems = {
		Avatars = {},
		Names = {},
		UIDs = {}
	},
	Utils = {},
	OnThemeChange = Instance.new("BindableEvent")
}

getgenv().DuskShine_Core = DuskShineCore
DuskShineCore.Destroy = function(P1)
	for _, Connection in ipairs(P1.Connections) do
		if typeof(Connection) == "RBXScriptConnection" then
			Connection:Disconnect()
		end
	end

	table.clear(P1.Connections)

	local DuskShineMega = PlayerGui:FindFirstChild("DuskShine_Mega")

	if DuskShineMega then
		DuskShineMega:Destroy()
	end

	local DuskShineEco = PlayerGui:FindFirstChild("DuskShine_Eco")

	if DuskShineEco then
		DuskShineEco:Destroy()
	end
end
DuskShineCore.Connect = function(P2, P3, P4)
	local Connection = P3:Connect(P4)

	table.insert(P2.Connections, Connection)

	return Connection
end
DuskShineCore.Utils.GetConfigValue = function(P5, P6)
	if getgenv().DuskConfigCache then
		if getgenv().DuskConfigCache[P5] ~= nil then
			local V14 = getgenv().DuskConfigCache[P5]

			if type(V14) == "table" and V14.__type == "Color3" then
				return Color3.new(V14.R, V14.G, V14.B)
			end

			if type(V14) == "table" and V14.__type == "KeyCode" then
				return Enum.KeyCode[V14.Name]
			end

			return V14
		end
	end

	return P6
end
DuskShineCore.Utils.TBT = function(P7, P8, P9, P10, P11)
	local Tween = TweenService:Create(P7, TweenInfo.new(P8, P10 or Enum.EasingStyle.Sine, P11 or Enum.EasingDirection.Out), P9)

	Tween:Play()
	Tween.Completed:Connect(function()
		Tween:Destroy()
	end)

	return Tween
end
DuskShineCore.Utils.CreateRipple = function(P12)
	P12.ClipsDescendants = true

	local Frame = Instance.new("Frame")

	Frame.Name = "Ripple"
	Frame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Frame.BackgroundTransparency = 0.8
	Frame.ZIndex = 10

	local Mouse = Players.LocalPlayer:GetMouse()
	local AbsolutePosition = P12.AbsolutePosition

	Frame.Position = UDim2.new(0, Mouse.X - AbsolutePosition.X, 0, Mouse.Y - AbsolutePosition.Y)
	Frame.Size = UDim2.new(0, 0, 0, 0)
	Frame.AnchorPoint = Vector2.new(0.5, 0.5)
	DuskShineCore.Utils.Make("UIStroke", {
		Color = Color3.fromRGB(255, 255, 255),
		Transparency = 0.8,
		Thickness = 1,
		Parent = Frame
	})
	DuskShineCore.Utils.Make("UICorner", {
		CornerRadius = UDim.new(1, 0),
		Parent = Frame
	})
	Frame.Parent = P12

	local V19 = math.max(P12.AbsoluteSize.X, P12.AbsoluteSize.Y) * 2.5
	local Tween = TweenService:Create(Frame, TweenInfo.new(0.6, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {
		Size = UDim2.new(0, V19, 0, V19),
		BackgroundTransparency = 1
	})

	Tween:Play()
	Tween.Completed:Connect(function()
		Frame:Destroy()
	end)
end

local T1 = {
	Red = Color3.fromRGB(255, 95, 87),
	Yellow = Color3.fromRGB(255, 189, 46),
	Green = Color3.fromRGB(39, 201, 63)
}

local function V22(P13)
	return setmetatable(P13, {
		__index = T1
	})
end

DuskShineCore.Themes = {
	Dark = V22({
		Background = Color3.fromRGB(15, 15, 20),
		Sidebar = Color3.fromRGB(20, 20, 25),
		Section = Color3.fromRGB(28, 28, 33),
		Text = Color3.fromRGB(255, 255, 255),
		SubText = Color3.fromRGB(120, 120, 130),
		Accent = Color3.fromRGB(255, 255, 255),
		Stroke = Color3.fromRGB(45, 45, 50),
		ToggleOff = Color3.fromRGB(55, 55, 60),
		ToggleOn = Color3.fromRGB(255, 255, 255),
		Knob = Color3.fromRGB(20, 20, 25)
	}),
	Light = V22({
		Background = Color3.fromRGB(245, 245, 250),
		Sidebar = Color3.fromRGB(255, 255, 255),
		Section = Color3.fromRGB(235, 235, 240),
		Text = Color3.fromRGB(20, 20, 25),
		SubText = Color3.fromRGB(100, 100, 110),
		Accent = Color3.fromRGB(0, 122, 255),
		Stroke = Color3.fromRGB(220, 220, 230),
		ToggleOff = Color3.fromRGB(200, 200, 210),
		ToggleOn = Color3.fromRGB(0, 122, 255),
		Knob = Color3.fromRGB(255, 255, 255)
	}),
	Amethelyst = V22({
		Background = Color3.fromRGB(20, 10, 15),
		Sidebar = Color3.fromRGB(25, 15, 22),
		Section = Color3.fromRGB(33, 20, 30),
		Text = Color3.fromRGB(230, 215, 235),
		SubText = Color3.fromRGB(130, 110, 140),
		Accent = Color3.fromRGB(210, 180, 230),
		Stroke = Color3.fromRGB(50, 35, 55),
		ToggleOff = Color3.fromRGB(60, 45, 65),
		ToggleOn = Color3.fromRGB(210, 180, 230),
		Knob = Color3.fromRGB(25, 15, 22)
	}),
	Galaxy = V22({
		Background = Color3.fromRGB(12, 10, 20),
		Sidebar = Color3.fromRGB(18, 15, 30),
		Section = Color3.fromRGB(25, 20, 42),
		Text = Color3.fromRGB(240, 240, 255),
		SubText = Color3.fromRGB(150, 140, 190),
		Accent = Color3.fromRGB(110, 60, 255),
		Stroke = Color3.fromRGB(50, 40, 80),
		ToggleOff = Color3.fromRGB(40, 30, 70),
		ToggleOn = Color3.fromRGB(110, 60, 255),
		Knob = Color3.fromRGB(20, 15, 35)
	}),
	Emerald = V22({
		Background = Color3.fromRGB(15, 22, 18),
		Sidebar = Color3.fromRGB(20, 28, 22),
		Section = Color3.fromRGB(26, 36, 28),
		Text = Color3.fromRGB(240, 255, 240),
		SubText = Color3.fromRGB(130, 160, 140),
		Accent = Color3.fromRGB(46, 204, 113),
		Stroke = Color3.fromRGB(45, 60, 50),
		ToggleOff = Color3.fromRGB(40, 55, 45),
		ToggleOn = Color3.fromRGB(46, 204, 113),
		Knob = Color3.fromRGB(20, 28, 22)
	}),
	BlueDeepWave = V22({
		Background = Color3.fromRGB(10, 15, 25),
		Sidebar = Color3.fromRGB(15, 22, 35),
		Section = Color3.fromRGB(22, 30, 48),
		Text = Color3.fromRGB(235, 245, 255),
		SubText = Color3.fromRGB(120, 140, 180),
		Accent = Color3.fromRGB(0, 170, 255),
		Stroke = Color3.fromRGB(40, 50, 75),
		ToggleOff = Color3.fromRGB(35, 45, 65),
		ToggleOn = Color3.fromRGB(0, 170, 255),
		Knob = Color3.fromRGB(15, 22, 35)
	})
}
DuskShineCore.CurrentThemeName = getgenv().DuskTheme or "Dark"
DuskShineCore.CurrentTheme = DuskShineCore.Themes[DuskShineCore.CurrentThemeName]

local T2 = {
	Dark = Color3.fromRGB(255, 255, 255),
	Light = Color3.fromRGB(0, 122, 255),
	Amethelyst = Color3.fromRGB(210, 180, 230),
	Galaxy = Color3.fromRGB(110, 60, 255),
	Emerald = Color3.fromRGB(46, 204, 113),
	BlueDeepWave = Color3.fromRGB(0, 170, 255)
}

local function applyGradient(P14, P15)
	local DuskShineGradient = P14:FindFirstChild("DuskShine_Gradient")
	local V26 = false

	if not DuskShineGradient then
		DuskShineGradient = Instance.new("UIGradient")
		DuskShineGradient.Name = "DuskShine_Gradient"
		DuskShineGradient.Rotation = 45
		DuskShineGradient.Offset = Vector2.new(-0.8, 0)
		V26 = true
	end

	local color3 = typeof(P15) == "Color3" and P15 or Color3.fromRGB(255, 255, 255)
	local V28, V29, v30 = color3:ToHSV()
	local Ok, result = pcall(function()
		return Color3.fromHSV(V28, math.clamp(V29 - 0.3, 0, 1), math.clamp(V30 + 0.4, 0, 1))
	end)
	local V33 = Ok and typeof(Result) == "Color3" and Result or color3
	local Color32 = Color3.new(color3.R, color3.G, color3.B)
	local Color33 = Color3.new(V33.R, V33.G, V33.B)

	DuskShineGradient.Color = ColorSequence.new({
		ColorSequenceKeypoint.new(0, Color32),
		ColorSequenceKeypoint.new(0.5, Color33),
		ColorSequenceKeypoint.new(1, Color32)
	})

	if V26 then
		DuskShineGradient.Parent = P14
		TweenService:Create(DuskShineGradient, TweenInfo.new(3, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, -1, true), {
			Offset = Vector2.new(0.8, 0)
		}):Play()
	end
end

DuskShineCore.Utils.ApplyGradient = applyGradient

local function make(P16, P17, P18)
	local instance = Instance.new(P16)

	for K, V in pairs(P17) do
		instance[K] = V
	end

	if P18 then
		if not DuskShineCore.ThemeObjects[instance] then
			DuskShineCore.ThemeObjects[instance] = {}
		end

		for K, V in pairs(P18) do
			DuskShineCore.ThemeObjects[instance][K] = V
			instance[K] = DuskShineCore.CurrentTheme[V]

			if not (V ~= "Accent" or instance:IsA("ImageLabel")) then
				DuskShineCore.Utils.ApplyGradient(instance, DuskShineCore.CurrentTheme.Accent)
			end

			instance.Destroying:Connect(function()
				DuskShineCore.ThemeObjects[instance] = nil
			end)
		end
	end

	return instance
end

DuskShineCore.Utils.Make = make
DuskShineCore.SetTheme = function(P19, P20)
	if not P19.Themes[P20] then
		return
	end

	P19.CurrentThemeName = P20
	P19.CurrentTheme = P19.Themes[P20]
	getgenv().DuskTheme = P20

	if T2[P20] then
		P19.CurrentTheme.Accent = T2[P20]
	end

	P19.OnThemeChange:Fire(P20, P19.CurrentTheme)

	for K, ThemeObject in pairs(P19.ThemeObjects) do
		for K2, V in pairs(ThemeObject) do
			DuskShineCore.Utils.TBT(K, 0.3, {
				[K2] = P19.CurrentTheme[V]
			})

			if V == "Accent" then
				if not K:IsA("ImageLabel") then
					DuskShineCore.Utils.ApplyGradient(K, P19.CurrentTheme.Accent)
				end
			end
		end
	end
end
DuskShineCore.ThemeCycle = {
	"Dark",
	"Light",
	"Amethelyst",
	"Galaxy",
	"Emerald",
	"BlueDeepWave"
}
DuskShineCore.ToggleTheme = function(P21)
	local V46 = (table.find(P21.ThemeCycle, P21.CurrentThemeName) or 1) + 1

	if V46 > #P21.ThemeCycle then
		V46 = 1
	end

	local V47 = P21.ThemeCycle[V46]

	P21:SetTheme(V47)

	return V47
end
DuskShineCore.RunLoader = function(P22, P23, P24)
	local BlurEffect = DuskShineCore.Utils.Make("BlurEffect", {
		Size = 0,
		Parent = game:GetService("Lighting")
	})

	TweenService:Create(BlurEffect, TweenInfo.new(0.3), {
		Size = 15
	}):Play()

	local Frame = DuskShineCore.Utils.Make("Frame", {
		Size = UDim2.new(0, 380, 0, 220),
		AnchorPoint = Vector2.new(0.5, 0.5),
		Position = UDim2.new(0.5, 0, 0.5, 0),
		BorderSizePixel = 0,
		BackgroundTransparency = 1,
		Parent = P23
	}, {
		BackgroundColor3 = "Background"
	})

	DuskShineCore.Utils.Make("UICorner", {
		CornerRadius = UDim.new(0, 16),
		Parent = Frame
	})

	local UIStroke = DuskShineCore.Utils.Make("UIStroke", {
		Thickness = 2,
		Transparency = 1,
		Parent = Frame
	}, {
		Color = "Accent"
	})
	local ImageLabel = DuskShineCore.Utils.Make("ImageLabel", {
		Size = UDim2.new(0, 110, 0, 110),
		AnchorPoint = Vector2.new(0.5, 0.5),
		Position = UDim2.new(0.5, 0, 0.35, 0),
		BackgroundTransparency = 1,
		Image = "rbxassetid://72958619361915",
		ImageTransparency = 1,
		Parent = Frame
	})
	local TextLabel = DuskShineCore.Utils.Make("TextLabel", {
		Text = "dusk & shine",
		Size = UDim2.new(1, 0, 0, 40),
		Position = UDim2.new(0, 0, 0.52, 0),
		FontFace = Font2,
		TextSize = 42,
		TextTransparency = 1,
		BackgroundTransparency = 1,
		Parent = Frame
	}, {
		TextColor3 = "Accent"
	})
	local TextLabel2 = DuskShineCore.Utils.Make("TextLabel", {
		Text = "Injecting Modules...",
		Size = UDim2.new(1, 0, 0, 20),
		Position = UDim2.new(0, 0, 0.68, 0),
		Font = Enum.Font.GothamMedium,
		TextSize = 13,
		TextTransparency = 1,
		BackgroundTransparency = 1,
		Parent = Frame
	}, {
		TextColor3 = "SubText"
	})
	local Frame2 = DuskShineCore.Utils.Make("Frame", {
		Size = UDim2.new(0, 240, 0, 4),
		AnchorPoint = Vector2.new(0.5, 0.5),
		Position = UDim2.new(0.5, 0, 0.82, 0),
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		Parent = Frame
	}, {
		BackgroundColor3 = "Section"
	})

	DuskShineCore.Utils.Make("UICorner", {
		CornerRadius = UDim.new(1, 0),
		Parent = Frame2
	})

	local Frame3 = DuskShineCore.Utils.Make("Frame", {
		Size = UDim2.new(0, 0, 1, 0),
		BorderSizePixel = 0,
		Parent = Frame2
	}, {
		BackgroundColor3 = "Accent"
	})

	DuskShineCore.Utils.Make("UICorner", {
		CornerRadius = UDim.new(1, 0),
		Parent = Frame3
	})
	DuskShineCore.Utils.TBT(Frame, 0.5, {
		BackgroundTransparency = 0.05
	})
	DuskShineCore.Utils.TBT(UIStroke, 0.5, {
		Transparency = 0
	})
	DuskShineCore.Utils.TBT(ImageLabel, 0.6, {
		ImageTransparency = 0,
		Position = UDim2.new(0.5, 0, 0.3, 0)
	})
	DuskShineCore.Utils.TBT(TextLabel, 0.6, {
		TextTransparency = 0
	})
	DuskShineCore.Utils.TBT(TextLabel2, 0.6, {
		TextTransparency = 0
	})
	DuskShineCore.Utils.TBT(Frame2, 0.6, {
		BackgroundTransparency = 0
	})
	task.wait(0.6)
	TextLabel2.Text = "Injecting Scripts..."
	DuskShineCore.Utils.TBT(Frame3, 0.8, {
		Size = UDim2.new(0.6, 0, 1, 0)
	}).Completed:Wait()
	TextLabel2.Text = "Starting UI..."
	DuskShineCore.Utils.TBT(Frame3, 0.5, {
		Size = UDim2.new(1, 0, 1, 0)
	}).Completed:Wait()
	task.wait(0.3)
	DuskShineCore.Utils.TBT(Frame, 0.4, {
		BackgroundTransparency = 1,
		Size = UDim2.new(0, 400, 0, 240)
	})
	DuskShineCore.Utils.TBT(UIStroke, 0.4, {
		Transparency = 1
	})
	DuskShineCore.Utils.TBT(ImageLabel, 0.3, {
		ImageTransparency = 1
	})
	DuskShineCore.Utils.TBT(TextLabel, 0.3, {
		TextTransparency = 1
	})
	DuskShineCore.Utils.TBT(TextLabel2, 0.3, {
		TextTransparency = 1
	})
	DuskShineCore.Utils.TBT(Frame2, 0.3, {
		BackgroundTransparency = 1
	})
	DuskShineCore.Utils.TBT(Frame3, 0.3, {
		BackgroundTransparency = 1
	})
	DuskShineCore.Utils.TBT(BlurEffect, 0.5, {
		Size = 0
	})
	task.wait(0.5)
	Frame:Destroy()
	BlurEffect:Destroy()

	if P24 then
		P24()
	end
end
DuskShineCore.CreateWindow = function(P25, P26)
	local V56 = P26 or {}
	local Title = V56.Title or "Dusk &"
	local AccentTitle = V56.AccentTitle or "Shine"
	local Version = V56.Version
	local Size = V56.Size or UDim2.new(0, 680, 0, 450)
	local EnableSearch = V56.EnableSearch

	if EnableSearch == nil then
		EnableSearch = true
	end

	local ScreenGui = DuskShineCore.Utils.Make("ScreenGui", {
		Name = "DuskShine_Mega",
		Parent = PlayerGui,
		ResetOnSpawn = false,
		IgnoreGuiInset = true,
		ZIndexBehavior = "Global",
		DisplayOrder = 100
	})
	local Frame = DuskShineCore.Utils.Make("Frame", {
		Name = "Notifications",
		Size = UDim2.new(1, -20, 1, -20),
		Position = UDim2.new(0, 10, 0, 10),
		AnchorPoint = Vector2.new(0, 0),
		BackgroundTransparency = 1,
		Parent = ScreenGui,
		ZIndex = 100
	})

	DuskShineCore.Utils.Make("UIListLayout", {
		HorizontalAlignment = "Right",
		VerticalAlignment = "Bottom",
		Padding = UDim.new(0, 5),
		Parent = Frame
	})

	local currentScaleVal = (getgenv().UIScaleSize or 125) / 125
	local UIScale = DuskShineCore.Utils.Make("UIScale", {
		Parent = ScreenGui,
		Scale = currentScaleVal
	})

	DuskShineCore.CurrentScaleVal = currentScaleVal
	DuskShineCore.UpdateScale = function(P27, P28)
		P27.CurrentScaleVal = P28 / 125
		getgenv().UIScaleSize = P28

		local ViewportSize = workspace.CurrentCamera.ViewportSize

		UIScale.Scale = ViewportSize.X < 700 and P27.CurrentScaleVal * (ViewportSize.X / 700) or P27.CurrentScaleVal
	end
	DuskShineCore:Connect(workspace.CurrentCamera:GetPropertyChangedSignal("ViewportSize"), function()
		local ViewportSize = workspace.CurrentCamera.ViewportSize

		UIScale.Scale = ViewportSize.X < 700 and DuskShineCore.CurrentScaleVal * (ViewportSize.X / 700) or DuskShineCore.CurrentScaleVal
	end)

	local CanvasGroup = DuskShineCore.Utils.Make("CanvasGroup", {
		Size = Size,
		AnchorPoint = Vector2.new(0.5, 0.5),
		Position = UDim2.new(0.5, 0, 0.5, 0),
		BorderSizePixel = 0,
		GroupTransparency = 1,
		Visible = false,
		BackgroundTransparency = 0.15,
		Parent = ScreenGui
	}, {
		BackgroundColor3 = "Background"
	})

	DuskShineCore.Utils.Make("UICorner", {
		CornerRadius = UDim.new(0, 14),
		Parent = CanvasGroup
	})
	DuskShineCore.Utils.Make("UIStroke", {
		Thickness = 1,
		Transparency = 0.5,
		Parent = CanvasGroup
	}, {
		Color = "Stroke"
	})

	local Frame2 = DuskShineCore.Utils.Make("Frame", {
		Size = UDim2.new(0, 60, 1, 0),
		BorderSizePixel = 0,
		BackgroundTransparency = 0.4,
		Parent = CanvasGroup
	}, {
		BackgroundColor3 = "Sidebar"
	})

	DuskShineCore.Utils.Make("UICorner", {
		CornerRadius = UDim.new(0, 12),
		Parent = Frame2
	})

	local Frame3 = DuskShineCore.Utils.Make("Frame", {
		Size = UDim2.new(1, 0, 1, -80),
		Position = UDim2.new(0, 0, 0, 20),
		BackgroundTransparency = 1,
		Parent = Frame2
	})

	DuskShineCore.Utils.Make("UIListLayout", {
		HorizontalAlignment = "Center",
		Padding = UDim.new(0, 20),
		Parent = Frame3
	})

	local ImageLabel = DuskShineCore.Utils.Make("ImageLabel", {
		Size = UDim2.new(0, 36, 0, 36),
		Position = UDim2.new(0.5, -18, 1, -65),
		Image = "rbxthumb://type=AvatarHeadShot&id=" .. game:GetService("Players").LocalPlayer.UserId .. "&w=100&h=100",
		Parent = Frame2
	}, {
		BackgroundColor3 = "Section"
	})

	DuskShineCore.Utils.Make("UICorner", {
		CornerRadius = UDim.new(1, 0),
		Parent = ImageLabel
	})
	DuskShineCore.Utils.Make("UIStroke", {
		Thickness = 1,
		Parent = ImageLabel
	}, {
		Color = "Stroke"
	})

	local TextLabel = DuskShineCore.Utils.Make("TextLabel", {
		Size = UDim2.new(1, 0, 1, 0),
		BackgroundTransparency = 1,
		Text = "?",
		Font = Enum.Font.GothamBold,
		TextSize = 20,
		Visible = getgenv().AnonymousMode or false,
		Parent = ImageLabel
	}, {
		TextColor3 = "Accent"
	})

	if getgenv().AnonymousMode then
		ImageLabel.ImageTransparency = 1
		ImageLabel.BackgroundTransparency = 0
		ImageLabel.BackgroundColor3 = Color3.new(0, 0, 0)
	end

	table.insert(DuskShineCore.AnonItems.Avatars, {
		ImageObj = ImageLabel,
		Letter = TextLabel
	})

	local Frame4 = DuskShineCore.Utils.Make("Frame", {
		Size = UDim2.new(1, -60, 0, 60),
		Position = UDim2.new(0, 60, 0, 0),
		BackgroundTransparency = 1,
		Parent = CanvasGroup
	})
	local Frame5 = DuskShineCore.Utils.Make("Frame", {
		Size = UDim2.new(0, 250, 1, 0),
		Position = UDim2.new(0, 25, 0, 0),
		BackgroundTransparency = 1,
		Parent = Frame4
	})

	DuskShineCore.Utils.Make("UIListLayout", {
		FillDirection = Enum.FillDirection.Horizontal,
		VerticalAlignment = Enum.VerticalAlignment.Center,
		SortOrder = Enum.SortOrder.LayoutOrder,
		Parent = Frame5
	})
	DuskShineCore.Utils.Make("TextLabel", {
		LayoutOrder = 1,
		Text = Title,
		AutomaticSize = Enum.AutomaticSize.X,
		Size = UDim2.new(0, 0, 1, 0),
		BackgroundTransparency = 1,
		Font = Enum.Font.GothamBold,
		TextSize = 20,
		Parent = Frame5
	}, {
		TextColor3 = "Text"
	})
	DuskShineCore.Utils.Make("TextLabel", {
		LayoutOrder = 2,
		Text = " " .. AccentTitle,
		AutomaticSize = Enum.AutomaticSize.X,
		Size = UDim2.new(0, 0, 1, 0),
		BackgroundTransparency = 1,
		Font = Enum.Font.GothamBold,
		TextSize = 20,
		Parent = Frame5
	}, {
		TextColor3 = "Accent"
	})
	DuskShineCore.Utils.Make("TextLabel", {
		LayoutOrder = 3,
		Text = "  " .. Version,
		AutomaticSize = Enum.AutomaticSize.X,
		Size = UDim2.new(0, 0, 1, 0),
		BackgroundTransparency = 1,
		Font = Enum.Font.GothamMedium,
		TextSize = 14,
		Parent = Frame5
	}, {
		TextColor3 = "SubText"
	})
	DuskShineCore.Utils.Make("Frame", {
		LayoutOrder = 4,
		Size = UDim2.new(0, 15, 0, 0),
		BackgroundTransparency = 1,
		Parent = Frame5
	})

	local Frame6 = DuskShineCore.Utils.Make("Frame", {
		LayoutOrder = 5,
		AutomaticSize = Enum.AutomaticSize.X,
		Size = UDim2.new(0, 0, 0, 24),
		Parent = Frame5
	}, {
		BackgroundColor3 = "Section"
	})

	DuskShineCore.Utils.Make("UICorner", {
		CornerRadius = UDim.new(1, 0),
		Parent = Frame6
	})
	DuskShineCore.Utils.Make("UIStroke", {
		Thickness = 1,
		Parent = Frame6
	}, {
		Color = "Stroke"
	})
	DuskShineCore.Utils.Make("UIListLayout", {
		FillDirection = Enum.FillDirection.Horizontal,
		VerticalAlignment = Enum.VerticalAlignment.Center,
		Padding = UDim.new(0, 6),
		Parent = Frame6
	})
	DuskShineCore.Utils.Make("UIPadding", {
		PaddingLeft = UDim.new(0, 10),
		PaddingRight = UDim.new(0, 12),
		Parent = Frame6
	})

	local Frame7 = DuskShineCore.Utils.Make("Frame", {
		Size = UDim2.new(0, 8, 0, 8),
		BackgroundColor3 = Color3.fromRGB(15, 205, 105),
		Parent = Frame6
	})

	DuskShineCore.Utils.Make("UICorner", {
		CornerRadius = UDim.new(1, 0),
		Parent = Frame7
	})

	local TextLabel2 = DuskShineCore.Utils.Make("TextLabel", {
		Text = "Loading...",
		AutomaticSize = Enum.AutomaticSize.X,
		Size = UDim2.new(0, 0, 1, 0),
		BackgroundTransparency = 1,
		Font = Enum.Font.GothamMedium,
		TextSize = 12,
		Parent = Frame6
	}, {
		TextColor3 = "SubText"
	})
	local Frame8 = DuskShineCore.Utils.Make("Frame", {
		Size = UDim2.new(0, 80, 0, 20),
		AnchorPoint = Vector2.new(1, 0.5),
		Position = UDim2.new(1, -25, 0.5, 0),
		BackgroundTransparency = 1,
		Parent = Frame4
	})

	DuskShineCore.Utils.Make("UIListLayout", {
		FillDirection = Enum.FillDirection.Horizontal,
		HorizontalAlignment = Enum.HorizontalAlignment.Right,
		Padding = UDim.new(0, 8),
		SortOrder = Enum.SortOrder.LayoutOrder,
		Parent = Frame8
	})

	local function V79(P29, P30, P31)
		local TextButton = DuskShineCore.Utils.Make("TextButton", {
			LayoutOrder = P30,
			Text = "",
			Size = UDim2.new(0, 18, 0, 18),
			Parent = Frame8
		}, {
			BackgroundColor3 = P29
		})

		DuskShineCore.Utils.Make("UICorner", {
			CornerRadius = UDim.new(1, 0),
			Parent = TextButton
		})
		DuskShineCore:Connect(TextButton.MouseButton1Click, P31)
		DuskShineCore:Connect(TextButton.MouseEnter, function()
			DuskShineCore.Utils.TBT(TextButton, 0.2, {
				BackgroundTransparency = 0.3
			})
		end)
		DuskShineCore:Connect(TextButton.MouseLeave, function()
			DuskShineCore.Utils.TBT(TextButton, 0.2, {
				BackgroundTransparency = 0
			})
		end)

		return TextButton
	end

	local Frame9 = DuskShineCore.Utils.Make("Frame", {
		Size = UDim2.new(0, 160, 0, 32),
		AnchorPoint = Vector2.new(1, 0.5),
		Position = UDim2.new(1, -115, 0.5, 0),
		BackgroundTransparency = 1,
		Parent = Frame4
	})

	Frame9.Visible = EnableSearch

	local Frame10 = DuskShineCore.Utils.Make("Frame", {
		Size = UDim2.new(1, 0, 1, 0),
		Parent = Frame9
	}, {
		BackgroundColor3 = "Section"
	})

	DuskShineCore.Utils.Make("UICorner", {
		CornerRadius = UDim.new(1, 0),
		Parent = Frame10
	})
	DuskShineCore.Utils.Make("UIStroke", {
		Parent = Frame10
	}, {
		Color = "Stroke"
	})
	DuskShineCore.Utils.Make("ImageLabel", {
		Size = UDim2.new(0, 16, 0, 16),
		Position = UDim2.new(1, -24, 0.5, 0),
		AnchorPoint = Vector2.new(0, 0.5),
		BackgroundTransparency = 1,
		Image = "rbxassetid://3926305904",
		ImageRectOffset = Vector2.new(964, 324),
		ImageRectSize = Vector2.new(36, 36),
		Parent = Frame9
	}, {
		ImageColor3 = "SubText"
	})

	local TextBox = DuskShineCore.Utils.Make("TextBox", {
		Size = UDim2.new(1, -40, 1, 0),
		Position = UDim2.new(0, 12, 0, 0),
		BackgroundTransparency = 1,
		PlaceholderText = "Search...",
		Text = "",
		Font = Enum.Font.GothamMedium,
		TextSize = 12,
		TextXAlignment = Enum.TextXAlignment.Left,
		ClearTextOnFocus = false,
		Parent = Frame9
	}, {
		TextColor3 = "Text",
		PlaceholderColor3 = "SubText"
	})
	local CanvasGroup2 = DuskShineCore.Utils.Make("CanvasGroup", {
		Name = "FloatingWidget",
		Size = UDim2.new(0, 50, 0, 50),
		Position = UDim2.new(0.5, 0, 0.1, 0),
		AnchorPoint = Vector2.new(0.5, 0.5),
		GroupTransparency = 1,
		Visible = false,
		ZIndex = 15,
		Parent = ScreenGui
	}, {
		BackgroundColor3 = "Sidebar"
	})

	DuskShineCore.Utils.Make("UICorner", {
		CornerRadius = UDim.new(1, 0),
		Parent = CanvasGroup2
	})
	DuskShineCore.Utils.Make("UIStroke", {
		Thickness = 2,
		Parent = CanvasGroup2
	}, {
		Color = "Accent"
	})
	DuskShineCore.Utils.Make("ImageLabel", {
		Size = UDim2.new(0, 26, 0, 26),
		Position = UDim2.new(0.5, 0, 0.5, 0),
		AnchorPoint = Vector2.new(0.5, 0.5),
		BackgroundTransparency = 1,
		Image = "rbxassetid://72958619361915",
		ZIndex = 16,
		Parent = CanvasGroup2
	}, {
		ImageColor3 = "Text"
	})

	local TextButton = DuskShineCore.Utils.Make("TextButton", {
		Size = UDim2.new(1, 0, 1, 0),
		BackgroundTransparency = 1,
		Text = "",
		ZIndex = 17,
		Parent = CanvasGroup2
	})
	local TextButton2 = DuskShineCore.Utils.Make("TextButton", {
		Size = UDim2.new(0, 140, 0, 40),
		AnchorPoint = Vector2.new(0.5, 0),
		Position = UDim2.new(0.5, 0, 0, -60),
		Text = "Open Menu",
		Font = Enum.Font.GothamBold,
		TextSize = 14,
		Visible = false,
		ZIndex = 15,
		Parent = ScreenGui
	}, {
		BackgroundColor3 = "Sidebar",
		TextColor3 = "Text"
	})

	DuskShineCore.Utils.Make("UICorner", {
		CornerRadius = UDim.new(0, 8),
		Parent = TextButton2
	})
	DuskShineCore.Utils.Make("UIStroke", {
		ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
		Thickness = 2,
		Parent = TextButton2
	}, {
		Color = "Accent"
	})

	local function V87()
		if CanvasGroup.Visible then
			DuskShineCore.Utils.TBT(CanvasGroup, 0.3, {
				GroupTransparency = 1,
				Size = UDim2.new(0, 700, 0, 400)
			}, Enum.EasingStyle.Back, Enum.EasingDirection.In).Completed:Wait()
			CanvasGroup.Visible = false

			if getgenv().CloserType == "Floating Logo" then
				CanvasGroup2.Visible = true
				CanvasGroup2.Size = UDim2.new(0, 0, 0, 0)
				DuskShineCore.Utils.TBT(CanvasGroup2, 0.4, {
					Size = UDim2.new(0, 50, 0, 50),
					GroupTransparency = 0
				}, Enum.EasingStyle.Back, Enum.EasingDirection.Out)
			else
				TextButton2.Visible = true
				TextButton2.BackgroundTransparency = 1
				DuskShineCore.Utils.TBT(TextButton2, 0.4, {
					Position = UDim2.new(0.5, 0, 0, 10),
					BackgroundTransparency = 0
				}, Enum.EasingStyle.Back, Enum.EasingDirection.Out)
			end
		else
			if getgenv().CloserType == "Floating Logo" then
				DuskShineCore.Utils.TBT(CanvasGroup2, 0.3, {
					Size = UDim2.new(0, 0, 0, 0),
					GroupTransparency = 1
				}, Enum.EasingStyle.Back, Enum.EasingDirection.In).Completed:Wait()
				CanvasGroup2.Visible = false
			else
				DuskShineCore.Utils.TBT(TextButton2, 0.3, {
					Position = UDim2.new(0.5, 0, 0, -50)
				}, Enum.EasingStyle.Back, Enum.EasingDirection.In).Completed:Wait()
				TextButton2.Visible = false
			end

			CanvasGroup.Visible = true
			DuskShineCore.Utils.TBT(CanvasGroup, 0.4, {
				GroupTransparency = 0,
				Size = Size
			}, Enum.EasingStyle.Back, Enum.EasingDirection.Out)
		end
	end

	DuskShineCore:Connect(TextButton.MouseButton1Click, V87)
	DuskShineCore:Connect(TextButton2.MouseButton1Click, V87)
	V79("Green", 1, function()
		DuskShineCore:ToggleTheme()
	end)
	V79("Yellow", 2, V87)
	V79("Red", 3, function()
		if CanvasGroup:FindFirstChild("CloseConfirmationOverlay") then
			return
		end

		local Frame11 = DuskShineCore.Utils.Make("Frame", {
			Name = "CloseConfirmationOverlay",
			Size = UDim2.new(1, 0, 1, 0),
			BackgroundColor3 = Color3.new(0, 0, 0),
			BackgroundTransparency = 1,
			ZIndex = 100,
			Parent = CanvasGroup
		})

		DuskShineCore.Utils.Make("UICorner", {
			CornerRadius = UDim.new(0, 14),
			Parent = Frame11
		})

		local Frame12 = DuskShineCore.Utils.Make("Frame", {
			Size = UDim2.new(0, 280, 0, 140),
			AnchorPoint = Vector2.new(0.5, 0.5),
			Position = UDim2.new(0.5, 0, 0.5, 20),
			BackgroundTransparency = 1,
			ZIndex = 101,
			Parent = Frame11
		}, {
			BackgroundColor3 = "Section"
		})

		DuskShineCore.Utils.Make("UICorner", {
			CornerRadius = UDim.new(0, 12),
			Parent = Frame12
		})

		local UIStroke = DuskShineCore.Utils.Make("UIStroke", {
			Thickness = 1,
			Transparency = 1,
			Parent = Frame12
		}, {
			Color = "Stroke"
		})
		local TextLabel3 = DuskShineCore.Utils.Make("TextLabel", {
			Text = "Close Script?",
			Size = UDim2.new(1, 0, 0, 30),
			Position = UDim2.new(0, 0, 0, 15),
			BackgroundTransparency = 1,
			Font = Enum.Font.GothamBold,
			TextSize = 18,
			TextTransparency = 1,
			ZIndex = 102,
			Parent = Frame12
		}, {
			TextColor3 = "Text"
		})
		local TextLabel4 = DuskShineCore.Utils.Make("TextLabel", {
			Text = "Are you sure you want to exit?",
			Size = UDim2.new(1, 0, 0, 20),
			Position = UDim2.new(0, 0, 0, 45),
			BackgroundTransparency = 1,
			Font = Enum.Font.GothamMedium,
			TextSize = 13,
			TextTransparency = 1,
			ZIndex = 102,
			Parent = Frame12
		}, {
			TextColor3 = "SubText"
		})
		local Frame13 = DuskShineCore.Utils.Make("Frame", {
			Size = UDim2.new(1, -40, 0, 35),
			Position = UDim2.new(0, 20, 1, -50),
			BackgroundTransparency = 1,
			ZIndex = 102,
			Parent = Frame12
		})

		DuskShineCore.Utils.Make("UIListLayout", {
			FillDirection = Enum.FillDirection.Horizontal,
			HorizontalAlignment = Enum.HorizontalAlignment.Center,
			Padding = UDim.new(0.06, 0),
			SortOrder = Enum.SortOrder.LayoutOrder,
			Parent = Frame13
		})

		local TextButton3 = DuskShineCore.Utils.Make("TextButton", {
			LayoutOrder = 1,
			Text = "Continue",
			Size = UDim2.new(0.47, 0, 1, 0),
			Font = Enum.Font.GothamMedium,
			TextSize = 13,
			AutoButtonColor = false,
			BackgroundTransparency = 1,
			TextTransparency = 1,
			ZIndex = 103,
			Parent = Frame13
		}, {
			BackgroundColor3 = "Sidebar",
			TextColor3 = "Text"
		})

		DuskShineCore.Utils.Make("UICorner", {
			CornerRadius = UDim.new(0, 8),
			Parent = TextButton3
		})

		local UIStroke2 = DuskShineCore.Utils.Make("UIStroke", {
			Thickness = 1,
			Transparency = 1,
			Parent = TextButton3
		}, {
			Color = "Stroke"
		})
		local TextButton4 = DuskShineCore.Utils.Make("TextButton", {
			LayoutOrder = 2,
			Text = "Close",
			Size = UDim2.new(0.47, 0, 1, 0),
			Font = Enum.Font.GothamBold,
			TextSize = 13,
			AutoButtonColor = false,
			BackgroundTransparency = 1,
			TextTransparency = 1,
			ZIndex = 103,
			Parent = Frame13
		}, {
			BackgroundColor3 = "Red",
			TextColor3 = "Text"
		})

		DuskShineCore.Utils.Make("UICorner", {
			CornerRadius = UDim.new(0, 8),
			Parent = TextButton4
		})
		DuskShineCore.Utils.TBT(Frame11, 0.3, {
			BackgroundTransparency = 0.4
		})
		DuskShineCore.Utils.TBT(Frame12, 0.4, {
			Position = UDim2.new(0.5, 0, 0.5, 0),
			BackgroundTransparency = 0
		}, Enum.EasingStyle.Back, Enum.EasingDirection.Out)
		DuskShineCore.Utils.TBT(UIStroke, 0.3, {
			Transparency = 0
		})
		DuskShineCore.Utils.TBT(TextLabel3, 0.3, {
			TextTransparency = 0
		})
		DuskShineCore.Utils.TBT(TextLabel4, 0.3, {
			TextTransparency = 0
		})
		DuskShineCore.Utils.TBT(TextButton3, 0.3, {
			BackgroundTransparency = 0,
			TextTransparency = 0
		})
		DuskShineCore.Utils.TBT(UIStroke2, 0.3, {
			Transparency = 0
		})
		DuskShineCore.Utils.TBT(TextButton4, 0.3, {
			BackgroundTransparency = 0,
			TextTransparency = 0
		})
		DuskShineCore:Connect(TextButton3.MouseEnter, function()
			DuskShineCore.Utils.TBT(UIStroke2, 0.2, {
				Color = DuskShineCore.CurrentTheme.Accent
			})
		end)
		DuskShineCore:Connect(TextButton3.MouseLeave, function()
			DuskShineCore.Utils.TBT(UIStroke2, 0.2, {
				Color = DuskShineCore.CurrentTheme.Stroke
			})
		end)

		local UIScale2 = Instance.new("UIScale", TextButton4)

		DuskShineCore:Connect(TextButton4.MouseEnter, function()
			DuskShineCore.Utils.TBT(UIScale2, 0.2, {
				Scale = 1.05
			})
		end)
		DuskShineCore:Connect(TextButton4.MouseLeave, function()
			DuskShineCore.Utils.TBT(UIScale2, 0.2, {
				Scale = 1
			})
		end)

		local function V98()
			DuskShineCore.Utils.TBT(Frame11, 0.3, {
				BackgroundTransparency = 1
			})

			local V99 = DuskShineCore.Utils.TBT(Frame12, 0.3, {
				Position = UDim2.new(0.5, 0, 0.5, 20),
				BackgroundTransparency = 1
			}, Enum.EasingStyle.Back, Enum.EasingDirection.In)

			DuskShineCore.Utils.TBT(UIStroke, 0.2, {
				Transparency = 1
			})
			DuskShineCore.Utils.TBT(TextLabel3, 0.2, {
				TextTransparency = 1
			})
			DuskShineCore.Utils.TBT(TextLabel4, 0.2, {
				TextTransparency = 1
			})
			DuskShineCore.Utils.TBT(TextButton3, 0.2, {
				BackgroundTransparency = 1,
				TextTransparency = 1
			})
			DuskShineCore.Utils.TBT(UIStroke2, 0.2, {
				Transparency = 1
			})
			DuskShineCore.Utils.TBT(TextButton4, 0.2, {
				BackgroundTransparency = 1,
				TextTransparency = 1
			})
			V99.Completed:Connect(function()
				Frame11:Destroy()
			end)
		end

		DuskShineCore:Connect(TextButton3.MouseButton1Click, function()
			DuskShineCore.Utils.CreateRipple(TextButton3)
			V98()
		end)
		DuskShineCore:Connect(TextButton4.MouseButton1Click, function()
			DuskShineCore.Utils.TBT(CanvasGroup, 0.3, {
				GroupTransparency = 1,
				Size = UDim2.new(0, 700, 0, 400)
			}, Enum.EasingStyle.Back, Enum.EasingDirection.In)
			task.delay(0.3, function()
				DuskShineCore:Destroy()
			end)
		end)
	end)

	local Frame11 = Instance.new("Frame")

	Frame11.Size = UDim2.new(1, -60, 1, -60)
	Frame11.Position = UDim2.new(0, 60, 0, 60)
	Frame11.BackgroundTransparency = 1
	Frame11.ClipsDescendants = true
	Frame11.Parent = CanvasGroup

	local U101
	local U102
	local Position
	local Position2

	Frame4.InputBegan:Connect(function(Input)
		if Input.UserInputType == Enum.UserInputType.MouseButton1 or Input.UserInputType == Enum.UserInputType.Touch then
			U101 = true
			Position = Input.Position
			Position2 = CanvasGroup.Position
		end
	end)
	Frame4.InputChanged:Connect(function(Input)
		if Input.UserInputType == Enum.UserInputType.MouseMovement or Input.UserInputType == Enum.UserInputType.Touch then
			U102 = Input
		end
	end)
	DuskShineCore:Connect(UserInputService.InputChanged, function(P32)
		if P32 == U102 and U101 then
			local V105 = P32.Position - Position

			CanvasGroup.Position = UDim2.new(Position2.X.Scale, Position2.X.Offset + V105.X, Position2.Y.Scale, Position2.Y.Offset + V105.Y)
		end
	end)
	DuskShineCore:Connect(UserInputService.InputEnded, function(P33)
		if P33.UserInputType == Enum.UserInputType.MouseButton1 then
			U101 = false
		elseif P33.UserInputType == Enum.UserInputType.Touch then
			U101 = false

			return
		end
	end)

	local T3 = {
		MainFrame = CanvasGroup,
		TabsContainer = Frame3,
		PagesContainer = Frame11,
		Tabs = {},
		CurrentTab = nil,
		ToggleMenu = V87,
		SetOnlineStatus = function(P34, P35)
			TextLabel2.Text = tostring(P35)
			DuskShineCore.Utils.TBT(Frame7, 0.4, {
				BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			})
			task.delay(0.4, function()
				DuskShineCore.Utils.TBT(Frame7, 0.4, {
					BackgroundColor3 = Color3.fromRGB(15, 205, 105)
				})
			end)
		end,
		SelectTab = function(P36, P37)
			if P36.CurrentTab == P37.Btn then
				return
			end

			if TextBox and TextBox.Text ~= "" then
				TextBox.Text = ""
			end

			P36.CurrentTab = P37.Btn

			for _, Tab in ipairs(P36.Tabs) do
				if Tab.Btn == P37.Btn then
					Tab.Page.Visible = true
					Tab.Page.Position = UDim2.new(0, 0, 0, 25)
					DuskShineCore.Utils.TBT(Tab.Page, 0.3, {
						Position = UDim2.new(0, 0, 0, 5)
					}, Enum.EasingStyle.Quint)
					DuskShineCore.ThemeObjects[Tab.Icon] = {
						ImageColor3 = "Accent"
					}
					DuskShineCore.ThemeObjects[Tab.Indicator] = {
						BackgroundColor3 = "Accent"
					}

					local DuskShineGradient = Tab.Indicator:FindFirstChild("DuskShine_Gradient")

					if DuskShineGradient then
						DuskShineGradient:Destroy()
					end

					Tab.Indicator.BackgroundColor3 = DuskShineCore.CurrentTheme.Accent
					Tab.Icon.ImageColor3 = DuskShineCore.CurrentTheme.Accent
					DuskShineCore.Utils.TBT(Tab.Icon, 0.3, {
						Size = UDim2.new(1.15, 0, 1.15, 0),
						Rotation = -12
					}, Enum.EasingStyle.Back)
					DuskShineCore.Utils.TBT(Tab.Indicator, 0.3, {
						BackgroundTransparency = 0
					})
				else
					Tab.Page.Visible = false
					DuskShineCore.ThemeObjects[Tab.Icon] = {
						ImageColor3 = "SubText"
					}
					DuskShineCore.ThemeObjects[Tab.Indicator] = {
						BackgroundColor3 = "SubText"
					}

					local DuskShineGradient = Tab.Indicator:FindFirstChild("DuskShine_Gradient")

					if DuskShineGradient then
						DuskShineGradient:Destroy()
					end

					Tab.Indicator.BackgroundColor3 = DuskShineCore.CurrentTheme.SubText
					Tab.Icon.ImageColor3 = DuskShineCore.CurrentTheme.SubText
					DuskShineCore.Utils.TBT(Tab.Icon, 0.2, {
						Size = UDim2.new(1, 0, 1, 0),
						Rotation = 0
					})
					DuskShineCore.Utils.TBT(Tab.Indicator, 0.2, {
						BackgroundTransparency = 1
					})
				end
			end
		end
	}

	local function createTab(P38, P39)
		local V112 = P39 or {}
		local Name = V112.Name or "Unknown"
		local Icon = V112.Icon or "18957829775"
		local ScrollingFrame = Instance.new("ScrollingFrame")

		ScrollingFrame.Size = UDim2.new(1, -4, 1, -15)
		ScrollingFrame.Position = UDim2.new(0, 0, 0, 5)
		ScrollingFrame.BackgroundTransparency = 1
		ScrollingFrame.BorderSizePixel = 0
		ScrollingFrame.ScrollBarThickness = 2
		ScrollingFrame.ScrollBarImageTransparency = 0.2
		ScrollingFrame.Visible = false
		ScrollingFrame.Parent = P38.PagesContainer
		ScrollingFrame.AutomaticCanvasSize = Enum.AutomaticSize.Y
		ScrollingFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
		DuskShineCore.ThemeObjects[ScrollingFrame] = {
			ScrollBarImageColor3 = "SubText"
		}
		ScrollingFrame.ScrollBarImageColor3 = DuskShineCore.CurrentTheme.SubText

		local UIListLayout = Instance.new("UIListLayout", ScrollingFrame)

		UIListLayout.Padding = UDim.new(0, 12)
		UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder

		local UIPadding = Instance.new("UIPadding", ScrollingFrame)

		UIPadding.PaddingTop = UDim.new(0, 10)
		UIPadding.PaddingLeft = UDim.new(0, 25)
		UIPadding.PaddingRight = UDim.new(0, 25)
		UIPadding.PaddingBottom = UDim.new(0, 15)

		local ImageButton = Instance.new("ImageButton", P38.TabsContainer)

		ImageButton.Size = UDim2.new(0, 32, 0, 32)
		ImageButton.BackgroundTransparency = 1
		ImageButton.AutoButtonColor = false

		local ImageLabel2 = Instance.new("ImageLabel", ImageButton)

		ImageLabel2.Size = UDim2.new(1, 0, 1, 0)
		ImageLabel2.AnchorPoint = Vector2.new(0.5, 0.5)
		ImageLabel2.Position = UDim2.new(0.5, 0, 0.5, 0)
		ImageLabel2.BackgroundTransparency = 1
		ImageLabel2.Image = "rbxassetid://" .. Icon
		DuskShineCore.ThemeObjects[ImageLabel2] = {
			ImageColor3 = "SubText"
		}
		ImageLabel2.ImageColor3 = DuskShineCore.CurrentTheme.SubText

		local Frame12 = DuskShineCore.Utils.Make("Frame", {
			Size = UDim2.new(0, 4, 0.5, 0),
			Position = UDim2.new(0, -10, 0.5, 0),
			AnchorPoint = Vector2.new(0, 0.5),
			BackgroundTransparency = 1,
			Parent = ImageButton,
			BackgroundColor3 = DuskShineCore.CurrentTheme.SubText
		})

		DuskShineCore.ThemeObjects[Frame12] = {
			BackgroundColor3 = "SubText"
		}
		DuskShineCore.Utils.Make("UICorner", {
			CornerRadius = UDim.new(1, 0),
			Parent = Frame12
		})

		local T4 = {
			Name = Name,
			Page = ScrollingFrame,
			Btn = ImageButton,
			Icon = ImageLabel2,
			Indicator = Frame12,
			SubPages = {}
		}

		table.insert(P38.Tabs, T4)
		ImageButton.MouseButton1Click:Connect(function()
			if T3.CurrentTab == T4.Btn then
				for _, SubPage in ipairs(T4.SubPages) do
					if SubPage.Close then
						SubPage.Close()
					end
				end
			else
				T3:SelectTab(T4)
			end
		end)
		table.insert(P38.Tabs, T4)
		T4.CreateButton = function(P40, P41)
			local V124 = P41 or {}
			local Name2 = V124.Name or "Button"
			local Callback = V124.Callback or function()
			end
			local TextButton3 = DuskShineCore.Utils.Make("TextButton", {
				Size = UDim2.new(1, 0, 0, 45),
				Text = Name2,
				FontFace = font,
				TextSize = 14,
				AutoButtonColor = false,
				Parent = ScrollingFrame
			}, {
				BackgroundColor3 = "Section",
				TextColor3 = "Text"
			})

			DuskShineCore.Utils.Make("UICorner", {
				CornerRadius = UDim.new(0, 10),
				Parent = TextButton3
			})

			local UIStroke = DuskShineCore.Utils.Make("UIStroke", {
				ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
				Thickness = 1.5,
				Transparency = 0.4,
				Parent = TextButton3
			}, {
				Color = "Accent"
			})
			local UIScale2 = Instance.new("UIScale", TextButton3)

			DuskShineCore:Connect(TextButton3.MouseEnter, function()
				DuskShineCore.Utils.TBT(UIStroke, 0.25, {
					Transparency = 0,
					Thickness = 2
				})
			end)
			DuskShineCore:Connect(TextButton3.MouseLeave, function()
				DuskShineCore.Utils.TBT(UIStroke, 0.25, {
					Transparency = 0.4,
					Thickness = 1.5
				})
			end)
			DuskShineCore:Connect(TextButton3.MouseButton1Click, function()
				local V130 = DuskShineCore.Utils.TBT(UIScale2, 0.1, {
					Scale = 0.96
				}, Enum.EasingStyle.Sine)

				V130.Completed:Connect(function()
					DuskShineCore.Utils.TBT(UIScale2, 0.2, {
						Scale = 1
					}, Enum.EasingStyle.Bounce)
				end)
				pcall(Callback)
			end)

			return TextButton3
		end
		T4.CreateCopyLink = function(P42, P43)
			local Name2 = P43.Name or "Link"
			local Url = P43.Url or ""
			local NotifyIcon = P43.NotifyIcon or "10723426722"
			local NotifyLogo = P43.NotifyLogo or "72958619361915"
			local Frame13 = DuskShineCore.Utils.Make("Frame", {
				Size = UDim2.new(1, 0, 0, 46),
				Parent = ScrollingFrame
			}, {
				BackgroundColor3 = "Section"
			})

			DuskShineCore.Utils.Make("UICorner", {
				CornerRadius = UDim.new(0, 8),
				Parent = Frame13
			})

			local UIStroke = DuskShineCore.Utils.Make("UIStroke", {
				Thickness = 1,
				Parent = Frame13
			}, {
				Color = "Stroke"
			})
			local TextButton3 = DuskShineCore.Utils.Make("TextButton", {
				Size = UDim2.new(1, 0, 1, 0),
				BackgroundTransparency = 1,
				Text = "",
				Parent = Frame13
			})

			DuskShineCore.Utils.Make("TextLabel", {
				Text = Name2,
				Size = UDim2.new(1, -45, 0, 16),
				Position = UDim2.new(0, 14, 0, 8),
				BackgroundTransparency = 1,
				Font = Enum.Font.GothamBold,
				TextSize = 13,
				TextXAlignment = Enum.TextXAlignment.Left,
				Parent = Frame13
			}, {
				TextColor3 = "Text"
			})
			DuskShineCore.Utils.Make("TextLabel", {
				Text = Url,
				Size = UDim2.new(1, -45, 0, 14),
				Position = UDim2.new(0, 14, 0, 26),
				BackgroundTransparency = 1,
				Font = Enum.Font.GothamMedium,
				TextSize = 11,
				TextXAlignment = Enum.TextXAlignment.Left,
				Parent = Frame13
			}, {
				TextColor3 = "SubText"
			})

			local ImageLabel3 = DuskShineCore.Utils.Make("ImageLabel", {
				Size = UDim2.new(0, 18, 0, 18),
				Position = UDim2.new(1, -30, 0.5, -9),
				BackgroundTransparency = 1,
				Image = "rbxassetid://10827393433",
				Parent = Frame13
			}, {
				ImageColor3 = "SubText"
			})

			DuskShineCore:Connect(TextButton3.MouseEnter, function()
				DuskShineCore.Utils.TBT(UIStroke, 0.25, {
					Color = DuskShineCore.CurrentTheme.Accent
				})
				DuskShineCore.Utils.TBT(ImageLabel3, 0.25, {
					ImageColor3 = DuskShineCore.CurrentTheme.Accent
				})
			end)
			DuskShineCore:Connect(TextButton3.MouseLeave, function()
				DuskShineCore.Utils.TBT(UIStroke, 0.25, {
					Color = DuskShineCore.CurrentTheme.Stroke
				})
				DuskShineCore.Utils.TBT(ImageLabel3, 0.25, {
					ImageColor3 = DuskShineCore.CurrentTheme.SubText
				})
			end)
			DuskShineCore:Connect(TextButton3.MouseButton1Click, function()
				DuskShineCore.Utils.CreateRipple(Frame13)

				if setclipboard then
					pcall(function()
						setclipboard(Url)
					end)

					if DuskShineCore and DuskShineCore.Notify then
						DuskShineCore:Notify("Link Copied!", "Copied " .. Name2 .. " to clipboard.", 3, NotifyIcon, NotifyLogo)
					end
				elseif DuskShineCore and DuskShineCore.Notify then
					DuskShineCore:Notify("Error", "Your executor doesn't support clipboard copying.", 4)
				end
			end)

			return Frame13
		end
		T4.CreateToggle = function(P44, P45)
			local V139 = P45 or {}
			local Name2 = V139.Name or "Toggle"
			local Description = V139.Description or ""
			local V142 = DuskShineCore.Utils.GetConfigValue(flag, V139.Default or false)
			local Flag = V139.Flag or Name2:gsub("%s+", "")
			local Callback = V139.Callback or function()
			end
			local Settings = V139.Settings

			DuskShineCore.Flags[Flag] = V142

			local TransparentUI = getgenv().TransparentUI or false
			local Make = DuskShineCore.Utils.Make
			local S1 = "Frame"
			local V149 = Make(S1, {
				Size = UDim2.new(1, 0, 0, 70),
				BackgroundTransparency = TransparentUI and 0.3 or 0,
				Parent = ScrollingFrame
			}, {
				BackgroundColor3 = "Section"
			})

			DuskShineCore.Utils.Make("UICorner", {
				CornerRadius = UDim.new(0, 10),
				Parent = V149
			})

			if TransparentUI then
				local UIStroke = DuskShineCore.Utils.Make("UIStroke", {
					Thickness = 1,
					Parent = V149
				}, {
					Color = "Stroke"
				})

				DuskShineCore:Connect(V149.MouseEnter, function()
					DuskShineCore.Utils.TBT(UIStroke, 0.25, {
						Color = DuskShineCore.CurrentTheme.Accent
					})
				end)
				DuskShineCore:Connect(V149.MouseLeave, function()
					DuskShineCore.Utils.TBT(UIStroke, 0.25, {
						Color = DuskShineCore.CurrentTheme.Stroke
					})
				end)
			end

			DuskShineCore.Utils.Make("TextLabel", {
				Text = Name2,
				Size = UDim2.new(1, -70, 0, 20),
				Position = UDim2.new(0, 20, 0, 15),
				BackgroundTransparency = 1,
				Font = Enum.Font.GothamBold,
				TextSize = 16,
				TextXAlignment = Enum.TextXAlignment.Left,
				Parent = V149
			}, {
				TextColor3 = "Text"
			})
			DuskShineCore.Utils.Make("TextLabel", {
				Text = Description,
				Size = UDim2.new(1, -90, 0, 15),
				Position = UDim2.new(0, 20, 0, 38),
				BackgroundTransparency = 1,
				FontFace = font,
				TextSize = 13,
				TextXAlignment = Enum.TextXAlignment.Left,
				Parent = V149
			}, {
				TextColor3 = "SubText"
			})

			local Make2 = DuskShineCore.Utils.Make
			local TextButton3 = Make2("TextButton", {
				Text = "",
				Size = UDim2.new(0, 48, 0, 26),
				AnchorPoint = Vector2.new(1, 0.5),
				Position = UDim2.new(1, -20, 0.5, 0),
				Parent = V149
			}, {
				BackgroundColor3 = V142 and "Accent" or "ToggleOff"
			})

			DuskShineCore.Utils.Make("UICorner", {
				CornerRadius = UDim.new(1, 0),
				Parent = TextButton3
			})

			local uDim2 = UDim2.new(1, -23, 0.5, 0)
			local UDim22 = UDim2.new(0, 3, 0.5, 0)
			local Make3 = DuskShineCore.Utils.Make
			local S2 = "Frame"
			local V157 = Make3(S2, {
				Size = UDim2.new(0, 20, 0, 20),
				AnchorPoint = Vector2.new(0, 0.5),
				Position = V142 and uDim2 or UDim22,
				Parent = TextButton3
			}, {
				BackgroundColor3 = "Knob"
			})

			DuskShineCore.Utils.Make("UICorner", {
				CornerRadius = UDim.new(1, 0),
				Parent = V157
			})

			if Settings then
				local ImageButton2 = DuskShineCore.Utils.Make("ImageButton", {
					Size = UDim2.new(0, 20, 0, 20),
					AnchorPoint = Vector2.new(1, 0.5),
					Position = UDim2.new(1, -80, 0.5, 0),
					BackgroundTransparency = 1,
					Image = "rbxassetid://7734053495",
					Parent = V149
				})

				DuskShineCore.ThemeObjects[ImageButton2] = {
					ImageColor3 = "SubText"
				}
				ImageButton2.ImageColor3 = DuskShineCore.CurrentTheme.SubText

				local UIScale2 = Instance.new("UIScale", ImageButton2)

				DuskShineCore:Connect(ImageButton2.MouseEnter, function()
					DuskShineCore.Utils.TBT(UIScale2, 0.2, {
						Scale = 1.15
					})
					DuskShineCore.Utils.TBT(ImageButton2, 0.2, {
						ImageColor3 = DuskShineCore.CurrentTheme.Accent
					})
				end)
				DuskShineCore:Connect(ImageButton2.MouseLeave, function()
					DuskShineCore.Utils.TBT(UIScale2, 0.2, {
						Scale = 1
					})
					DuskShineCore.Utils.TBT(ImageButton2, 0.2, {
						ImageColor3 = DuskShineCore.CurrentTheme.SubText
					})
				end)
				DuskShineCore:Connect(ImageButton2.MouseButton1Click, function()
					DuskShineCore.Utils.CreateRipple(ImageButton2)

					local TBT = DuskShineCore.Utils.TBT
					local T5 = {
						Scale = 0.85
					}

					TBT(UIScale2, 0.1, T5).Completed:Connect(function()
						DuskShineCore.Utils.TBT(UIScale2, 0.2, {
							Scale = 1
						}, Enum.EasingStyle.Bounce)
					end)
					pcall(Settings)
				end)
			end

			local function V162(P46)
				if DuskShineCore.Flags[Flag] == P46 then
					return
				end

				DuskShineCore.Flags[Flag] = P46

				local V163 = DuskShineCore.ThemeObjects[TextButton3]

				V163.BackgroundColor3 = P46 and "Accent" or "ToggleOff"
				DuskShineCore.Utils.TBT(TextButton3, 0.25, {
					BackgroundColor3 = P46 and DuskShineCore.CurrentTheme.Accent or DuskShineCore.CurrentTheme.ToggleOff
				})
				DuskShineCore.Utils.TBT(V157, 0.25, {
					Position = P46 and uDim2 or UDim22
				})

				if P46 then
					DuskShineCore.Utils.ApplyGradient(TextButton3, DuskShineCore.CurrentTheme.Accent)
				else
					local DuskShineGradient = TextButton3:FindFirstChild("DuskShine_Gradient")

					if DuskShineGradient then
						DuskShineGradient:Destroy()
					end
				end

				pcall(Callback, P46)
			end

			DuskShineCore.ConfigUpdaters[Flag] = function(P47)
				V162(P47)
			end
			DuskShineCore:Connect(TextButton3.MouseButton1Click, function()
				V162(not DuskShineCore.Flags[Flag])
			end)
			task.spawn(function()
				pcall(Callback, DuskShineCore.Flags[Flag])
			end)

			return {
				Container = V149,
				SetState = V162,
				GetValue = function()
					return DuskShineCore.Flags[Flag]
				end
			}
		end
		T4.CreateSubPage = function(P48, P49)
			local Name2 = (P49 or {}).Name or "Sub Page"
			local Frame13 = DuskShineCore.Utils.Make("Frame", {
				Name = "CustomSubPage_" .. Name2:gsub("%s+", ""),
				Size = UDim2.new(1, 0, 1, 0),
				Position = UDim2.new(0, 0, 0, 0),
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				Visible = false,
				ZIndex = 100,
				Parent = ScrollingFrame
			})
			local Frame14 = DuskShineCore.Utils.Make("Frame", {
				Size = UDim2.new(1, 0, 0, 40),
				BackgroundTransparency = 1,
				Parent = Frame13
			})
			local TextButton3 = DuskShineCore.Utils.Make("TextButton", {
				Text = "➖",
				Size = UDim2.new(0, 34, 0, 34),
				Position = UDim2.new(1, -10, 0, 10),
				AnchorPoint = Vector2.new(1, 0),
				Font = Enum.Font.GothamBold,
				TextSize = 14,
				Parent = Frame14
			}, {
				BackgroundColor3 = "Section",
				TextColor3 = "SubText"
			})

			DuskShineCore.Utils.Make("UICorner", {
				CornerRadius = UDim.new(0, 6),
				Parent = TextButton3
			})
			DuskShineCore.Utils.Make("UIStroke", {
				Parent = TextButton3
			}, {
				Color = "Stroke"
			})
			DuskShineCore:Connect(TextButton3.MouseEnter, function()
				TextButton3.BackgroundColor3 = DuskShineCore.CurrentTheme.Stroke
			end)
			DuskShineCore:Connect(TextButton3.MouseLeave, function()
				TextButton3.BackgroundColor3 = DuskShineCore.CurrentTheme.Section
			end)
			DuskShineCore.Utils.Make("TextLabel", {
				Text = Name2,
				Size = UDim2.new(1, -60, 0, 20),
				Position = UDim2.new(0, 15, 0, 17),
				BackgroundTransparency = 1,
				Font = Enum.Font.GothamBlack,
				TextSize = 16,
				TextXAlignment = Enum.TextXAlignment.Left,
				Parent = Frame13
			}, {
				TextColor3 = "Text"
			})

			local ScrollingFrame2 = DuskShineCore.Utils.Make("ScrollingFrame", {
				Size = UDim2.new(1, 0, 1, -50),
				Position = UDim2.new(0, 0, 0, 50),
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				ScrollBarThickness = 2,
				AutomaticCanvasSize = Enum.AutomaticSize.Y,
				CanvasSize = UDim2.new(0, 0, 0, 0),
				Parent = Frame13
			}, {
				ScrollBarImageColor3 = "SubText"
			})

			DuskShineCore.Utils.Make("UIListLayout", {
				Padding = UDim.new(0, 12),
				SortOrder = Enum.SortOrder.LayoutOrder,
				Parent = ScrollingFrame2
			})
			DuskShineCore.Utils.Make("UIPadding", {
				PaddingTop = UDim.new(0, 5),
				PaddingLeft = UDim.new(0, 12),
				PaddingRight = UDim.new(0, 12),
				PaddingBottom = UDim.new(0, 15),
				Parent = ScrollingFrame2
			})

			local T6 = {}
			local vector2 = Vector2.new(0, 0)

			local function V172()
				if not Frame13.Visible then
					return
				end

				Frame13.Visible = false

				for _, V in ipairs(T6) do
					if V then
						V.Visible = true
					end
				end

				T6 = {}
				ScrollingFrame.ScrollingEnabled = true
				ScrollingFrame.CanvasPosition = vector2
			end

			DuskShineCore:Connect(TextButton3.MouseButton1Click, V172)
			DuskShineCore:Connect(ScrollingFrame:GetPropertyChangedSignal("Visible"), function()
				if not ScrollingFrame.Visible and Frame13.Visible then
					Frame13.Visible = false

					for _, V in ipairs(T6) do
						if V then
							V.Visible = true
						end
					end

					T6 = {}
					ScrollingFrame.ScrollingEnabled = true
					ScrollingFrame.CanvasPosition = vector2
				end
			end)

			local T7 = {
				Container = ScrollingFrame2,
				Open = function()
					if Frame13.Visible then
						return
					end

					T6 = {}

					for _, Child in ipairs(ScrollingFrame:GetChildren()) do
						if Child:IsA("GuiObject") and Child.Visible and Child ~= Frame13 and not Child:IsA("UIListLayout") then
							if not Child:IsA("UIPadding") then
								table.insert(T6, Child)
								Child.Visible = false
							end
						end
					end

					vector2 = ScrollingFrame.CanvasPosition
					ScrollingFrame.ScrollingEnabled = false
					ScrollingFrame.CanvasPosition = Vector2.new(0, 0)
					Frame13.Visible = true
				end,
				Close = V172
			}

			table.insert(T4.SubPages, T7)

			return T7
		end
		T4.CreateSlider = function(P50, P51)
			local V180 = P51 or {}
			local Name2 = V180.Name or "Slider"
			local Min = V180.Min or 0
			local Max = V180.Max or 100
			local V184 = DuskShineCore.Utils.GetConfigValue(flag, V180.Default or false)
			local Flag = V180.Flag or Name2:gsub("%s+", "")
			local Callback = V180.Callback or function()
			end

			DuskShineCore.Flags[Flag] = V184

			local Frame13 = DuskShineCore.Utils.Make("Frame", {
				Size = UDim2.new(1, 0, 0, 60),
				Parent = ScrollingFrame
			}, {
				BackgroundColor3 = "Section"
			})

			DuskShineCore.Utils.Make("UICorner", {
				CornerRadius = UDim.new(0, 10),
				Parent = Frame13
			})
			DuskShineCore.Utils.Make("TextLabel", {
				Text = Name2,
				Size = UDim2.new(1, -100, 0, 20),
				Position = UDim2.new(0, 15, 0, 10),
				BackgroundTransparency = 1,
				FontFace = font,
				TextSize = 14,
				TextXAlignment = Enum.TextXAlignment.Left,
				Parent = Frame13
			}, {
				TextColor3 = "Text"
			})

			local Frame14 = DuskShineCore.Utils.Make("Frame", {
				Size = UDim2.new(0, 45, 0, 22),
				Position = UDim2.new(1, -60, 0, 9),
				Parent = Frame13
			}, {
				BackgroundColor3 = "Sidebar"
			})

			DuskShineCore.Utils.Make("UICorner", {
				CornerRadius = UDim.new(0, 6),
				Parent = Frame14
			})
			DuskShineCore.Utils.Make("UIStroke", {
				Parent = Frame14
			}, {
				Color = "Stroke"
			})

			local TextBox2 = DuskShineCore.Utils.Make("TextBox", {
				Text = tostring(V184),
				Size = UDim2.new(1, 0, 1, 0),
				BackgroundTransparency = 1,
				FontFace = font,
				TextSize = 13,
				ClearTextOnFocus = false,
				Parent = Frame14
			}, {
				TextColor3 = "Text"
			})
			local Frame15 = DuskShineCore.Utils.Make("Frame", {
				Size = UDim2.new(1, -30, 0, 6),
				Position = UDim2.new(0, 15, 0, 40),
				Parent = Frame13
			}, {
				BackgroundColor3 = "Sidebar"
			})

			DuskShineCore.Utils.Make("UICorner", {
				CornerRadius = UDim.new(1, 0),
				Parent = Frame15
			})

			local Frame16 = DuskShineCore.Utils.Make("Frame", {
				Size = UDim2.new(math.clamp((V184 - Min) / (Max - Min), 0, 1), 0, 1, 0),
				Parent = Frame15
			}, {
				BackgroundColor3 = "Accent"
			})

			DuskShineCore.Utils.Make("UICorner", {
				CornerRadius = UDim.new(1, 0),
				Parent = Frame16
			})

			local U192 = false

			local function V193(P52)
				local V194 = math.clamp(P52, Min, Max)

				DuskShineCore.Flags[Flag] = V194
				TextBox2.Text = tostring(V194)
				Frame16.Size = UDim2.new((V194 - Min) / (Max - Min), 0, 1, 0)
				pcall(Callback, V194)
			end
			local function V195(P53)
				local uDim2 = UDim2.new(math.clamp((P53.Position.X - Frame15.AbsolutePosition.X) / Frame15.AbsoluteSize.X, 0, 1), 0, 1, 0)

				Frame16.Size = uDim2

				local V197 = math.floor(Min + (Max - Min) * uDim2.X.Scale)

				if DuskShineCore.Flags[Flag] ~= V197 then
					DuskShineCore.Flags[Flag] = V197
					TextBox2.Text = tostring(V197)
					pcall(Callback, V197)
				end
			end

			DuskShineCore:Connect(DuskShineCore.Utils.Make("TextButton", {
				Size = UDim2.new(1, 0, 1, 20),
				Position = UDim2.new(0, 0, 0.5, 0),
				AnchorPoint = Vector2.new(0, 0.5),
				BackgroundTransparency = 1,
				Text = "",
				Parent = Frame15
			}).InputBegan, function(P54)
				if P54.UserInputType == Enum.UserInputType.MouseButton1 or P54.UserInputType == Enum.UserInputType.Touch then
					U192 = true
					V195(P54)
				end
			end)
			DuskShineCore:Connect(UserInputService.InputEnded, function(P55)
				if P55.UserInputType == Enum.UserInputType.MouseButton1 or P55.UserInputType == Enum.UserInputType.Touch then
					U192 = false
				end
			end)
			DuskShineCore:Connect(UserInputService.InputChanged, function(P56)
				if U192 then
					if P56.UserInputType == Enum.UserInputType.MouseMovement then
						V195(P56)
					elseif P56.UserInputType == Enum.UserInputType.Touch then
						V195(P56)

						return
					end
				end
			end)
			TextBox2.FocusLost:Connect(function()
				local V198 = tonumber(TextBox2.Text:match("%d+"))

				if V198 then
					V193(V198)
				else
					TextBox2.Text = tostring(DuskShineCore.Flags[Flag])
				end
			end)
			DuskShineCore.ConfigUpdaters[Flag] = V193

			return {
				SetValue = V193,
				GetValue = function()
					return DuskShineCore.Flags[Flag]
				end
			}
		end
		T4.CreateDropdown = function(P57, P58)
			local V199 = P58 or {}
			local Name2 = V199.Name or "Dropdown"
			local Options = V199.Options or {}
			local V202 = DuskShineCore.Utils.GetConfigValue(flag, V199.Default or Options[1] or "Select...")
			local Flag = V199.Flag or Name2:gsub("%s+", "")
			local Callback = V199.Callback or function()
			end

			DuskShineCore.Flags[Flag] = V202

			local Frame13 = DuskShineCore.Utils.Make("Frame", {
				Size = UDim2.new(1, 0, 0, 40),
				BackgroundTransparency = 1,
				Parent = ScrollingFrame
			})

			DuskShineCore.Utils.Make("TextLabel", {
				Text = Name2,
				Size = UDim2.new(0.5, 0, 1, 0),
				BackgroundTransparency = 1,
				Font = Enum.Font.GothamBold,
				TextSize = 13,
				TextXAlignment = Enum.TextXAlignment.Left,
				Parent = Frame13
			}, {
				TextColor3 = "Text"
			})

			local TextButton3 = DuskShineCore.Utils.Make("TextButton", {
				Text = tostring(V202),
				Size = UDim2.new(0.48, 0, 0, 30),
				Position = UDim2.new(0.52, 0, 0.5, -15),
				Font = Enum.Font.Gotham,
				TextSize = 12,
				Parent = Frame13
			}, {
				BackgroundColor3 = "Sidebar",
				TextColor3 = "Text"
			})

			DuskShineCore.Utils.Make("UICorner", {
				CornerRadius = UDim.new(0, 6),
				Parent = TextButton3
			})
			DuskShineCore.Utils.Make("UIStroke", {
				Parent = TextButton3
			}, {
				Color = "Stroke"
			})

			local ScrollingFrame2 = DuskShineCore.Utils.Make("ScrollingFrame", {
				Size = UDim2.new(0.48, 0, 0, 0),
				Position = UDim2.new(0.52, 0, 0.5, 18),
				ZIndex = 15,
				ScrollBarThickness = 2,
				Visible = false,
				Parent = Frame13
			}, {
				BackgroundColor3 = "Section"
			})

			DuskShineCore.Utils.Make("UICorner", {
				CornerRadius = UDim.new(0, 6),
				Parent = ScrollingFrame2
			})
			DuskShineCore.Utils.Make("UIStroke", {
				Parent = ScrollingFrame2
			}, {
				Color = "Stroke"
			})

			local U208 = false

			local function V209()
				U208 = false
				ScrollingFrame2.Visible = false
				ScrollingFrame2.Size = UDim2.new(0.48, 0, 0, 0)
			end
			local function V210(P59)
				Options = P59 or Options

				for _, Child in ipairs(ScrollingFrame2:GetChildren()) do
					if Child:IsA("TextButton") then
						Child:Destroy()
					end
				end

				local N1 = 0

				for _, Option in ipairs(Options) do
					DuskShineCore:Connect(DuskShineCore.Utils.Make("TextButton", {
						Text = tostring(Option),
						Size = UDim2.new(1, 0, 0, 25),
						Position = UDim2.new(0, 0, 0, N1),
						BackgroundTransparency = 1,
						Font = Enum.Font.Gotham,
						TextSize = 12,
						ZIndex = 16,
						Parent = ScrollingFrame2
					}, {
						TextColor3 = "SubText"
					}).MouseButton1Click, function()
						TextButton3.Text = tostring(Option)
						DuskShineCore.Flags[Flag] = Option
						V209()
						pcall(Callback, Option)
					end)
					N1 += 25
				end

				ScrollingFrame2.CanvasSize = UDim2.new(0, 0, 0, N1)

				if U208 then
					ScrollingFrame2.Size = UDim2.new(0.48, 0, 0, math.min(N1, 150))
				end
			end

			DuskShineCore:Connect(TextButton3.MouseButton1Click, function()
				U208 = not U208

				if U208 then
					V210()
					ScrollingFrame2.Visible = true
					ScrollingFrame2.Size = UDim2.new(0.48, 0, 0, math.min(ScrollingFrame2.CanvasSize.Y.Offset, 150))
				else
					V209()
				end
			end)
			V210()

			local function V216(P60)
				TextButton3.Text = tostring(P60)
				DuskShineCore.Flags[Flag] = P60
				pcall(Callback, P60)
			end

			DuskShineCore.ConfigUpdaters[Flag] = V216

			return {
				SetValue = V216,
				Refresh = V210,
				GetValue = function()
					return DuskShineCore.Flags[Flag]
				end
			}
		end
		T4.CreateKeybind = function(P61, P62)
			local V217 = P62 or {}
			local Name2 = V217.Name or "Keybind"
			local V219 = DuskShineCore.Utils.GetConfigValue(flag, V217.Default or Enum.KeyCode.Unknown)
			local Flag = V217.Flag or Name2:gsub("%s+", "")
			local Callback = V217.Callback or function()
			end

			DuskShineCore.Flags[Flag] = V219

			local Frame13 = DuskShineCore.Utils.Make("Frame", {
				Size = UDim2.new(1, 0, 0, 60),
				Parent = ScrollingFrame
			}, {
				BackgroundColor3 = "Section"
			})

			DuskShineCore.Utils.Make("UICorner", {
				CornerRadius = UDim.new(0, 10),
				Parent = Frame13
			})
			DuskShineCore.Utils.Make("TextLabel", {
				Text = Name2,
				Size = UDim2.new(1, -100, 0, 20),
				Position = UDim2.new(0, 15, 0.5, -10),
				BackgroundTransparency = 1,
				FontFace = font,
				TextSize = 14,
				TextXAlignment = Enum.TextXAlignment.Left,
				Parent = Frame13
			}, {
				TextColor3 = "Text"
			})

			local TextButton3 = DuskShineCore.Utils.Make("TextButton", {
				Size = UDim2.new(0, 80, 0, 34),
				AnchorPoint = Vector2.new(1, 0.5),
				Position = UDim2.new(1, -15, 0.5, 0),
				FontFace = font,
				TextSize = 13,
				AutoButtonColor = false,
				Text = V219.Name or "None",
				Parent = Frame13
			}, {
				BackgroundColor3 = "Sidebar",
				TextColor3 = "SubText"
			})

			DuskShineCore.Utils.Make("UICorner", {
				CornerRadius = UDim.new(0, 8),
				Parent = TextButton3
			})
			DuskShineCore.Utils.Make("UIStroke", {
				Thickness = 1,
				Parent = TextButton3
			}, {
				Color = "Stroke"
			})

			local U224 = false
			local Connection

			DuskShineCore:Connect(TextButton3.MouseButton1Click, function()
				if U224 then
					return
				end

				U224 = true
				TextButton3.Text = "..."
				DuskShineCore.Utils.TBT(TextButton3, 0.2, {
					TextColor3 = DuskShineCore.CurrentTheme.Accent
				})
				Connection = UserInputService.InputBegan:Connect(function(Input)
					local V226 = Input.UserInputType == Enum.UserInputType.Keyboard

					if V226 or Input.UserInputType == Enum.UserInputType.MouseButton1 or Input.UserInputType == Enum.UserInputType.MouseButton2 or Input.UserInputType == Enum.UserInputType.MouseButton3 then
						local KeyCode = V226 and Input.KeyCode or Input.UserInputType

						if KeyCode == Enum.KeyCode.Escape then
							KeyCode = Enum.KeyCode.Unknown
						end

						DuskShineCore.Flags[Flag] = KeyCode
						TextButton3.Text = KeyCode.Name
						U224 = false
						DuskShineCore.Utils.TBT(TextButton3, 0.2, {
							TextColor3 = DuskShineCore.CurrentTheme.SubText
						})
						pcall(Callback, KeyCode)

						if Connection then
							Connection:Disconnect()
						end
					end
				end)
			end)

			local function V228(P63)
				DuskShineCore.Flags[Flag] = P63

				local Name3 = P63 and P63.Name

				TextButton3.Text = Name3 or "None"
				pcall(Callback, P63)
			end

			DuskShineCore.ConfigUpdaters[Flag] = V228

			return {
				SetValue = V228,
				GetValue = function()
					return DuskShineCore.Flags[Flag]
				end
			}
		end
		T4.CreateUIXPanel = function(P64, P65)
			local V230 = P65 or {}
			local Min = V230.Min or 25
			local Max = V230.Max or 175
			local V233 = DuskShineCore.Utils.GetConfigValue(scaleFlag, V230.DefaultScale or 50)
			local ScaleFlag = V230.ScaleFlag or "UIScaleSize"
			local ScaleCallback = V230.ScaleCallback or function()
			end
			local V236 = DuskShineCore.Utils.GetConfigValue(colorFlag, V230.DefaultColor or Color3.new(1, 1, 1))
			local ColorFlag = V230.ColorFlag or "ThemeAccent"
			local ColorCallback = V230.ColorCallback or function()
			end

			DuskShineCore.Flags[ScaleFlag] = V233
			DuskShineCore.Flags[ColorFlag] = V236

			local TransparentUI = getgenv().TransparentUI or false
			local Make = DuskShineCore.Utils.Make
			local S3 = "Frame"
			local T8 = {
				Size = UDim2.new(1, 0, 0, 95)
			}

			T8.BackgroundTransparency = TransparentUI and 0.3 or 0
			T8.Parent = ScrollingFrame

			local V243 = Make(S3, T8, {
				BackgroundColor3 = "Section"
			})

			DuskShineCore.Utils.Make("UICorner", {
				CornerRadius = UDim.new(0, 10),
				Parent = V243
			})

			if TransparentUI then
				local UIStroke = DuskShineCore.Utils.Make("UIStroke", {
					Thickness = 1,
					Parent = V243
				}, {
					Color = "Stroke"
				})

				local function V245()
					DuskShineCore.Utils.TBT(UIStroke, 0.25, {
						Color = DuskShineCore.CurrentTheme.Accent
					})
				end

				DuskShineCore:Connect(V243.MouseEnter, V245)
				DuskShineCore:Connect(V243.MouseLeave, function()
					DuskShineCore.Utils.TBT(UIStroke, 0.25, {
						Color = DuskShineCore.CurrentTheme.Stroke
					})
				end)
			end

			DuskShineCore.Utils.Make("TextLabel", {
				Text = "SCALE",
				Size = UDim2.new(0, 50, 0, 20),
				Position = UDim2.new(0, 15, 0, 15),
				BackgroundTransparency = 1,
				Font = Enum.Font.GothamBlack,
				TextSize = 11,
				TextXAlignment = Enum.TextXAlignment.Left,
				Parent = V243
			}, {
				TextColor3 = "SubText"
			})

			local Frame13 = DuskShineCore.Utils.Make("Frame", {
				Size = UDim2.new(0, 45, 0, 22),
				Position = UDim2.new(1, -60, 0, 14),
				Parent = V243
			}, {
				BackgroundColor3 = "Sidebar"
			})

			DuskShineCore.Utils.Make("UICorner", {
				CornerRadius = UDim.new(0, 6),
				Parent = Frame13
			})
			DuskShineCore.Utils.Make("UIStroke", {
				Parent = Frame13
			}, {
				Color = "Stroke"
			})

			local TextBox2 = DuskShineCore.Utils.Make("TextBox", {
				Text = tostring(V233),
				Size = UDim2.new(1, 0, 1, 0),
				BackgroundTransparency = 1,
				Font = Enum.Font.GothamBold,
				TextSize = 12,
				ClearTextOnFocus = false,
				Parent = Frame13
			}, {
				TextColor3 = "Text"
			})
			local Frame14 = DuskShineCore.Utils.Make("Frame", {
				Size = UDim2.new(1, -150, 0, 6),
				Position = UDim2.new(0, 75, 0, 22),
				Parent = V243
			}, {
				BackgroundColor3 = "Sidebar"
			})

			DuskShineCore.Utils.Make("UICorner", {
				CornerRadius = UDim.new(1, 0),
				Parent = Frame14
			})

			local V249 = math.clamp((V233 - Min) / (Max - Min), 0, 1)
			local Frame15 = DuskShineCore.Utils.Make("Frame", {
				Size = UDim2.new(V249, 0, 1, 0),
				Parent = Frame14
			}, {
				BackgroundColor3 = "Accent"
			})

			DuskShineCore.Utils.Make("UICorner", {
				CornerRadius = UDim.new(1, 0),
				Parent = Frame15
			})

			local Frame16 = DuskShineCore.Utils.Make("Frame", {
				Size = UDim2.new(0, 14, 0, 14),
				Position = UDim2.new(V249, 0, 0.5, 0),
				AnchorPoint = Vector2.new(0.5, 0.5),
				Parent = Frame14
			}, {
				BackgroundColor3 = "Text"
			})

			DuskShineCore.Utils.Make("UICorner", {
				CornerRadius = UDim.new(1, 0),
				Parent = Frame16
			})

			local TextButton3 = DuskShineCore.Utils.Make("TextButton", {
				Size = UDim2.new(1, 0, 1, 24),
				Position = UDim2.new(0, 0, 0.5, 0),
				AnchorPoint = Vector2.new(0, 0.5),
				BackgroundTransparency = 1,
				Text = "",
				Parent = Frame14
			})

			DuskShineCore.Utils.Make("TextLabel", {
				Text = "COLOR",
				Size = UDim2.new(0, 50, 0, 20),
				Position = UDim2.new(0, 15, 0, 57),
				BackgroundTransparency = 1,
				Font = Enum.Font.GothamBlack,
				TextSize = 11,
				TextXAlignment = Enum.TextXAlignment.Left,
				Parent = V243
			}, {
				TextColor3 = "SubText"
			})

			local Frame17 = DuskShineCore.Utils.Make("Frame", {
				Size = UDim2.new(0, 45, 0, 20),
				Position = UDim2.new(1, -60, 0, 57),
				BackgroundColor3 = V236,
				Parent = V243
			})

			DuskShineCore.Utils.Make("UICorner", {
				CornerRadius = UDim.new(0, 6),
				Parent = Frame17
			})
			DuskShineCore.Utils.Make("UIStroke", {
				Color = Color3.new(0, 0, 0),
				Thickness = 1,
				Parent = Frame17
			})

			local ImageButton2 = DuskShineCore.Utils.Make("ImageButton", {
				Size = UDim2.new(1, -150, 0, 12),
				Position = UDim2.new(0, 75, 0, 61),
				BackgroundColor3 = Color3.new(1, 1, 1),
				AutoButtonColor = false,
				Parent = V243
			})

			DuskShineCore.Utils.Make("UICorner", {
				CornerRadius = UDim.new(0, 4),
				Parent = ImageButton2
			})

			local UIGradient = Instance.new("UIGradient")

			UIGradient.Color = ColorSequence.new({
				ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 0, 0)),
				ColorSequenceKeypoint.new(0.17, Color3.fromRGB(255, 255, 0)),
				ColorSequenceKeypoint.new(0.33, Color3.fromRGB(0, 255, 0)),
				ColorSequenceKeypoint.new(0.5, Color3.fromRGB(0, 255, 255)),
				ColorSequenceKeypoint.new(0.67, Color3.fromRGB(0, 0, 255)),
				ColorSequenceKeypoint.new(0.83, Color3.fromRGB(255, 0, 255)),
				ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 0, 0))
			})
			UIGradient.Parent = ImageButton2

			local V256 = V236:ToHSV()
			local Frame18 = DuskShineCore.Utils.Make("Frame", {
				Size = UDim2.new(0, 4, 1, 6),
				Position = UDim2.new(V256, 0, 0.5, 0),
				AnchorPoint = Vector2.new(0.5, 0.5),
				BackgroundColor3 = Color3.new(1, 1, 1),
				BorderColor3 = Color3.new(0, 0, 0),
				BorderSizePixel = 1,
				Parent = ImageButton2
			})
			local U260 = false

			local function V261(P66)
				local V262 = math.clamp(P66, Min, Max)

				TextBox2.Text = tostring(V262)

				local V263 = (V262 - Min) / (Max - Min)

				DuskShineCore.Utils.TBT(Frame15, 0.1, {
					Size = UDim2.new(V263, 0, 1, 0)
				})
				DuskShineCore.Utils.TBT(Frame16, 0.1, {
					Position = UDim2.new(V263, 0, 0.5, 0)
				})

				if DuskShineCore.Flags[ScaleFlag] ~= V262 then
					DuskShineCore.Flags[ScaleFlag] = V262

					if DuskShineCore.UpdateScale then
						DuskShineCore:UpdateScale(V262)
					end

					pcall(ScaleCallback, V262)
				end
			end
			local function V264(P67)
				if Frame14 and Frame14.AbsoluteSize.X > 0 then
					local V265 = math.floor(Min + (Max - Min) * math.clamp((P67.Position.X - Frame14.AbsolutePosition.X) / Frame14.AbsoluteSize.X, 0, 1))

					V261(V265)
				end
			end

			DuskShineCore:Connect(TextButton3.InputBegan, function(P68)
				if P68.UserInputType == Enum.UserInputType.MouseButton1 or P68.UserInputType == Enum.UserInputType.Touch then
					U260 = true
					V264(P68)
				end
			end)
			DuskShineCore:Connect(UserInputService.InputEnded, function(P69)
				if P69.UserInputType == Enum.UserInputType.MouseButton1 or P69.UserInputType == Enum.UserInputType.Touch then
					U260 = false
				end
			end)
			DuskShineCore:Connect(UserInputService.InputChanged, function(P70)
				if U260 then
					if P70.UserInputType == Enum.UserInputType.MouseMovement then
						V264(P70)
					else
						if P70.UserInputType == Enum.UserInputType.Touch then
							V264(P70)

							return
						end

						return
					end
				end
			end)
			TextBox2.FocusLost:Connect(function()
				local V266 = tonumber(TextBox2.Text:match("%d+"))

				if V266 then
					V261(V266)
				else
					TextBox2.Text = tostring(DuskShineCore.Flags[ScaleFlag])
				end
			end)

			local U267 = false

			local function V268(P71)
				if ImageButton2 and ImageButton2.AbsoluteSize.X > 0 then
					local V269 = math.clamp((P71.Position.X - ImageButton2.AbsolutePosition.X) / ImageButton2.AbsoluteSize.X, 0, 1)

					Frame18.Position = UDim2.new(V269, 0, 0.5, 0)

					local color3 = Color3.fromHSV(V269, 1, 1)

					Frame17.BackgroundColor3 = color3

					if DuskShineCore.Flags[ColorFlag] ~= color3 then
						DuskShineCore.Flags[ColorFlag] = color3
						pcall(ColorCallback, color3)
					end
				end
			end

			DuskShineCore:Connect(ImageButton2.InputBegan, function(P72)
				if P72.UserInputType == Enum.UserInputType.MouseButton1 or P72.UserInputType == Enum.UserInputType.Touch then
					U267 = true
					V268(P72)
				end
			end)
			DuskShineCore:Connect(UserInputService.InputEnded, function(P73)
				if P73.UserInputType == Enum.UserInputType.MouseButton1 or P73.UserInputType == Enum.UserInputType.Touch then
					U267 = false
				end
			end)
			DuskShineCore:Connect(UserInputService.InputChanged, function(P74)
				if U267 then
					if P74.UserInputType == Enum.UserInputType.MouseMovement or P74.UserInputType == Enum.UserInputType.Touch then
						V268(P74)
					end
				end
			end)
			DuskShineCore.ConfigUpdaters[ScaleFlag] = V261
			DuskShineCore.ConfigUpdaters[ColorFlag] = function(P75)
				if typeof(P75) == "Color3" then
					DuskShineCore.Flags[ColorFlag] = P75
					Frame17.BackgroundColor3 = P75
					Frame18.Position = UDim2.new(P75:ToHSV(), 0, 0.5, 0)
					pcall(ColorCallback, P75)
				end
			end
			task.spawn(function()
				if DuskShineCore.Flags[ScaleFlag] then
					V261(DuskShineCore.Flags[ScaleFlag])
					pcall(ScaleCallback, DuskShineCore.Flags[ScaleFlag])
				end

				if DuskShineCore.Flags[ColorFlag] then
					if typeof(DuskShineCore.Flags[ColorFlag]) == "Color3" then
						local V271 = DuskShineCore.Flags[ColorFlag]

						Frame17.BackgroundColor3 = V271
						Frame18.Position = UDim2.new(V271:ToHSV(), 0, 0.5, 0)
						pcall(ColorCallback, V271)
					end
				end
			end)

			return {
				Container = V243,
				SetMax = function(P76)
					Max = P76
					V261(DuskShineCore.Flags[ScaleFlag])
				end
			}
		end
		T4.CreateInput = function(P77, P78)
			local V272 = P78 or {}
			local Name2 = V272.Name or "Input"
			local Placeholder = V272.Placeholder or "Type here..."
			local V275 = DuskShineCore.Utils.GetConfigValue(flag, V272.Default or "")
			local Flag = V272.Flag or Name2:gsub("%s+", "")
			local ClearTextOnFocus = V272.ClearTextOnFocus or false
			local Callback = V272.Callback
			local Frame13, Make, S4, T9

			if Callback then
				DuskShineCore.Flags[Flag] = V275

				local Frame14 = DuskShineCore.Utils.Make("Frame", {
					Size = UDim2.new(1, 0, 0, 60),
					Parent = ScrollingFrame
				}, {
					BackgroundColor3 = "Section"
				})

				DuskShineCore.Utils.Make("UICorner", {
					CornerRadius = UDim.new(0, 10),
					Parent = Frame14
				})
				DuskShineCore.Utils.Make("TextLabel", {
					Text = Name2,
					Size = UDim2.new(0.4, 0, 1, 0),
					Position = UDim2.new(0, 15, 0, 0),
					BackgroundTransparency = 1,
					FontFace = font,
					TextSize = 14,
					TextXAlignment = Enum.TextXAlignment.Left,
					Parent = Frame14
				}, {
					TextColor3 = "Text"
				})
				Frame13 = DuskShineCore.Utils.Make("Frame", {
					Size = UDim2.new(0.5, 0, 0, 34),
					AnchorPoint = Vector2.new(1, 0.5),
					Position = UDim2.new(1, -15, 0.5, 0),
					Parent = Frame14
				}, {
					BackgroundColor3 = "Sidebar"
				})
				DuskShineCore.Utils.Make("UICorner", {
					CornerRadius = UDim.new(0, 8),
					Parent = Frame13
				})
				Make = DuskShineCore.Utils.Make
				S4 = "TextBox"
				T9 = {
					Size = UDim2.new(1, -20, 1, 0),
					Position = UDim2.new(0, 10, 0, 0),
					BackgroundTransparency = 1,
					PlaceholderText = Placeholder
				}
			else
				Callback = function()
				end
				DuskShineCore.Flags[Flag] = V275

				local Frame14 = DuskShineCore.Utils.Make("Frame", {
					Size = UDim2.new(1, 0, 0, 60),
					Parent = ScrollingFrame
				}, {
					BackgroundColor3 = "Section"
				})

				DuskShineCore.Utils.Make("UICorner", {
					CornerRadius = UDim.new(0, 10),
					Parent = Frame14
				})
				DuskShineCore.Utils.Make("TextLabel", {
					Text = Name2,
					Size = UDim2.new(0.4, 0, 1, 0),
					Position = UDim2.new(0, 15, 0, 0),
					BackgroundTransparency = 1,
					FontFace = font,
					TextSize = 14,
					TextXAlignment = Enum.TextXAlignment.Left,
					Parent = Frame14
				}, {
					TextColor3 = "Text"
				})
				Frame13 = DuskShineCore.Utils.Make("Frame", {
					Size = UDim2.new(0.5, 0, 0, 34),
					AnchorPoint = Vector2.new(1, 0.5),
					Position = UDim2.new(1, -15, 0.5, 0),
					Parent = Frame14
				}, {
					BackgroundColor3 = "Sidebar"
				})
				DuskShineCore.Utils.Make("UICorner", {
					CornerRadius = UDim.new(0, 8),
					Parent = Frame13
				})
				Make = DuskShineCore.Utils.Make
				S4 = "TextBox"
				T9 = {
					Size = UDim2.new(1, -20, 1, 0),
					Position = UDim2.new(0, 10, 0, 0),
					BackgroundTransparency = 1,
					PlaceholderText = Placeholder
				}
			end

			T9.Text = V275
			T9.FontFace = font
			T9.TextSize = 13
			T9.ClearTextOnFocus = ClearTextOnFocus
			T9.Parent = Frame13

			local V285 = Make(S4, T9, {
				TextColor3 = "Text",
				PlaceholderColor3 = "SubText"
			})

			DuskShineCore:Connect(V285.FocusLost, function()
				DuskShineCore.Flags[Flag] = V285.Text
				pcall(Callback, V285.Text)
			end)

			local function V286(P79)
				V285.Text = tostring(P79)
				DuskShineCore.Flags[Flag] = V285.Text
				pcall(Callback, V285.Text)
			end

			DuskShineCore.ConfigUpdaters[Flag] = V286

			return {
				SetValue = V286,
				GetValue = function()
					return DuskShineCore.Flags[Flag]
				end
			}
		end
		T4.CreateSection = function(P80, P81)
			local V287 = P81 or {}
			local Name2 = V287.Name

			Name2 = Name2 or "Section"

			local TextLabel3 = DuskShineCore.Utils.Make("TextLabel", {
				Text = Name2,
				Size = UDim2.new(1, 0, 0, 35),
				BackgroundTransparency = 1,
				FontFace = font,
				TextSize = 13,
				TextXAlignment = Enum.TextXAlignment.Left,
				Parent = ScrollingFrame
			}, {
				TextColor3 = "SubText"
			})

			DuskShineCore.Utils.Make("UIPadding", {
				PaddingTop = UDim.new(0, 15),
				Parent = TextLabel3
			})

			return {
				SetText = function(P82)
					TextLabel3.Text = P82
				end
			}
		end
		T4.CreateDivider = function(P83, P84)
			local V290 = P84 or {}
			local Text = V290.Text or ""
			local Parent = V290.Parent or ScrollingFrame
			local LayoutOrder = V290.LayoutOrder or 0
			local Frame13 = DuskShineCore.Utils.Make("Frame", {
				Size = UDim2.new(1, 0, 0, 30),
				BackgroundTransparency = 1,
				LayoutOrder = LayoutOrder,
				Parent = Parent
			})

			DuskShineCore.Utils.Make("UIListLayout", {
				FillDirection = Enum.FillDirection.Horizontal,
				VerticalAlignment = Enum.VerticalAlignment.Center,
				HorizontalAlignment = Enum.HorizontalAlignment.Center,
				Padding = UDim.new(0, 12),
				SortOrder = Enum.SortOrder.LayoutOrder,
				Parent = Frame13
			})

			local Frame14 = DuskShineCore.Utils.Make("Frame", {
				LayoutOrder = 1,
				Size = UDim2.new(0.35, 0, 0, 1),
				BorderSizePixel = 0,
				Parent = Frame13
			}, {
				BackgroundColor3 = "Stroke"
			})

			Instance.new("UIGradient", Frame14).Transparency = NumberSequence.new({
				NumberSequenceKeypoint.new(0, 1),
				NumberSequenceKeypoint.new(1, 0)
			})

			local TextLabel3 = DuskShineCore.Utils.Make("TextLabel", {
				LayoutOrder = 2,
				Text = Text,
				AutomaticSize = Enum.AutomaticSize.X,
				Size = UDim2.new(0, 0, 1, 0),
				BackgroundTransparency = 1,
				Font = Enum.Font.GothamMedium,
				TextSize = 12,
				Parent = Frame13
			}, {
				TextColor3 = "SubText"
			})
			local Frame15 = DuskShineCore.Utils.Make("Frame", {
				LayoutOrder = 3,
				Size = UDim2.new(0.35, 0, 0, 1),
				BorderSizePixel = 0,
				Parent = Frame13
			}, {
				BackgroundColor3 = "Stroke"
			})

			Instance.new("UIGradient", Frame15).Transparency = NumberSequence.new({
				NumberSequenceKeypoint.new(0, 0),
				NumberSequenceKeypoint.new(1, 1)
			})

			return {
				SetText = function(P85)
					TextLabel3.Text = P85
				end
			}
		end
		T4.CreateLabel = function(P86, P87)
			local V298 = P87 or {}
			local Text = V298.Text or "Label"
			local Icon2 = V298.Icon
			local Frame13 = DuskShineCore.Utils.Make("Frame", {
				Size = UDim2.new(1, 0, 0, 0),
				AutomaticSize = Enum.AutomaticSize.Y,
				BackgroundTransparency = 1,
				Parent = ScrollingFrame
			})

			DuskShineCore.Utils.Make("UIListLayout", {
				FillDirection = Enum.FillDirection.Horizontal,
				VerticalAlignment = Enum.VerticalAlignment.Center,
				Padding = UDim.new(0, 12),
				SortOrder = Enum.SortOrder.LayoutOrder,
				Parent = Frame13
			})
			DuskShineCore.Utils.Make("UIPadding", {
				PaddingTop = UDim.new(0, 6),
				PaddingBottom = UDim.new(0, 6),
				Parent = Frame13
			})

			if Icon2 then
				if Icon2 ~= "" then
					local ImageLabel3 = DuskShineCore.Utils.Make("ImageLabel", {
						LayoutOrder = 1,
						Size = UDim2.new(0, 26, 0, 26),
						BackgroundTransparency = 1,
						Parent = Frame13
					})

					if Icon2 == "avatar" then
						ImageLabel3.Image = "rbxthumb://type=AvatarHeadShot&id=" .. LocalPlayer.UserId .. "&w=150&h=150"
						DuskShineCore.Utils.Make("UICorner", {
							CornerRadius = UDim.new(1, 0),
							Parent = ImageLabel3
						})
						DuskShineCore.Utils.Make("UIStroke", {
							Parent = ImageLabel3
						}, {
							Color = "Stroke"
						})

						local TextLabel3 = DuskShineCore.Utils.Make("TextLabel", {
							Size = UDim2.new(1, 0, 1, 0),
							BackgroundTransparency = 1,
							Text = "A",
							Font = Enum.Font.GothamBold,
							TextSize = 14,
							Visible = getgenv().AnonymousMode or false,
							Parent = ImageLabel3
						}, {
							TextColor3 = "Accent"
						})

						if getgenv().AnonymousMode then
							ImageLabel3.ImageTransparency = 1
							ImageLabel3.BackgroundColor3 = Color3.new(0, 0, 0)
							ImageLabel3.BackgroundTransparency = 0
						end

						table.insert(DuskShineCore.AnonItems.Avatars, {
							ImageObj = ImageLabel3,
							Letter = TextLabel3
						})
					else
						ImageLabel3.Image = Icon2
						DuskShineCore.ThemeObjects[ImageLabel3] = {
							ImageColor3 = "Accent"
						}
						ImageLabel3.ImageColor3 = DuskShineCore.CurrentTheme.Accent
					end
				end
			end

			local Make = DuskShineCore.Utils.Make
			local S5 = "TextLabel"
			local T10 = {
				LayoutOrder = 2,
				Size = UDim2.new(1, Icon2 and Icon2 ~= "" and -38 or 0, 0, 0),
				AutomaticSize = Enum.AutomaticSize.Y,
				BackgroundTransparency = 1,
				FontFace = font,
				TextSize = 14
			}

			T10.TextXAlignment = Enum.TextXAlignment.Left
			T10.TextYAlignment = Enum.TextYAlignment.Center
			T10.TextWrapped = true
			T10.RichText = true
			T10.Parent = Frame13

			local V307 = Make(S5, T10, {
				TextColor3 = "Text"
			})

			if Icon2 == "avatar" then
				local V308 = Text:gsub(LocalPlayer.DisplayName, "%%s")

				table.insert(DuskShineCore.AnonItems.Names, {
					Obj = V307,
					Format = V308
				})
				V307.Text = string.format(V308, getgenv().AnonymousMode and "Hidden User" or LocalPlayer.DisplayName)
			else
				V307.Text = Text
			end

			return {
				SetText = function(P88)
					V307.Text = P88
				end
			}
		end
		T4.CreateNotice = function(P89, P90)
			local V309 = P90
			local Text = (V309 or {}).Text or "Notice"
			local Frame13 = DuskShineCore.Utils.Make("Frame", {
				Size = UDim2.new(1, 0, 0, 0),
				AutomaticSize = Enum.AutomaticSize.Y,
				BackgroundTransparency = 0.5,
				Parent = ScrollingFrame
			}, {
				BackgroundColor3 = "Section"
			})

			DuskShineCore.Utils.Make("UICorner", {
				CornerRadius = UDim.new(0, 6),
				Parent = Frame13
			})
			DuskShineCore.Utils.Make("UIStroke", {
				Thickness = 1.5,
				Transparency = 0.1,
				Parent = Frame13
			}, {
				Color = "Red"
			})
			DuskShineCore.Utils.Make("UIPadding", {
				PaddingTop = UDim.new(0, 10),
				PaddingBottom = UDim.new(0, 10),
				PaddingLeft = UDim.new(0, 12),
				PaddingRight = UDim.new(0, 12),
				Parent = Frame13
			})

			local Frame14 = DuskShineCore.Utils.Make("Frame", {
				Size = UDim2.new(0, 3, 1, 0),
				Position = UDim2.new(0, -12, 0, 0),
				BorderSizePixel = 0,
				Parent = Frame13
			}, {
				BackgroundColor3 = "Red"
			})

			DuskShineCore.Utils.Make("UICorner", {
				CornerRadius = UDim.new(0, 6),
				Parent = Frame14
			})
			DuskShineCore.Utils.Make("ImageLabel", {
				Size = UDim2.new(0, 16, 0, 16),
				Position = UDim2.new(0, 4, 0, 1),
				BackgroundTransparency = 1,
				Image = "rbxassetid://11877677509",
				Parent = Frame13
			}, {
				ImageColor3 = "Red"
			})

			local TextLabel3 = DuskShineCore.Utils.Make("TextLabel", {
				Text = Text,
				Size = UDim2.new(1, -26, 0, 0),
				Position = UDim2.new(0, 26, 0, 0),
				AutomaticSize = Enum.AutomaticSize.Y,
				BackgroundTransparency = 1,
				FontFace = font,
				TextSize = 12,
				TextWrapped = true,
				TextXAlignment = Enum.TextXAlignment.Left,
				TextYAlignment = Enum.TextYAlignment.Top,
				RichText = true,
				Parent = Frame13
			}, {
				TextColor3 = "Text"
			})

			return {
				SetText = function(P91)
					TextLabel3.Text = P91
				end
			}
		end
		T4.CreateShopGrid = function(P92, P93)
			local V314 = P93 or {}
			local Items = V314.Items or {}
			local Callback = V314.Callback or function()
			end
			local Frame13 = DuskShineCore.Utils.Make("Frame", {
				Size = UDim2.new(1, 0, 0, 0),
				AutomaticSize = Enum.AutomaticSize.Y,
				BackgroundTransparency = 1,
				Parent = ScrollingFrame
			})

			DuskShineCore.Utils.Make("UIGridLayout", {
				CellSize = UDim2.new(0.48, 0, 0, 130),
				CellPadding = UDim2.new(0.04, 0, 0, 18),
				SortOrder = Enum.SortOrder.LayoutOrder,
				Parent = Frame13
			})

			for _, Item in ipairs(Items) do
				local TextButton3 = DuskShineCore.Utils.Make("TextButton", {
					Text = "",
					AutoButtonColor = false,
					ClipsDescendants = false,
					Parent = Frame13
				}, {
					BackgroundColor3 = "Section"
				})

				DuskShineCore.Utils.Make("UICorner", {
					CornerRadius = UDim.new(0, 14),
					Parent = TextButton3
				})

				local Frame14 = DuskShineCore.Utils.Make("Frame", {
					Size = UDim2.new(1, 0, 1, 0),
					BackgroundTransparency = 1,
					ClipsDescendants = true,
					ZIndex = 10,
					Parent = TextButton3
				})

				DuskShineCore.Utils.Make("UICorner", {
					CornerRadius = UDim.new(0, 14),
					Parent = Frame14
				})

				local Frame15 = DuskShineCore.Utils.Make("Frame", {
					Size = UDim2.new(0.6, 0, 0, 3),
					Position = UDim2.new(0.5, 0, 0, -8),
					AnchorPoint = Vector2.new(0.5, 1),
					BorderSizePixel = 0,
					ZIndex = 5,
					Parent = TextButton3
				}, {
					BackgroundColor3 = "Accent"
				})

				DuskShineCore.Utils.Make("UICorner", {
					CornerRadius = UDim.new(1, 0),
					Parent = Frame15
				})

				local ImageLabel3 = DuskShineCore.Utils.Make("ImageLabel", {
					Size = UDim2.new(0, 70, 0, 70),
					Position = UDim2.new(0.5, 0, 0, 15),
					AnchorPoint = Vector2.new(0.5, 0),
					BackgroundTransparency = 1,
					ZIndex = 1,
					ScaleType = Enum.ScaleType.Fit,
					Image = Item.Image or "rbxassetid://0",
					ImageColor3 = Color3.fromRGB(220, 220, 220),
					Parent = TextButton3
				})
				local Frame16 = DuskShineCore.Utils.Make("Frame", {
					Size = UDim2.new(1, 0, 0.7, 0),
					Position = UDim2.new(0, 0, 1, 0),
					AnchorPoint = Vector2.new(0, 1),
					BackgroundTransparency = 1,
					ZIndex = 2,
					Parent = TextButton3
				})
				local UIGradient = Instance.new("UIGradient")

				UIGradient.Rotation = 90
				UIGradient.Transparency = NumberSequence.new({
					NumberSequenceKeypoint.new(0, 1),
					NumberSequenceKeypoint.new(1, 0.1)
				})
				UIGradient.Color = ColorSequence.new(Color3.new(0, 0, 0))
				UIGradient.Parent = Frame16
				DuskShineCore.Utils.Make("UIStroke", {
					Thickness = 1.5,
					Transparency = 0.4,
					Parent = DuskShineCore.Utils.Make("TextLabel", {
						Text = Item.Name:upper(),
						Size = UDim2.new(1, -10, 0, 20),
						Position = UDim2.new(0.5, 0, 1, -5),
						AnchorPoint = Vector2.new(0.5, 1),
						BackgroundTransparency = 1,
						TextColor3 = Color3.new(1, 1, 1),
						Font = Enum.Font.GothamBold,
						TextSize = 13,
						TextTruncate = Enum.TextTruncate.AtEnd,
						ZIndex = 3,
						Parent = TextButton3
					})
				})

				local TextLabel3 = DuskShineCore.Utils.Make("TextLabel", {
					Text = Item.Price,
					Size = UDim2.new(1, -10, 0, 15),
					Position = UDim2.new(0.5, 0, 1, -22),
					AnchorPoint = Vector2.new(0.5, 1),
					BackgroundTransparency = 1,
					Font = Enum.Font.GothamBlack,
					TextSize = 12,
					ZIndex = 3,
					Parent = TextButton3
				})

				if Item.Price == "FREE" then
					TextLabel3.TextColor3 = Color3.fromRGB(46, 204, 113)
				else
					DuskShineCore.ThemeObjects[TextLabel3] = {
						TextColor3 = "Accent"
					}
					TextLabel3.TextColor3 = DuskShineCore.CurrentTheme.Accent
				end

				DuskShineCore.Utils.Make("UIStroke", {
					Thickness = 1,
					Transparency = 0.5,
					Parent = TextLabel3
				})

				if Item.VipOnly then
					DuskShineCore.Utils.Make("UIStroke", {
						Thickness = 1,
						Transparency = 0.5,
						Parent = DuskShineCore.Utils.Make("TextLabel", {
							Text = "(Only for VIP)",
							Size = UDim2.new(1, -10, 0, 12),
							Position = UDim2.new(0.5, 0, 1, -38),
							AnchorPoint = Vector2.new(0.5, 1),
							BackgroundTransparency = 1,
							TextColor3 = Color3.fromRGB(255, 215, 0),
							Font = Enum.Font.GothamBold,
							TextSize = 10,
							ZIndex = 3,
							Parent = TextButton3
						})
					})
				end

				local UIScale2 = Instance.new("UIScale", TextButton3)

				DuskShineCore:Connect(TextButton3.MouseEnter, function()
					DuskShineCore.Utils.TBT(ImageLabel3, 0.4, {
						ImageColor3 = Color3.new(1, 1, 1),
						Size = UDim2.new(0, 80, 0, 80)
					}, Enum.EasingStyle.Quint)
					DuskShineCore.Utils.TBT(Frame15, 0.3, {
						Size = UDim2.new(0.8, 0, 0, 4)
					})
				end)
				DuskShineCore:Connect(TextButton3.MouseLeave, function()
					DuskShineCore.Utils.TBT(ImageLabel3, 0.4, {
						ImageColor3 = Color3.fromRGB(220, 220, 220),
						Size = UDim2.new(0, 70, 0, 70)
					}, Enum.EasingStyle.Quint)
					DuskShineCore.Utils.TBT(Frame15, 0.3, {
						Size = UDim2.new(0.6, 0, 0, 3)
					})
				end)
				DuskShineCore:Connect(TextButton3.MouseButton1Down, function()
					DuskShineCore.Utils.TBT(UIScale2, 0.1, {
						Scale = 0.95
					})
				end)
				DuskShineCore:Connect(TextButton3.MouseButton1Click, function()
					DuskShineCore.Utils.TBT(UIScale2, 0.15, {
						Scale = 1
					}, Enum.EasingStyle.Bounce)
					DuskShineCore.Utils.CreateRipple(Frame14)
					pcall(Callback, Item.Value or Item.Name)
				end)
			end
		end
		T4.CreateModeToggle = function(P94, P95)
			local V328 = P95 or {}
			local Name2 = V328.Name or "Mode Toggle"
			local Description = V328.Description or ""
			local V331 = DuskShineCore.Utils.GetConfigValue(flag .. "_State", V328.DefaultState or false)
			local Modes = V328.Modes or {}
			local V333 = DuskShineCore.Utils.GetConfigValue(flag .. "_Mode", V328.DefaultMode or Modes[1] and Modes[1].Name or "")
			local Flag = V328.Flag or Name2:gsub("%s+", "")
			local ToggleCallback = V328.ToggleCallback or function()
			end
			local ModeCallback = V328.ModeCallback or function()
			end

			DuskShineCore.Flags[Flag .. "_State"] = V331
			DuskShineCore.Flags[Flag .. "_Mode"] = V333

			local Frame13 = DuskShineCore.Utils.Make("Frame", {
				Size = UDim2.new(1, 0, 0, 70),
				BackgroundTransparency = 0.2,
				Parent = ScrollingFrame
			}, {
				BackgroundColor3 = "Section"
			})

			DuskShineCore.Utils.Make("UICorner", {
				CornerRadius = UDim.new(0, 12),
				Parent = Frame13
			})
			DuskShineCore.Utils.Make("UIStroke", {
				Thickness = 1.5,
				Transparency = 0.6,
				Parent = Frame13
			}, {
				Color = "Stroke"
			})
			DuskShineCore.Utils.Make("TextLabel", {
				Text = Name2,
				Size = UDim2.new(1, -165, 0, 20),
				Position = UDim2.new(0, 20, 0, 15),
				BackgroundTransparency = 1,
				Font = Enum.Font.GothamBold,
				TextSize = 16,
				TextXAlignment = Enum.TextXAlignment.Left,
				Parent = Frame13
			}, {
				TextColor3 = "Text"
			})
			DuskShineCore.Utils.Make("TextLabel", {
				Text = Description,
				Size = UDim2.new(1, -165, 0, 15),
				Position = UDim2.new(0, 20, 0, 38),
				BackgroundTransparency = 1,
				FontFace = font,
				TextSize = 13,
				TextXAlignment = Enum.TextXAlignment.Left,
				Parent = Frame13
			}, {
				TextColor3 = "SubText"
			})

			local Make = DuskShineCore.Utils.Make
			local S6 = "TextButton"
			local T11 = {
				Text = "",
				Size = UDim2.new(0, 48, 0, 26),
				AnchorPoint = Vector2.new(1, 0.5),
				Position = UDim2.new(1, -20, 0.5, 0),
				Parent = Frame13
			}
			local backgroundColor3 = V331 and "Accent"
			local T12 = {
				BackgroundColor3 = backgroundColor3 or "ToggleOff"
			}
			local V343 = Make(S6, T11, T12)

			DuskShineCore.Utils.Make("UICorner", {
				CornerRadius = UDim.new(1, 0),
				Parent = V343
			})

			local uDim2 = UDim2.new(1, -23, 0.5, 0)
			local UDim22 = UDim2.new(0, 3, 0.5, 0)
			local Frame14 = DuskShineCore.Utils.Make("Frame", {
				Size = UDim2.new(0, 20, 0, 20),
				AnchorPoint = Vector2.new(0, 0.5),
				Position = V331 and uDim2 or UDim22,
				Parent = V343
			}, {
				BackgroundColor3 = "Knob"
			})

			DuskShineCore.Utils.Make("UICorner", {
				CornerRadius = UDim.new(1, 0),
				Parent = Frame14
			})

			local V347 = P94:CreateSubPage({
				Name = Name2 .. " Modes"
			})
			local Container = V347.Container

			for _, Child in ipairs(Container:GetChildren()) do
				if Child:IsA("UIListLayout") then
					Child:Destroy()
				end
			end

			DuskShineCore.Utils.Make("UIGridLayout", {
				CellSize = UDim2.new(0, 160, 0, 140),
				CellPadding = UDim2.new(0, 15, 0, 15),
				SortOrder = Enum.SortOrder.LayoutOrder,
				Parent = Container
			})

			local T13 = {}

			for _, Mode in ipairs(Modes) do
				local TextButton3 = DuskShineCore.Utils.Make("TextButton", {
					Size = UDim2.new(1, 0, 1, 0),
					BackgroundColor3 = Color3.fromRGB(255, 255, 255),
					Text = "",
					Parent = Container
				})

				DuskShineCore.Utils.Make("UICorner", {
					CornerRadius = UDim.new(0, 16),
					Parent = TextButton3
				})

				local UIStroke = DuskShineCore.Utils.Make("UIStroke", {
					Thickness = 4,
					Color = Color3.fromRGB(0, 0, 0),
					Parent = TextButton3
				})
				local Frame15 = DuskShineCore.Utils.Make("Frame", {
					Size = UDim2.new(0.8, 0, 0, 4),
					Position = UDim2.new(0.1, 0, 0, 12),
					BackgroundColor3 = Color3.fromRGB(150, 0, 0),
					BorderSizePixel = 0,
					Parent = TextButton3
				})

				DuskShineCore.Utils.Make("UICorner", {
					CornerRadius = UDim.new(1, 0),
					Parent = Frame15
				})
				DuskShineCore.Utils.Make("ImageLabel", {
					Size = UDim2.new(0.8, 0, 0.5, 0),
					Position = UDim2.new(0.1, 0, 0.25, 0),
					BackgroundTransparency = 1,
					ScaleType = Enum.ScaleType.Fit,
					Image = Mode.Image or "",
					Parent = TextButton3
				})
				DuskShineCore.Utils.Make("TextLabel", {
					Size = UDim2.new(1, 0, 0, 20),
					Position = UDim2.new(0, 0, 1, -28),
					BackgroundTransparency = 1,
					Text = string.upper(Mode.Name),
					Font = Enum.Font.Bangers,
					TextSize = 22,
					TextColor3 = Color3.fromRGB(0, 0, 0),
					Parent = TextButton3
				})
				T13[Mode.Name] = UIStroke

				local UIScale2 = Instance.new("UIScale", TextButton3)

				DuskShineCore:Connect(TextButton3.MouseButton1Click, function()
					DuskShineCore.Flags[Flag .. "_Mode"] = Mode.Name
					DuskShineCore.Utils.TBT(UIScale2, 0.1, {
						Scale = 0.9
					}, Enum.EasingStyle.Sine)
					task.delay(0.1, function()
						DuskShineCore.Utils.TBT(UIScale2, 0.15, {
							Scale = 1
						}, Enum.EasingStyle.Bounce)
					end)

					for K, V in pairs(T13) do
						V.Color = K == Mode.Name and Color3.fromRGB(220, 20, 20) or Color3.fromRGB(0, 0, 0)
					end

					pcall(ModeCallback, Mode.Name)
				end)
			end

			if T13[V333] then
				T13[V333].Color = Color3.fromRGB(220, 20, 20)
			end

			local ImageButton2 = DuskShineCore.Utils.Make("ImageButton", {
				Size = UDim2.new(0, 20, 0, 20),
				AnchorPoint = Vector2.new(1, 0.5),
				Position = UDim2.new(1, -80, 0.5, 0),
				BackgroundTransparency = 1,
				Image = "rbxassetid://7734053495",
				Parent = Frame13
			})

			DuskShineCore.ThemeObjects[ImageButton2] = {
				ImageColor3 = "SubText"
			}
			ImageButton2.ImageColor3 = DuskShineCore.CurrentTheme.SubText

			local UIScale2 = Instance.new("UIScale", ImageButton2)

			DuskShineCore:Connect(ImageButton2.MouseEnter, function()
				DuskShineCore.Utils.TBT(UIScale2, 0.2, {
					Scale = 1.15
				})
				DuskShineCore.Utils.TBT(ImageButton2, 0.2, {
					ImageColor3 = DuskShineCore.CurrentTheme.Accent
				})
			end)
			DuskShineCore:Connect(ImageButton2.MouseLeave, function()
				DuskShineCore.Utils.TBT(UIScale2, 0.2, {
					Scale = 1
				})
				DuskShineCore.Utils.TBT(ImageButton2, 0.2, {
					ImageColor3 = DuskShineCore.CurrentTheme.SubText
				})
			end)
			DuskShineCore:Connect(ImageButton2.MouseButton1Click, function()
				DuskShineCore.Utils.CreateRipple(ImageButton2)
				V347:Open()
			end)

			local function V362(P96)
				if DuskShineCore.Flags[Flag .. "_State"] == P96 then
					return
				end

				DuskShineCore.Flags[Flag .. "_State"] = P96
				DuskShineCore.ThemeObjects[V343].BackgroundColor3 = P96 and "Accent" or "ToggleOff"

				local TBT = DuskShineCore.Utils.TBT
				local V364 = V343
				local N2 = 0.25

				TBT(V364, N2, {
					BackgroundColor3 = P96 and DuskShineCore.CurrentTheme.Accent or DuskShineCore.CurrentTheme.ToggleOff
				})

				local TBT2 = DuskShineCore.Utils.TBT
				local V367 = Frame14
				local V369 = P96 and uDim2
				local T14 = {
					Position = V369 or UDim22
				}

				TBT2(V367, N2, T14)

				if P96 then
					DuskShineCore.Utils.ApplyGradient(V343, DuskShineCore.CurrentTheme.Accent)
				else
					local DuskShineGradient = V343:FindFirstChild("DuskShine_Gradient")

					if DuskShineGradient then
						DuskShineGradient:Destroy()
					end
				end

				pcall(ToggleCallback, P96)
			end

			DuskShineCore.ConfigUpdaters[Flag .. "_State"] = function(P97)
				V362(P97)
			end
			DuskShineCore:Connect(V343.MouseButton1Click, function()
				V362(not DuskShineCore.Flags[Flag .. "_State"])
			end)

			return {
				Container = Frame13,
				SetState = V362,
				GetState = function()
					return DuskShineCore.Flags[Flag .. "_State"]
				end,
				GetMode = function()
					return DuskShineCore.Flags[Flag .. "_Mode"]
				end
			}
		end

		if #P38.Tabs == 1 then
			T3:SelectTab(T4)
		end

		return T4
	end

	T3.CreateTab = createTab

	local ScrollingFrame = DuskShineCore.Utils.Make("ScrollingFrame", {
		Name = "GlobalSearchPage",
		Size = UDim2.new(1, -20, 1, -10),
		Position = UDim2.new(0, 10, 0, 5),
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		ScrollBarThickness = 3,
		Visible = false,
		ZIndex = 50,
		Parent = Frame11
	}, {
		ScrollBarImageColor3 = "SubText"
	})
	local UIListLayout = DuskShineCore.Utils.Make("UIListLayout", {
		Padding = UDim.new(0, 12),
		SortOrder = Enum.SortOrder.LayoutOrder,
		Parent = ScrollingFrame
	})

	DuskShineCore.Utils.Make("UIPadding", {
		PaddingTop = UDim.new(0, 10),
		PaddingLeft = UDim.new(0, 10),
		PaddingRight = UDim.new(0, 20),
		PaddingBottom = UDim.new(0, 15),
		Parent = ScrollingFrame
	})
	UIListLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
		ScrollingFrame.CanvasSize = UDim2.new(0, 0, 0, UIListLayout.AbsoluteContentSize.Y + 20)
	end)

	local T15 = {}

	local function V374()
		ScrollingFrame.Visible = false

		for K, V in pairs(T15) do
			if K and V.Parent then
				K.Parent = V.Parent
				K.LayoutOrder = V.OriginalOrder
				K.Visible = V.OriginalVisible
			end
		end

		table.clear(T15)

		if T3 and T3.CurrentTab then
			for _, Tab in ipairs(T3.Tabs) do
				if Tab.Btn == T3.CurrentTab then
					Tab.Page.Visible = true

					break
				end
			end
		end
	end

	DuskShineCore:Connect(TextBox:GetPropertyChangedSignal("Text"), function()
		local Match = string.lower(TextBox.Text):match("^%s*(.-)%s*$") or ""

		if Match == "" then
			V374()

			return
		end

		for _, Tab in ipairs(T3.Tabs) do
			Tab.Page.Visible = false
		end

		ScrollingFrame.Visible = true

		if not next(T15) then
			local N3 = 0

			for _, Tab in ipairs(T3.Tabs) do
				N3 += 1

				local N4 = 0

				for _, Child in ipairs(Tab.Page:GetChildren()) do
					if Child:IsA("GuiObject") and not Child:IsA("UIListLayout") and not Child:IsA("UIPadding") then
						if not string.find(Child.Name, "SubPage") then
							N4 += 1

							local LayoutOrder = Child.LayoutOrder

							if LayoutOrder == 0 then
								LayoutOrder = N4
							end

							Child.LayoutOrder = LayoutOrder
							T15[Child] = {
								Parent = Tab.Page,
								OriginalOrder = LayoutOrder,
								AbsoluteOrder = N3 * 1000 + LayoutOrder,
								TabRef = Tab,
								OriginalVisible = Child.Visible
							}
						end
					end
				end
			end
		end

		local T16 = {}

		for K, V in pairs(T15) do
			local V392 = false
			local S7 = ""

			for _, Descendant in ipairs(K:GetDescendants()) do
				if not Descendant:IsA("TextLabel") and not Descendant:IsA("TextBox") then
					if not Descendant:IsA("TextButton") then
						continue
					end
				end

				S7 ..= " " .. tostring(Descendant.Text or "")
			end

			local V396 = string.lower(string.gsub(S7, "<[^>]+>", ""))

			if string.find(V396, Match, 1, true) then
				V392 = true
			end

			if string.find(V396, "update log") or string.len(V396) > 100 then
				V392 = false
			end

			if V392 then
				table.insert(T16, {
					Element = K,
					Data = V
				})
			elseif K.Parent == ScrollingFrame then
				K.Parent = V.Parent
				K.LayoutOrder = V.OriginalOrder
				K.Visible = V.OriginalVisible
			end
		end

		table.sort(T16, function(P98, P99)
			return (P98.Data.AbsoluteOrder or 0) < (P99.Data.AbsoluteOrder or 0)
		end)

		for I, V in ipairs(T16) do
			V.Element.Parent = ScrollingFrame
			V.Element.LayoutOrder = I
			V.Element.Visible = true
		end

		task.defer(function()
			ScrollingFrame.CanvasPosition = Vector2.new(0, 0)
		end)
	end)
	DuskShineCore:Connect(UserInputService.InputBegan, function(P100)
		if not ScrollingFrame.Visible then
			return
		end

		if P100.UserInputType == Enum.UserInputType.MouseButton1 or P100.UserInputType == Enum.UserInputType.Touch then
			local Position3 = P100.Position
			local AbsolutePosition = ScrollingFrame.AbsolutePosition
			local AbsoluteSize = ScrollingFrame.AbsoluteSize

			if AbsolutePosition.X <= Position3.X and Position3.X <= AbsolutePosition.X + AbsoluteSize.X then
				if AbsolutePosition.Y <= Position3.Y and Position3.Y <= AbsolutePosition.Y + AbsoluteSize.Y then
					for K, V in pairs(T15) do
						if K.Parent == ScrollingFrame and K.Visible then
							local AbsolutePosition2 = K.AbsolutePosition
							local AbsoluteSize2 = K.AbsoluteSize

							if AbsolutePosition2.X <= Position3.X and Position3.X <= AbsolutePosition2.X + AbsoluteSize2.X and AbsolutePosition2.Y <= Position3.Y and Position3.Y <= AbsolutePosition2.Y + AbsoluteSize2.Y then
								TextBox.Text = ""
								T3:SelectTab(V.TabRef)
								task.spawn(function()
									task.wait(0.15)
									DuskShineCore.Utils.TBT(V.Parent, 0.3, {
										CanvasPosition = Vector2.new(0, K.AbsolutePosition.Y - V.Parent.AbsolutePosition.Y + V.Parent.CanvasPosition.Y - 15)
									}, Enum.EasingStyle.Cubic)

									local UIStroke = K:FindFirstChildOfClass("UIStroke")

									if UIStroke then
										local Color = UIStroke.Color
										local Thickness = UIStroke.Thickness

										DuskShineCore.Utils.TBT(UIStroke, 0.2, {
											Color = DuskShineCore.CurrentTheme.Accent,
											Thickness = 2.5
										})
										task.wait(0.6)
										DuskShineCore.Utils.TBT(UIStroke, 0.5, {
											Color = Color,
											Thickness = Thickness
										})
									end
								end)

								break
							end
						end
					end
				end
			end
		end
	end)
	T3.Build = function()
		task.spawn(function()
			DuskShineCore:RunLoader(ScreenGui, function()
				CanvasGroup.Visible = true
				DuskShineCore.Utils.TBT(CanvasGroup, 0.5, {
					GroupTransparency = 0
				})
			end)
		end)
	end

	return T3
end
DuskShineCore.Notify = function(P101, P102, P103, P104, P105, P106)
	local V409 = P104 or 3
	local V410 = P105 or "rbxassetid://283952329"

	if tonumber(V410) then
		V410 = "rbxassetid://" .. v410
	end

	if P106 and tonumber(P106) then
		P106 = "rbxassetid://" .. p106
	end

	local DuskShineMega = PlayerGui:FindFirstChild("DuskShine_Mega")

	if not DuskShineMega then
		return
	end

	local Notifications = DuskShineMega:FindFirstChild("Notifications")

	if not Notifications then
		return
	end

	local Frame = DuskShineCore.Utils.Make("Frame", {
		Size = UDim2.new(0, 310, 0, 0),
		AutomaticSize = Enum.AutomaticSize.Y,
		BackgroundTransparency = 1,
		Parent = Notifications
	})
	local Frame2 = DuskShineCore.Utils.Make("Frame", {
		Size = UDim2.new(1, 0, 1, -5),
		Position = UDim2.new(1, 40, 0, 0),
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		ClipsDescendants = true,
		Parent = Frame
	}, {
		BackgroundColor3 = "Section"
	})

	DuskShineCore.Utils.Make("UICorner", {
		CornerRadius = UDim.new(0, 8),
		Parent = Frame2
	})

	local UIStroke = DuskShineCore.Utils.Make("UIStroke", {
		Thickness = 1,
		Transparency = 1,
		Parent = Frame2
	}, {
		Color = "Stroke"
	})
	local ImageLabel

	if P106 then
		ImageLabel = DuskShineCore.Utils.Make("ImageLabel", {
			Size = UDim2.new(0, 160, 0, 160),
			Position = UDim2.new(1, 35, 0.5, 0),
			AnchorPoint = Vector2.new(1, 0.5),
			BackgroundTransparency = 1,
			Image = P106,
			ImageTransparency = 1,
			ScaleType = Enum.ScaleType.Fit,
			ZIndex = 1,
			Parent = Frame2
		})
	end

	local Frame3 = DuskShineCore.Utils.Make("Frame", {
		Size = UDim2.new(1, 0, 1, 0),
		BackgroundTransparency = 1,
		ZIndex = 2,
		Parent = Frame2
	})

	DuskShineCore.Utils.Make("UIPadding", {
		PaddingTop = UDim.new(0, 12),
		PaddingBottom = UDim.new(0, 18),
		PaddingLeft = UDim.new(0, 12),
		PaddingRight = UDim.new(0, 12),
		Parent = Frame3
	})

	local ImageLabel2 = DuskShineCore.Utils.Make("ImageLabel", {
		Size = UDim2.new(0, 32, 0, 32),
		Position = UDim2.new(0, 0, 0, 0),
		BackgroundTransparency = 1,
		Image = V410,
		ImageTransparency = 1,
		ZIndex = 3,
		Parent = Frame3
	})
	local V419 = P106 and -55 or -42
	local TextLabel = DuskShineCore.Utils.Make("TextLabel", {
		Text = P102,
		Size = UDim2.new(1, V419, 0, 16),
		Position = UDim2.new(0, 42, 0, 0),
		BackgroundTransparency = 1,
		Font = Enum.Font.GothamBold,
		TextSize = 14,
		TextXAlignment = Enum.TextXAlignment.Left,
		TextTransparency = 1,
		ZIndex = 3,
		Parent = Frame3
	}, {
		TextColor3 = "Text"
	})
	local TextLabel2 = DuskShineCore.Utils.Make("TextLabel", {
		Text = P103,
		Size = UDim2.new(1, V419, 0, 0),
		Position = UDim2.new(0, 42, 0, 18),
		AutomaticSize = Enum.AutomaticSize.Y,
		BackgroundTransparency = 1,
		Font = Enum.Font.GothamMedium,
		TextSize = 12,
		TextWrapped = true,
		TextXAlignment = Enum.TextXAlignment.Left,
		TextTransparency = 1,
		ZIndex = 3,
		Parent = Frame3
	}, {
		TextColor3 = "SubText"
	})
	local Frame4 = DuskShineCore.Utils.Make("Frame", {
		Size = UDim2.new(1, 0, 0, 3),
		Position = UDim2.new(0, 0, 1, -3),
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		ZIndex = 5,
		Parent = Frame2
	})
	local Frame5 = DuskShineCore.Utils.Make("Frame", {
		Size = UDim2.new(0, 0, 1, 0),
		BorderSizePixel = 0,
		BackgroundTransparency = 1,
		Parent = Frame4
	}, {
		BackgroundColor3 = "Accent"
	})

	DuskShineCore.Utils.TBT(Frame2, 0.35, {
		Position = UDim2.new(0, 0, 0, 0),
		BackgroundTransparency = 0
	}, Enum.EasingStyle.Quint, Enum.EasingDirection.Out)
	DuskShineCore.Utils.TBT(UIStroke, 0.35, {
		Transparency = 0.2
	})
	DuskShineCore.Utils.TBT(ImageLabel2, 0.35, {
		ImageTransparency = 0
	})
	DuskShineCore.Utils.TBT(TextLabel, 0.35, {
		TextTransparency = 0
	})
	DuskShineCore.Utils.TBT(TextLabel2, 0.35, {
		TextTransparency = 0
	})
	DuskShineCore.Utils.TBT(Frame5, 0.35, {
		BackgroundTransparency = 0
	})

	if ImageLabel then
		DuskShineCore.Utils.TBT(ImageLabel, 0.35, {
			ImageTransparency = 0.85
		})
	end

	DuskShineCore.Utils.TBT(Frame5, V409, {
		Size = UDim2.new(1, 0, 1, 0)
	}, Enum.EasingStyle.Linear)

	local U424 = false

	task.delay(V409, function()
		if U424 then
			return
		end

		U424 = true

		local V425 = DuskShineCore.Utils.TBT(Frame2, 0.3, {
			Position = UDim2.new(1, 50, 0, 0),
			BackgroundTransparency = 1
		}, Enum.EasingStyle.Back, Enum.EasingDirection.In)

		DuskShineCore.Utils.TBT(UIStroke, 0.3, {
			Transparency = 1
		})
		DuskShineCore.Utils.TBT(ImageLabel2, 0.3, {
			ImageTransparency = 1
		})
		DuskShineCore.Utils.TBT(TextLabel, 0.3, {
			TextTransparency = 1
		})
		DuskShineCore.Utils.TBT(TextLabel2, 0.3, {
			TextTransparency = 1
		})
		DuskShineCore.Utils.TBT(Frame5, 0.3, {
			BackgroundTransparency = 1
		})

		if ImageLabel then
			DuskShineCore.Utils.TBT(ImageLabel, 0.3, {
				ImageTransparency = 1
			})
		end

		V425.Completed:Connect(function()
			Frame:Destroy()
		end)
	end)
end

return DuskShineCore
]===],
    ["/raw/modules/adm_cloner/home"] = [===[local Module = {}

function Module:Init(Library, Window, Tab)
    local Players = game:GetService("Players")
    local LocalPlayer = Players.LocalPlayer
    
    local IsAnonymous = getgenv().AnonymousMode or (Library.Settings and Library.Settings.AnonymousMode) or false 
    
    local displayName = LocalPlayer.Name
    pcall(function()
        if LocalPlayer.DisplayName and LocalPlayer.DisplayName ~= "" then
            displayName = LocalPlayer.DisplayName
        end
    end)
    if IsAnonymous then displayName = "Hidden User" end

    local NameFont = Enum.Font.GothamBold
    local FancyFonts = {"Shojumaru", "Macondo", "AmaticSC", "Fantasy"}
    for _, FontName in ipairs(FancyFonts) do
        local Success, fontEnum = pcall(function() return Enum.Font[FontName] end)
        if Success and FontEnum then NameFont = FontEnum; break end
    end

     
     
     
    Tab:CreateDivider({ Text = "Home" })  
    
    local Greetings = { "Hello", "Welcome back", "Wassup dear" }
    local RandomGreeting = Greetings[math.random(1, #Greetings)]

     
    local TopContainer = Library.Utils.Make("Frame", {
        Size = UDim2.new(1, 0, 0, 110), 
        BackgroundTransparency = 1,
        Parent = Tab.Page
    })

     
    local WelcomeFrame = Library.Utils.Make("Frame", {
        Size = UDim2.new(0.5, -5, 1, 0), Position = UDim2.new(0, 0, 0, 0),
        BackgroundTransparency = 1, Parent = TopContainer
    })

     
    local AvatarImage = Library.Utils.Make("ImageLabel", {
        Size = UDim2.new(0, 60, 0, 60), Position = UDim2.new(0, 10, 0.5, -30),
        Image = "rbxthumb://type=AvatarHeadShot&id=" .. LocalPlayer.UserId .. "&w=150&h=150",
        BackgroundTransparency = IsAnonymous and 0 or 1, BackgroundColor3 = Color3.new(0, 0, 0),
        ImageTransparency = IsAnonymous and 1 or 0, Parent = WelcomeFrame
    })
    Library.Utils.Make("UICorner", {CornerRadius = UDim.new(1, 0), Parent = AvatarImage})

    local AvatarLetter = Library.Utils.Make("TextLabel", {
        Text = "?", Size = UDim2.new(1, 0, 1, 0), BackgroundTransparency = 1,
        Font = Enum.Font.GothamBold, TextSize = 28, Visible = IsAnonymous, Parent = AvatarImage
    }, { TextColor3 = "Accent" })

     
    Library.Utils.Make("TextLabel", {
        Text = RandomGreeting .. ",", Size = UDim2.new(1, -85, 0, 20), Position = UDim2.new(0, 85, 0.5, -24),
        BackgroundTransparency = 1, Font = Enum.Font.GothamMedium, TextSize = 14,
        TextXAlignment = Enum.TextXAlignment.Left, Parent = WelcomeFrame
    }, { TextColor3 = "SubText" })

    local UsernameLabel = Library.Utils.Make("TextLabel", {
        Text = displayName .. "!", Size = UDim2.new(1, -85, 0, 35), Position = UDim2.new(0, 85, 0.5, -4),
        BackgroundTransparency = 1, Font = NameFont, TextSize = 26,
        TextXAlignment = Enum.TextXAlignment.Left, TextScaled = true, Parent = WelcomeFrame
    }, { TextColor3 = "Accent" })
    Library.Utils.Make("UITextSizeConstraint", {MaxTextSize = 28, MinTextSize = 14, Parent = UsernameLabel})

    if Library.AnonItems then
        table.insert(Library.AnonItems.Avatars, {ImageObj = AvatarImage, Letter = AvatarLetter})
        table.insert(Library.AnonItems.Names, {Obj = UsernameLabel, Format = "%s!"})
    end

     
     
     
    Tab:CreateDivider({ Text = "Latest Update" })  
    local UpdateLogLabel = Tab:CreateLabel({ Text = "Fetching update log..." })

     
    UpdateLogLabel.SetText("Local captured build — online update log disabled.")

     
     
     
    local function CreateModernCard(name, Desc, IconId, Callback)
        local Card = Library.Utils.Make("Frame", { Size = UDim2.new(1, 0, 0, 60), Parent = Tab.Page }, { BackgroundColor3 = "Section" })
        Library.Utils.Make("UICorner", {CornerRadius = UDim.new(0, 8), Parent = Card})
        local Stroke = Library.Utils.Make("UIStroke", {Thickness = 1, Parent = Card}, { Color = "Stroke" })
        
        Library.Utils.Make("TextLabel", { Text = name, Size = UDim2.new(1, -70, 0, 16), Position = UDim2.new(0, 15, 0, 12), BackgroundTransparency = 1, Font = Enum.Font.GothamBold, TextSize = 14, TextXAlignment = Enum.TextXAlignment.Left, Parent = Card }, { TextColor3 = "Text" })
        Library.Utils.Make("TextLabel", { Text = Desc, Size = UDim2.new(1, -70, 0, 14), Position = UDim2.new(0, 15, 0, 32), BackgroundTransparency = 1, Font = Enum.Font.GothamMedium, TextSize = 11, TextXAlignment = Enum.TextXAlignment.Left, Parent = Card }, { TextColor3 = "SubText" })
        
        local Btn = Library.Utils.Make("TextButton", { Size = UDim2.new(1, 0, 1, 0), BackgroundTransparency = 1, Text = "", Parent = Card })
        local Icon = Library.Utils.Make("ImageLabel", { Size = UDim2.new(0, 24, 0, 24), AnchorPoint = Vector2.new(1, 0.5), Position = UDim2.new(1, -15, 0.5, 0), BackgroundTransparency = 1, Image = IconId, Parent = Card }, { ImageColor3 = "SubText" })

        Library:Connect(Btn.MouseEnter, function() 
            Library.Utils.TBT(Stroke, 0.25, {Color = Library.CurrentTheme.Accent})
            Library.Utils.TBT(Icon, 0.25, {ImageColor3 = Library.CurrentTheme.Accent, Size = UDim2.new(0, 28, 0, 28)}) 
        end)
        Library:Connect(Btn.MouseLeave, function() 
            Library.Utils.TBT(Stroke, 0.25, {Color = Library.CurrentTheme.Stroke})
            Library.Utils.TBT(Icon, 0.25, {ImageColor3 = Library.CurrentTheme.SubText, Size = UDim2.new(0, 24, 0, 24)})
        end)
        Library:Connect(Btn.MouseButton1Click, function()
            Library.Utils.CreateRipple(Card)
            pcall(Callback)
        end)
    end

     
     
     
    Tab:CreateDivider({ Text = "Server Utilities" })  

    local function RejoinServer()
        game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, game.JobId, LocalPlayer)
    end

    local function ServerHop()
        local Http = game:GetService("HttpService")
        local TPS = game:GetService("TeleportService")
        local Api = "https://games.roblox.com/v1/games/" .. game.PlaceId .. "/servers/Public?sortOrder=Desc&limit=100"
        
        local Success, result = pcall(function() return game:HttpGet(Api) end)
        if Success then
            local Data = Http:JSONDecode(Result)
            if Data and Data.data then
                for _, S in ipairs(Data.data) do
                    if S.playing <= (S.maxPlayers - 3) and S.id ~= game.JobId then
                        TPS:TeleportToPlaceInstance(game.PlaceId, S.id)
                        return
                    end
                end
            end
        end
        TPS:Teleport(game.PlaceId)
    end

    CreateModernCard("Server Hop", "Finds and joins a new public server", "rbxassetid://115929304045144", ServerHop)
    CreateModernCard("Rejoin Server", "Reconnects to the current server instance", "rbxassetid://100152237482023", RejoinServer)

     
     
     
    Tab:CreateDivider({ Text = "Community & Links" })  

    local function CopyToClipboard(text, NotifyName)
        if setclipboard then
            setclipboard(text)
            if Library.Notify then 
                 
                 
                Library:Notify(
                    "Link Copied!", 
                    "Copied " .. notifyName .. " to clipboard.", 
                    3, 
                    "rbxassetid://10723426722", 
                    "rbxassetid://72958619361915"
                ) 
            end
        end
    end

     
    CreateModernCard("Telegram Channel", "https://t.me/DuskAndShine", "rbxassetid://111514738904110", function()
        CopyToClipboard("https://t.me/DuskAndShine", "Telegram Link")
    end)
    
    CreateModernCard("Official Website", "https://duskandshine.xyz", "rbxassetid://7733954760", function()
        CopyToClipboard("https://duskandshine.xyz", "Website Link")
    end)
    
    CreateModernCard("Discord Server", "https://discord.gg/duskshine", "rbxassetid://112538196670712", function()
        CopyToClipboard("https://discord.gg/duskshine", "Discord Link")
    end)

end

return Module
]===],
    ["/raw/modules/adm_cloner/main"] = [===[local HttpService = game:GetService("HttpService")
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Module = {}

local FolderName = "DuskAndShine_Houses"

local function GetSavedHouses()
    if not isfolder(FolderName) then makefolder(FolderName) end
    local Houses = {}
    
    local Success, files = pcall(function() return listfiles(FolderName) end)
    if not Success or type(Files) ~= "table" then return Houses end
    
    for _, Path in ipairs(Files) do
        local FileName = Path:match("([^/\\]+)%.[jJ][sS][oO][nN]$")
        if FileName then table.insert(Houses, FileName) end
    end
    return Houses
end

function Module:Init(Library, Window, Tab)
    local LocalPlayer = Players.LocalPlayer
    local SelectedHouse = nil
    local CurrentBuildDelay = 0
    local CurrentBatchSize = 15
    local CopyTextures = true
    local HouseDropdown 

     
    local Fsys = require(ReplicatedStorage:WaitForChild("Fsys")).load
    local ClientData = Fsys("ClientData")
    local SharedConstants = Fsys("SharedConstants")

     
    local function GetHouseFurnitureStatus()
        local HouseInterior = ClientData.get("house_interior")
        local PlacedCount = 0

        if HouseInterior and type(HouseInterior.furniture) == "table" then
            for _ in pairs(HouseInterior.furniture) do
                PlacedCount = PlacedCount + 1
            end
        end

        local MaxLimit = (SharedConstants.housing_editor and SharedConstants.housing_editor.max_furniture) 
            or SharedConstants.max_furniture_per_house 
            or 4000

        local CanPlace = math.max(0, MaxLimit - PlacedCount)
        return PlacedCount, MaxLimit, CanPlace
    end
    
     
    local CachedFurnitureDB = nil
    task.spawn(function()
        pcall(function()
            CachedFurnitureDB = Fsys("FurnitureDB")
        end)
    end)

    local function GetPlayerBucks()
        local Bucks = 0
        pcall(function()
            local Fsys = require(game:GetService("ReplicatedStorage"):WaitForChild("Fsys")).load
            local ClientData = Fsys("ClientData")
            
             
            Bucks = ClientData.get("bucks") or 0
            
             
            if Bucks == 0 then
                local PName = game:GetService("Players").LocalPlayer.Name
                local AllData = ClientData.get_data()
                
                if AllData and AllData[PName] then
                    if type(AllData[PName].bucks) == "number" then
                        Bucks = AllData[PName].bucks
                    elseif AllData[PName].inventory and type(AllData[PName].inventory.bucks) == "number" then
                        Bucks = AllData[PName].inventory.bucks
                    end
                end
            end
        end)
        return Bucks
    end
     
     
     
    local SectionContainer = Library.Utils.Make("Frame", {
        Size = UDim2.new(1, 0, 0, 30),
        BackgroundTransparency = 1,
        Parent = Tab.Page
    })

    Library.Utils.Make("TextLabel", {
        Text = '<b>UTILITY:</b> <font color="#9696a0">House Builder</font>',
        RichText = true, 
        Size = UDim2.new(1, -40, 1, 0), 
        Position = UDim2.new(0, 5, 0, 0),
        BackgroundTransparency = 1, 
        Font = Enum.Font.GothamBold,
        TextSize = 14, 
        TextXAlignment = Enum.TextXAlignment.Left, 
        Parent = SectionContainer
    }, { TextColor3 = "Text" })

    local RefreshBtn = Library.Utils.Make("TextButton", {
        Size = UDim2.new(0, 26, 0, 26),
        Position = UDim2.new(1, -26, 0, 2),
        Text = "",
        AutoButtonColor = false,
        Parent = SectionContainer
    }, { BackgroundColor3 = "Sidebar" })
    Library.Utils.Make("UICorner", { CornerRadius = UDim.new(0, 6), Parent = RefreshBtn })

    local RefStroke = Library.Utils.Make("UIStroke", { Thickness = 1, Transparency = 0.5, Parent = RefreshBtn }, { Color = "Stroke" })
    
    local RefIcon = Library.Utils.Make("ImageLabel", {
        Size = UDim2.new(0, 16, 0, 16),
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.new(0.5, 0, 0.5, 0),
        BackgroundTransparency = 1,
        Image = "rbxassetid://6723921202",
        Parent = RefreshBtn
    }, { ImageColor3 = "SubText" })
    
    local RefScale = Instance.new("UIScale", RefreshBtn)
    
    Library:Connect(RefreshBtn.MouseEnter, function() 
        Library.Utils.TBT(RefStroke, 0.2, {Transparency = 0})
        Library.Utils.TBT(RefreshBtn, 0.2, {BackgroundColor3 = Library.CurrentTheme.Section})
        Library.Utils.TBT(RefIcon, 0.2, {ImageColor3 = Library.CurrentTheme.Accent})
    end)
    Library:Connect(RefreshBtn.MouseLeave, function() 
        Library.Utils.TBT(RefStroke, 0.2, {Transparency = 0.5})
        Library.Utils.TBT(RefreshBtn, 0.2, {BackgroundColor3 = Library.CurrentTheme.Sidebar})
        Library.Utils.TBT(RefIcon, 0.2, {ImageColor3 = Library.CurrentTheme.SubText})
    end)
    
    Library:Connect(RefreshBtn.MouseButton1Click, function()
        local T = Library.Utils.TBT(RefScale, 0.1, {Scale = 0.9})
        T.Completed:Connect(function() Library.Utils.TBT(RefScale, 0.2, {Scale = 1}, Enum.EasingStyle.Bounce) end)
        Library.Utils.TBT(RefIcon, 0.5, {Rotation = 360}); task.delay(0.5, function() RefIcon.Rotation = 0 end)
        
        if HouseDropdown and type(HouseDropdown.Refresh) == "function" then
            HouseDropdown.Refresh(GetSavedHouses())
            if type(HouseDropdown.SetValue) == "function" then
                HouseDropdown.SetValue("Select...")
            end
            SelectedHouse = nil 
        end
        Library:Notify("Builder", "House list successfully refreshed!", 3, "rbxassetid://91727514118912", "rbxassetid://72958619361915")
    end)
    
     
    getgenv().AutoSelectNewHouse = function(NewFileName)
        if HouseDropdown and type(HouseDropdown.Refresh) == "function" then
            HouseDropdown.Refresh(GetSavedHouses())  
            
            if NewFileName and type(HouseDropdown.SetValue) == "function" then
                HouseDropdown.SetValue(NewFileName)  
                SelectedHouse = NewFileName  
            end
        end
    end
    
    local TopDivider = Library.Utils.Make("Frame", {
        Size = UDim2.new(1, 0, 0, 1),
        BorderSizePixel = 0,
        Parent = Tab.Page
    }, { BackgroundColor3 = "Text" })
    
    local DivGrad = Instance.new("UIGradient", TopDivider)
    DivGrad.Transparency = NumberSequence.new({
        NumberSequenceKeypoint.new(0, 1),
        NumberSequenceKeypoint.new(0.5, 0.8),
        NumberSequenceKeypoint.new(1, 1)
    })
     
     
     
    
     
    local UpdateSchematicStats 

     
    HouseDropdown = Tab:CreateDropdown({
        Name = "Select House Schematic",
        Options = GetSavedHouses(),
        CurrentOption = "Select...",
        Callback = function(Option)
            SelectedHouse = Option
            if UpdateSchematicStats then
                UpdateSchematicStats(Option)
            end
        end
    })

     
    task.spawn(function()
        if HouseDropdown and type(HouseDropdown.SetValue) == "function" then
            HouseDropdown.SetValue("Select...")
        end
        SelectedHouse = nil
    end)

     
    local StatsContainer = Library.Utils.Make("Frame", {
        Size = UDim2.new(1, 0, 0, 38),
        BackgroundTransparency = 0,
        Parent = Tab.Page
    }, { BackgroundColor3 = "Section" })
    Library.Utils.Make("UICorner", { CornerRadius = UDim.new(0, 6), Parent = StatsContainer })
    Library.Utils.Make("UIStroke", { Thickness = 1, Transparency = 0.5, Parent = StatsContainer }, { Color = "Stroke" })

     
    local FurnIcon = Library.Utils.Make("ImageLabel", {
        Size = UDim2.new(0, 18, 0, 18),
        Position = UDim2.new(0, 12, 0.5, -9),
        BackgroundTransparency = 1,
        Image = "rbxassetid://124023920104939", 
        Parent = StatsContainer
    }, { ImageColor3 = "Accent" })

    local FurnLabel = Library.Utils.Make("TextLabel", {
        Text = "0 / 4000 Items",
        Size = UDim2.new(0.5, -35, 1, 0),
        Position = UDim2.new(0, 36, 0, 0),
        BackgroundTransparency = 1,
        Font = Enum.Font.GothamMedium,
        TextSize = 13,
        TextXAlignment = Enum.TextXAlignment.Left,
        Parent = StatsContainer
    }, { TextColor3 = "Text" })

     
    Library.Utils.Make("Frame", {
        Size = UDim2.new(0, 1, 1, -14),
        Position = UDim2.new(0.5, 0, 0, 7),
        BorderSizePixel = 0,
        Parent = StatsContainer
    }, { BackgroundColor3 = "Stroke" })

     
    local PriceIcon = Library.Utils.Make("ImageLabel", {
        Size = UDim2.new(0, 18, 0, 18),
        Position = UDim2.new(0.5, 12, 0.5, -9),
        BackgroundTransparency = 1,
        Image = "rbxassetid://126904798120349", 
        Parent = StatsContainer
    }, { ImageColor3 = "Accent" })

    local PriceLabel = Library.Utils.Make("TextLabel", {
        Text = "Cost: $0",
        Size = UDim2.new(0.5, -35, 1, 0),
        Position = UDim2.new(0.5, 36, 0, 0),
        BackgroundTransparency = 1,
        Font = Enum.Font.GothamMedium,
        TextSize = 13,
        TextXAlignment = Enum.TextXAlignment.Left,
        Parent = StatsContainer
    }, { TextColor3 = "Text" })

     
    UpdateSchematicStats = function(FileName)
        if FileName and FileName ~= "Select..." and FileName ~= "" then
            local FilePath = FolderName .. "/" .. fileName .. ".json"
            if not isfile(FilePath) then return end

            task.spawn(function()
                local Success, fileData = pcall(function() return readfile(FilePath) end)
                if not Success then return end
                
                local DecodeSuccess, savedHouse = pcall(function() return HttpService:JSONDecode(FileData) end)
                if not DecodeSuccess then return end

                local RawFurniture = SavedHouse.furniture or SavedHouse
                if type(RawFurniture) ~= "table" then return end

                local NeededSlots = #RawFurniture
                local TotalCost = 0
                
                if type(CachedFurnitureDB) == "table" then
                    for _, Item in ipairs(RawFurniture) do
                        local DbInfo = CachedFurnitureDB[Item.id or Item.name or Item.kind]
                        if DbInfo and DbInfo.cost and not DbInfo.is_limited and not DbInfo.is_event then
                            TotalCost = TotalCost + DbInfo.cost
                        end
                    end
                end

                FurnLabel.Text = string.format("%d / 4000 Items", NeededSlots)
                PriceLabel.Text = string.format("Cost: $%d", TotalCost)

                if NeededSlots > 4000 then
                    if Library.ThemeObjects[FurnLabel] then Library.ThemeObjects[FurnLabel] = { TextColor3 = "Red" } end
                    FurnLabel.TextColor3 = Library.CurrentTheme.Red
                else
                    if Library.ThemeObjects[FurnLabel] then Library.ThemeObjects[FurnLabel] = { TextColor3 = "Text" } end
                    FurnLabel.TextColor3 = Library.CurrentTheme.Text
                end
            end)
        end
    end

     
    task.spawn(function()
        local Fsys = require(ReplicatedStorage:WaitForChild("Fsys")).load
        local ClientData = Fsys("ClientData")

        while task.wait(1.5) do
            if not getgenv().DuskShine_Core then break end

             
            if not SelectedHouse or SelectedHouse == "Select..." or SelectedHouse == "" then
                local CamY = workspace.CurrentCamera.CFrame.Position.Y
                local IsHouseLoaded = workspace:FindFirstChild("HouseInteriors") 
                    and workspace.HouseInteriors:FindFirstChild("blueprint") 
                    and #workspace.HouseInteriors.blueprint:GetChildren() > 0

                 
                local IsOutside = (CamY < 500 or CamY > 8500 or not IsHouseLoaded)

                if IsOutside then
                    FurnLabel.Text = "0 / 4000 Items"
                    PriceLabel.Text = "Cost: $0"
                    if Library.ThemeObjects[FurnLabel] then Library.ThemeObjects[FurnLabel] = { TextColor3 = "Text" } end
                    FurnLabel.TextColor3 = Library.CurrentTheme.Text
                else
                    pcall(function()
                        local HouseInterior = ClientData.get("house_interior")
                        local PlacedCount = 0
                        local TotalValue = 0
                        
                        if HouseInterior and type(HouseInterior.furniture) == "table" then
                            for _, Item in pairs(HouseInterior.furniture) do
                                PlacedCount = PlacedCount + 1
                                if CachedFurnitureDB then
                                    local DbInfo = CachedFurnitureDB[Item.id or Item.name]
                                    if DbInfo and DbInfo.cost and not DbInfo.is_limited and not DbInfo.is_event then
                                        TotalValue = TotalValue + DbInfo.cost
                                    end
                                end
                            end
                        end
                        
                        FurnLabel.Text = string.format("%d / 4000 Items", PlacedCount)
                        PriceLabel.Text = string.format("Cost: $%d", TotalValue)
                    end)
                end
            end
        end
    end)

     
     
     
    local function GetPlayerBucks()
        local Bucks = 0
        
         
        pcall(function()
            local PlayerGui = game:GetService("Players").LocalPlayer:FindFirstChild("PlayerGui")
            if PlayerGui then
                local BucksApp = PlayerGui:FindFirstChild("BucksIndicatorApp")
                if BucksApp then
                    for _, Elem in ipairs(BucksApp:GetDescendants()) do
                        if Elem:IsA("TextLabel") and Elem.Text ~= "" then
                             
                            local CleanText = Elem.Text:gsub("%D", "")
                            local Num = tonumber(CleanText)
                            
                             
                            if Num and Num > 0 then
                                Bucks = Num
                                return 
                            end
                        end
                    end
                end
            end
        end)

         
        if Bucks == 0 then
            pcall(function()
                local ClientDataModule = (getgenv().DuskCore and getgenv().DuskCore.M and getgenv().DuskCore.M.ClientData) 
                    or require(game:GetService("ReplicatedStorage"):WaitForChild("Fsys")).load("ClientData")
                local PName = game:GetService("Players").LocalPlayer.Name
                local AllData = ClientDataModule.get_data()
                
                if AllData and AllData[PName] then
                    Bucks = AllData[PName].bucks or (AllData[PName].inventory and AllData[PName].inventory.bucks) or 0
                end
                
                if Bucks == 0 then
                    Bucks = ClientDataModule.get("bucks") or 0
                end
            end)
        end
        
        return tonumber(Bucks) or 0
    end

    local function GetHouseFurnitureStatus()
        local PlacedCount, maxLimit = 0, 4000
        pcall(function()
            local ClientDataModule = (getgenv().DuskCore and getgenv().DuskCore.M and getgenv().DuskCore.M.ClientData) or require(game:GetService("ReplicatedStorage"):WaitForChild("Fsys")).load("ClientData")
            local HouseInterior = ClientDataModule.get("house_interior")
            if HouseInterior and type(HouseInterior.furniture) == "table" then
                for _ in pairs(HouseInterior.furniture) do PlacedCount = PlacedCount + 1 end
            end
            local Fsys = require(game:GetService("ReplicatedStorage"):WaitForChild("Fsys")).load
            local SharedConstants = Fsys("SharedConstants")
            MaxLimit = (SharedConstants.housing_editor and SharedConstants.housing_editor.max_furniture) or SharedConstants.max_furniture_per_house or 4000
        end)
        return PlacedCount, MaxLimit, math.max(0, MaxLimit - PlacedCount)
    end

     
     
     
    local function ExecuteBuild(SavedHouse, ForceClearOld)
        local RawFurniture = SavedHouse.furniture or SavedHouse
        local ReplicatedStorage = game:GetService("ReplicatedStorage")
        local RunService = game:GetService("RunService")
        
        if ForceClearOld then
            local ClientDataModule = (getgenv().DuskCore and getgenv().DuskCore.M and getgenv().DuskCore.M.ClientData) or require(ReplicatedStorage:WaitForChild("Fsys")).load("ClientData")
            local Uniques = {}
            pcall(function()
                local HouseInterior = ClientDataModule.get("house_interior")
                if HouseInterior and type(HouseInterior.furniture) == "table" then
                    for UniqueId, _ in pairs(HouseInterior.furniture) do table.insert(Uniques, UniqueId) end
                end
            end)

            if #Uniques > 0 then
                Library:Notify("Selling", "Selling default furniture...", 3)
                local APIFolder = ReplicatedStorage:WaitForChild("API", 5)
                local SellRemote = (getgenv().DuskCore and getgenv().DuskCore.API and getgenv().DuskCore.API.SellFurniture) or (APIFolder and APIFolder:FindFirstChild("HousingAPI/SellFurniture"))
                
                if SellRemote then
                    local Chunk = {}
                    for I, UId in ipairs(Uniques) do
                        table.insert(Chunk, UId)
                        if #Chunk >= 50 or I == #Uniques then
                             
                            pcall(function() SellRemote:FireServer(true, Chunk, "sell") end)
                            Chunk = {}
                            task.wait(0.05)
                        end
                    end
                    task.wait(1)
                end
            end
        end

        local MICROSHIFTY = 0 
        
        local function LoadAmbiance(AmbianceData, ParticleData)
            local function ToColor3(RgbArray)
                if type(RgbArray) ~= "table" or #RgbArray < 3 then return Color3.new(1, 1, 1) end
                return Color3.new(RgbArray[1], RgbArray[2], RgbArray[3])
            end
            local CProps = (type(AmbianceData) == "table" and AmbianceData.custom_props) or {}
            local LData, CcData, SrData, atmData = CProps.Lighting or {}, CProps.ColorCorrectionEffect or {}, CProps.SunRaysEffect or {}, CProps.Atmosphere or {}
            local BKind = (type(AmbianceData) == "table" and AmbianceData.base_kind) or "day"
            local KKind = (type(AmbianceData) == "table" and AmbianceData.kind) or "day"
            local CustomParticles = { Rain = false, CherryBlossoms = false, Leaves = false, Snow = false }
            if type(ParticleData) == "table" then for K, V in pairs(ParticleData) do CustomParticles[K] = V end end

            local Args = {{
                base_kind = BKind, kind = KKind, priority = 3,
                custom_props = {
                    Lighting = { ClockTime = LData.ClockTime or 14, ExposureCompensation = LData.ExposureCompensation or 0, Ambient = ToColor3(LData.Ambient), OutdoorAmbient = ToColor3(LData.OutdoorAmbient), ColorShift_Top = ToColor3(LData.ColorShift_Top) },
                    ColorCorrectionEffect = { TintColor = ToColor3(CcData.TintColor), Saturation = CcData.Saturation or 0, Contrast = CcData.Contrast or 0 },
                    SunRaysEffect = { Intensity = SrData.Intensity or 0 },
                    Atmosphere = { Density = AtmData.Density or 0.3, Glare = AtmData.Glare or 0, Haze = AtmData.Haze or 0, Color = ToColor3(AtmData.Color) },
                    Custom = CustomParticles
                }
            }}
            local APIFolder = ReplicatedStorage:WaitForChild("API", 5)
            if APIFolder then
                local AmbianceRemote = APIFolder:FindFirstChild("AmbianceAPI/UpdateAmbiance")
                if AmbianceRemote then pcall(function() AmbianceRemote:FireServer(table.unpack(Args)) end) end
            end
        end
        LoadAmbiance(SavedHouse.ambiance, SavedHouse.particles)

        if CopyTextures and SavedHouse.textures then
            local APIFolder = ReplicatedStorage:WaitForChild("API", 5)
            if APIFolder then
                local BuyTextureRemote = APIFolder:FindFirstChild("HousingAPI/BuyTexture")
                if BuyTextureRemote then
                    for RoomName, TexData in pairs(SavedHouse.textures) do
                        if TexData.walls and TexData.walls ~= "" then pcall(function() BuyTextureRemote:FireServer(RoomName, "walls", TexData.walls) end); task.wait(getgenv().CurrentBuildDelay or 0) end
                        if TexData.floors and TexData.floors ~= "" then pcall(function() BuyTextureRemote:FireServer(RoomName, "floors", TexData.floors) end); task.wait(getgenv().CurrentBuildDelay or 0) end
                    end
                end
            end
        end

        local APIFolder = ReplicatedStorage:WaitForChild("API", 5)
        if not APIFolder then return false end

        local DownloadApi = APIFolder:FindFirstChild("DownloadsAPI/Download")
        local BuyFurnituresRemote = getgenv().DuskCore and getgenv().DuskCore.API and getgenv().DuskCore.API.BuyFurnitures or APIFolder:FindFirstChild("HousingAPI/BuyFurnitures")
        local PushFurnitureEvent = APIFolder:FindFirstChild("HousingAPI/PushFurnitureChanges")

        if not BuyFurnituresRemote then return false end

        if DownloadApi then
            local UniqueIDs = {}
            for _, Item in ipairs(RawFurniture) do 
                local ItemId = Item.id or Item.name or Item.kind
                if ItemId then UniqueIDs[ItemId] = true end 
            end
            for Id, _ in pairs(UniqueIDs) do task.spawn(function() pcall(function() DownloadApi:InvokeServer("Furniture", Id) end) end) end
            task.wait(0.5)
        end

        table.sort(RawFurniture, function(A, B)
            local YA = (type(A.cframe) == "table" and A.cframe[2]) or 0
            local YB = (type(B.cframe) == "table" and B.cframe[2]) or 0
            return YA < YB
        end)

        local PendingChanges, CurrentBatch, batchOriginalItems = {}, {}, {}

        for I, Item in ipairs(RawFurniture) do
            local ItemId = Item.id or Item.name or Item.kind
            if not ItemId then continue end

            local CData = Item.cframe
            if type(CData) ~= "table" or #CData ~= 12 then continue end

            local BaseCFrame = CFrame.new(table.unpack(CData))
            local LocalCFrame = BaseCFrame + Vector3.new(0, MICROSHIFTY, 0)
            
            local BuyProps = {cframe = LocalCFrame}
            if Item.colors and #Item.colors > 0 then
                local C3table = {}
                for _, C in ipairs(Item.colors) do table.insert(C3table, Color3.new(C[1], C[2], C[3])) end
                BuyProps.colors = C3table
            end
            
            table.insert(CurrentBatch, { kind = ItemId, properties = BuyProps })
            table.insert(BatchOriginalItems, { item = Item, localCFrame = LocalCFrame, buyProps = BuyProps })
            
            local BatchLimit = getgenv().CurrentBatchSize or 15
            local BuildDelay = getgenv().CurrentBuildDelay or 0

            if #CurrentBatch >= BatchLimit or I == #RawFurniture then
                local SuccessPurchase, attempts = false, 0
                repeat
                    Attempts = Attempts + 1
                    local BuildSuccess, response = pcall(function() return BuyFurnituresRemote:InvokeServer(CurrentBatch) end)
                    if BuildSuccess and type(Response) == "table" and Response.success then
                        SuccessPurchase = true
                        if Response.results then
                            for ResultIndex, Result in ipairs(Response.results) do
                                if Result.unique then
                                    local Orig = BatchOriginalItems[ResultIndex]
                                    local ChangeArgs = { unique = Result.unique, cframe = Orig.localCFrame }
                                    if Orig.item.scale and Orig.item.scale ~= 1 then ChangeArgs.scale = Orig.item.scale end
                                    if Orig.buyProps.colors then ChangeArgs.colors = Orig.buyProps.colors end
                                    table.insert(PendingChanges, ChangeArgs)
                                end
                            end
                        end
                    else
                        task.wait(0.5)
                    end
                until SuccessPurchase or Attempts >= 2

                if not SuccessPurchase and #CurrentBatch > 0 then
                    for BIndex, SingleItemReq in ipairs(CurrentBatch) do
                        local SBuildSuccess, sResponse = pcall(function() return BuyFurnituresRemote:InvokeServer({SingleItemReq}) end)
                        if SBuildSuccess and type(SResponse) == "table" and SResponse.success and SResponse.results then
                            local Orig = BatchOriginalItems[BIndex]
                            for _, Result in ipairs(SResponse.results) do
                                if Result.unique then
                                    local ChangeArgs = { unique = Result.unique, cframe = Orig.localCFrame }
                                    if Orig.item.scale and Orig.item.scale ~= 1 then ChangeArgs.scale = Orig.item.scale end
                                    if Orig.buyProps.colors then ChangeArgs.colors = Orig.buyProps.colors end
                                    table.insert(PendingChanges, ChangeArgs)
                                end
                            end
                        end
                        task.wait(0.02)
                    end
                end
                
                CurrentBatch, batchOriginalItems = {}, {}
                if BuildDelay > 0 then task.wait(BuildDelay) else RunService.Heartbeat:Wait() end
            end
        end
        
        if PushFurnitureEvent and #PendingChanges > 0 then
            local Chunk = {}
            for I, Change in ipairs(PendingChanges) do
                table.insert(Chunk, Change)
                if #Chunk >= 50 or I == #PendingChanges then
                    pcall(function() PushFurnitureEvent:FireServer(Chunk) end)
                    Chunk = {}
                    task.wait(math.max(0.1, getgenv().CurrentBuildDelay or 0.1)) 
                end
            end
        end
        return true
    end

     
     
     
    local FarmAmount = 1
    local ForceBuildMode = false 
    
    local BuildContainer = Library.Utils.Make("Frame", { Size = UDim2.new(1, -8, 0, 38), Position = UDim2.new(0.5, 0, 0, 0), AnchorPoint = Vector2.new(0.5, 0), BackgroundTransparency = 1, Parent = Tab.Page })
    local Glow = Library.Utils.Make("Frame", { Size = UDim2.new(1, 0, 1, 0), Position = UDim2.new(0.5, 0, 0.5, 0), AnchorPoint = Vector2.new(0.5, 0.5), BackgroundTransparency = 1, ZIndex = 1, Parent = BuildContainer })
    Library.Utils.Make("UICorner", { CornerRadius = UDim.new(0, 8), Parent = Glow })
    local GlowStroke = Library.Utils.Make("UIStroke", { Thickness = 4, Transparency = 0.85, Parent = Glow }, { Color = "Accent" })

    local BuildBtn = Library.Utils.Make("TextButton", { Text = "", Size = UDim2.new(1, 0, 1, 0), AutoButtonColor = false, ZIndex = 5, Parent = BuildContainer }, { BackgroundColor3 = "Section" }) 
    Library.Utils.Make("UICorner", { CornerRadius = UDim.new(0, 8), Parent = BuildBtn })
    local BuildText = Library.Utils.Make("TextLabel", { Text = "BUILD SELECTED HOUSE", Size = UDim2.new(1, 0, 1, 0), BackgroundTransparency = 1, Font = Enum.Font.GothamBold, TextSize = 13, ZIndex = 6, Parent = BuildBtn }, { TextColor3 = "Accent" }) 
    local EdgeStroke = Library.Utils.Make("UIStroke", { Thickness = 1.5, Transparency = 0.2, ApplyStrokeMode = Enum.ApplyStrokeMode.Border, Parent = BuildBtn }, { Color = "Accent" })
    local BuildScale = Instance.new("UIScale", BuildContainer)
    
    Library:Connect(BuildBtn.MouseEnter, function() Library.Utils.TBT(BuildBtn, 0.3, {BackgroundTransparency = 0.3}); Library.Utils.TBT(EdgeStroke, 0.3, {Transparency = 0}); Library.Utils.TBT(GlowStroke, 0.4, {Thickness = 12, Transparency = 0.6}, Enum.EasingStyle.Quint); Library.Utils.TBT(BuildScale, 0.3, {Scale = 1.05}, Enum.EasingStyle.Back, Enum.EasingDirection.Out) end)
    Library:Connect(BuildBtn.MouseLeave, function() Library.Utils.TBT(BuildBtn, 0.3, {BackgroundTransparency = 0}); Library.Utils.TBT(EdgeStroke, 0.3, {Transparency = 0.2}); Library.Utils.TBT(GlowStroke, 0.4, {Thickness = 4, Transparency = 0.85}, Enum.EasingStyle.Quint); Library.Utils.TBT(BuildScale, 0.3, {Scale = 1}, Enum.EasingStyle.Back, Enum.EasingDirection.Out) end)

    Tab:CreateSlider({
        Name = "Farm Target (Houses)",
        Min = 1, Max = 10, Default = 1, Flag = "Farm_Amount",
        Callback = function(Val) 
            FarmAmount = Val 
            ForceBuildMode = false
            if Val > 1 then
                BuildText.Text = "START MULTI-COPY (" .. val .. ")"
            else
                BuildText.Text = "BUILD SELECTED HOUSE"
                if Library.ThemeObjects[BuildText] then Library.ThemeObjects[BuildText] = { TextColor3 = "Accent" } end
                BuildText.TextColor3 = Library.CurrentTheme.Accent
            end
        end
    })

     
    Library:Connect(BuildBtn.MouseButton1Click, function()
        local T = Library.Utils.TBT(BuildScale, 0.1, {Scale = 0.95})
        T.Completed:Connect(function() Library.Utils.TBT(BuildScale, 0.2, {Scale = 1}, Enum.EasingStyle.Bounce) end)
            
        if not SelectedHouse or SelectedHouse == "" or SelectedHouse == "Select..." then return Library:Notify("Error", "Select a house schematic first!", 3, "rbxassetid://73186275216515", "rbxassetid://72958619361915") end
        local FilePath = FolderName .. "/" .. SelectedHouse .. ".json"
        if not isfile(FilePath) then return Library:Notify("Error", "File not found on disk!", 3, "rbxassetid://73186275216515", "rbxassetid://72958619361915") end

        task.spawn(function()
            local Success, fileData = pcall(function() return readfile(FilePath) end)
            if not Success then return end
            local HttpService = game:GetService("HttpService")
            local DecodeSuccess, savedHouse = pcall(function() return HttpService:JSONDecode(FileData) end)
            if not DecodeSuccess or not SavedHouse.furniture then return Library:Notify("Error", "File corrupted!", 3, "rbxassetid://73186275216515", "rbxassetid://72958619361915") end

            local HouseType = SavedHouse.house_type

             
            local TotalCost = 0
            local RawFurniture = SavedHouse.furniture or SavedHouse
            local NeededSlots = #RawFurniture
            if type(CachedFurnitureDB) == "table" then
                for _, Item in ipairs(RawFurniture) do
                    local DbInfo = CachedFurnitureDB[Item.id or Item.name or Item.kind]
                    if DbInfo and DbInfo.cost and not DbInfo.is_limited and not DbInfo.is_event then TotalCost = TotalCost + DbInfo.cost end
                end
            end

            local CurrentBucks = GetPlayerBucks()
            local Placed, MaxLimit, freeSlots = GetHouseFurnitureStatus()

             
             
             
            if FarmAmount > 1 then
                if not HouseType then return Library:Notify("Copy Error", "No house_type in JSON! Re-export the house first.", 5) end
                
                if CurrentBucks < (TotalCost * FarmAmount) then
                    return Library:Notify("Low Bucks!", string.format("Need at least $%d for %d houses.", TotalCost * FarmAmount, FarmAmount), 5)
                end

                local ReplicatedStorage = game:GetService("ReplicatedStorage")
                local API = ReplicatedStorage:WaitForChild("API", 5)
                local BuyRemote = API:FindFirstChild("HousingAPI/BuyHouseWithAddons")
                local RenameRemote = API:FindFirstChild("HousingAPI/RenameHouse")
                
                if not BuyRemote then return Library:Notify("Error", "API Remotes missing!", 3) end
                Library:Notify("Copy Started", string.format("Building %d houses...", FarmAmount), 4)
                
                local ClientDataModule = (getgenv().DuskCore and getgenv().DuskCore.M and getgenv().DuskCore.M.ClientData) or require(ReplicatedStorage:WaitForChild("Fsys")).load("ClientData")
                local LocalPlayer = game:GetService("Players").LocalPlayer

                for I = 1, FarmAmount do
                    Library:Notify("Copy Progress", string.format("House %d of %d", I, FarmAmount), 3)
                    
                    local BuySuccess = pcall(function() BuyRemote:InvokeServer(HouseType, {}, Color3.new(0.768, 0.156, 0.109)) end)
                    
                    if not BuySuccess then
                        Library:Notify("Copy Stopped", "Buy failed.", 5)
                        break
                    end
                    
                    pcall(function() API:FindFirstChild("LocationAPI/SetLocation"):FireServer("Neighborhood") end)
                    task.wait(2)
                    
                    local SetIdentity = (syn and syn.set_thread_identity) or setthreadidentity or setidentity
                    local GetIdentity = (syn and syn.get_thread_identity) or getthreadidentity or getidentity
                    local CurrentId = GetIdentity and GetIdentity() or 7

                    pcall(function()
                        if SetIdentity then pcall(SetIdentity, 2) end
                        local InteriorsM = require(ReplicatedStorage.ClientModules.Core.InteriorsM.InteriorsM)
                        InteriorsM.enter_smooth("housing", "MainDoor", { ["house_owner"] = LocalPlayer }) 
                    end)
                    if SetIdentity then pcall(SetIdentity, CurrentId) end
                    
                    local IsLoaded = false
                    local ActiveHouseId = nil
                    local WaitTime = 0
                    
                    repeat
                        task.wait(0.5)
                        WaitTime = WaitTime + 0.5
                        local NewInt = ClientDataModule.get("house_interior")
                        local CamY = workspace.CurrentCamera.CFrame.Position.Y
                        local Blueprint = workspace:FindFirstChild("HouseInteriors") and workspace.HouseInteriors:FindFirstChild("blueprint")
                        
                        if NewInt and NewInt.unique and CamY > 500 and CamY < 8500 and Blueprint and #Blueprint:GetChildren() > 0 then
                            ActiveHouseId = NewInt.unique
                            IsLoaded = true 
                        end
                    until IsLoaded or WaitTime > 25
                    
                    if not IsLoaded then continue end
                    
                    local SafeName = ""
                    if string.match(SelectedHouse, "^AdoptMeHouse_") then
                        SafeName = "DuskMultiCloner"
                    else
                        SafeName = SelectedHouse:gsub("%d", ""):gsub("_", " ")
                        if SafeName:match("^%s*$") then SafeName = "Dusk Custom House" end
                    end
                    
                    if RenameRemote then 
                        pcall(function() 
                            if ActiveHouseId then RenameRemote:FireServer(ActiveHouseId, SafeName) end
                            local CInt = ClientDataModule.get("house_interior")
                            if CInt then
                                for _, Val in pairs(CInt) do
                                    if type(Val) == "number" then RenameRemote:FireServer(Val, SafeName) end
                                end
                            end
                        end) 
                    end
                    
                    ExecuteBuild(SavedHouse, true)
                    task.wait(2)
                end
                
                Library:Notify("Copy Finished", "All tasks completed.", 5)
            
             
             
             
            else
                local IsHouseLoaded = workspace:FindFirstChild("HouseInteriors") and workspace.HouseInteriors:FindFirstChild("blueprint") and #workspace.HouseInteriors.blueprint:GetChildren() > 0
                local CamY = workspace.CurrentCamera.CFrame.Position.Y
                if CamY < 500 or CamY > 8500 or not IsHouseLoaded then return Library:Notify("Error", "House is not fully loaded or you are outside!", 4, "rbxassetid://73186275216515", "rbxassetid://72958619361915") end
                
                if NeededSlots > MaxLimit then return Library:Notify("Error", string.format("Needs %d slots, max is %d.", NeededSlots, MaxLimit), 5, "rbxassetid://73186275216515", "rbxassetid://72958619361915") end

                local HasOverlap = (Placed > 0)
                local IsPoor = (CurrentBucks < TotalCost)

                if (HasOverlap or IsPoor) and not ForceBuildMode then
                    ForceBuildMode = true
                    local WarnTitle = "Warning"
                    local WarnText = ""
                    if HasOverlap then BuildText.Text = "STORE OLD & BUILD"; warnText = string.format("House has %d items! ", Placed) else BuildText.Text = "BUILD ANYWAY" end
                    if IsPoor then WarnTitle = "Low Bucks!"; warnText = WarnText .. string.format("Cost: $%d (You have $%d)! ", TotalCost, CurrentBucks) end
                    WarnText = WarnText .. "CLICK AGAIN to force build."
                    
                    Library:Notify(WarnTitle, WarnText, 6, "rbxassetid://73186275216515", "rbxassetid://72958619361915")
                    task.delay(6, function() if ForceBuildMode then ForceBuildMode = false; BuildText.Text = "BUILD SELECTED HOUSE" end end)
                    return 
                end

                if ForceBuildMode then
                    ForceBuildMode = false
                    BuildText.Text = "BUILD SELECTED HOUSE"
                end
                
                Library:Notify("Builder", "Building " .. SelectedHouse .. "...", 3, "rbxassetid://91727514118912", "rbxassetid://72958619361915")
                local BuildDone = ExecuteBuild(SavedHouse, HasOverlap)
                if BuildDone then Library:Notify("Success", "House successfully built!", 3, "rbxassetid://18926561608", "rbxassetid://72958619361915") end
            end
        end)
    end)
     
     
     
    Tab:CreateDivider({ Text = "Configuration" })

    Tab:CreateToggle({
        Name = "Copy Textures (Wallpapers/Floors)",
        Description = "Copy wallpapers and floor materials.",
        Default = true,
        Flag = "Replicator_CopyTextures",
        Callback = function(State)
            CopyTextures = State
        end
    })

    local UserInputService = game:GetService("UserInputService")
    local TweenService = game:GetService("TweenService")

    local SliderContainer = Library.Utils.Make("Frame", { Size = UDim2.new(1, 0, 0, 70), Parent = Tab.Page }, { BackgroundColor3 = "Section" })
    Library.Utils.Make("UICorner", { CornerRadius = UDim.new(0, 10), Parent = SliderContainer })
    local ContainerStroke = Library.Utils.Make("UIStroke", { Thickness = 1, Parent = SliderContainer }, { Color = "Stroke" })

    Library.Utils.Make("TextLabel", { Text = "Build Speed", Size = UDim2.new(1, -100, 0, 20), Position = UDim2.new(0, 20, 0, 10), BackgroundTransparency = 1, Font = Enum.Font.GothamBold, TextSize = 16, TextXAlignment = Enum.TextXAlignment.Left, Parent = SliderContainer }, { TextColor3 = "Text" })
    Library.Utils.Make("TextLabel", { Text = "Drag left for Instant, right for Slow build.", Size = UDim2.new(1, -100, 0, 15), Position = UDim2.new(0, 20, 0, 30), BackgroundTransparency = 1, Font = Enum.Font.Gotham, TextSize = 13, TextXAlignment = Enum.TextXAlignment.Left, Parent = SliderContainer }, { TextColor3 = "SubText" })

    local PillFrame = Library.Utils.Make("Frame", { Size = UDim2.new(0, 76, 0, 24), AnchorPoint = Vector2.new(1, 0), Position = UDim2.new(1, -20, 0, 9), Parent = SliderContainer }, { BackgroundColor3 = "Sidebar" }) 
    Library.Utils.Make("UICorner", { CornerRadius = UDim.new(0, 6), Parent = PillFrame })
    local PillStroke = Library.Utils.Make("UIStroke", { Thickness = 1, Parent = PillFrame }, { Color = "Stroke" })

    local ValueText = Library.Utils.Make("TextLabel", { Size = UDim2.new(1, 0, 1, 0), BackgroundTransparency = 1, Font = Enum.Font.GothamMedium, TextSize = 13, ZIndex = 2, Parent = PillFrame }, { TextColor3 = "Text" })
    local PillScale = Instance.new("UIScale", PillFrame)

    local Track = Library.Utils.Make("TextButton", { Size = UDim2.new(1, -40, 0, 4), Position = UDim2.new(0, 20, 1, -12), AnchorPoint = Vector2.new(0, 1), Text = "", AutoButtonColor = false, Parent = SliderContainer }, { BackgroundColor3 = "Sidebar" })
    Library.Utils.Make("UICorner", { CornerRadius = UDim.new(1, 0), Parent = Track })

    local Fill = Library.Utils.Make("Frame", { Size = UDim2.new(0, 0, 1, 0), Parent = Track }, { BackgroundColor3 = "Accent" })
    Library.Utils.Make("UICorner", { CornerRadius = UDim.new(1, 0), Parent = Fill })

    local Knob = Library.Utils.Make("Frame", { Size = UDim2.new(0, 12, 0, 12), AnchorPoint = Vector2.new(0.5, 0.5), Position = UDim2.new(1, 0, 0.5, 0), Parent = Fill }, { BackgroundColor3 = "Text" })
    Library.Utils.Make("UICorner", { CornerRadius = UDim.new(1, 0), Parent = Knob })
    local KnobScale = Instance.new("UIScale", Knob)

    local MinSpeed, maxSpeed = 0, 200
    local CurrentVisualSpeed = 0 
    local IsDragging = false
    local CurrentMode = ""
    local SpeedFlag = "Main_BuildSpeed"
    
    getgenv().CurrentBatchSize = 15
    getgenv().CurrentBuildDelay = 0

    local function UpdateBuildSettings(Val)
        if Val == 0 then
            getgenv().CurrentBatchSize = 15
            getgenv().CurrentBuildDelay = 0
        elseif Val <= 80 then
            local Progress = Val / 80
            getgenv().CurrentBatchSize = math.clamp(math.floor(15 - (Progress * 14)), 1, 14)
            getgenv().CurrentBuildDelay = 0
        elseif Val <= 120 then
            getgenv().CurrentBatchSize = 1
            getgenv().CurrentBuildDelay = 0.02 
        else
            getgenv().CurrentBatchSize = 1
            local SlowProgress = (Val - 120) / 80
            getgenv().CurrentBuildDelay = 0.05 + (SlowProgress * 0.45)
        end
    end

    local function UpdateVisuals(Val)
        local Pct = math.clamp((Val - MinSpeed) / (MaxSpeed - MinSpeed), 0, 1)
        TweenService:Create(Fill, TweenInfo.new(0.15, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Size = UDim2.new(Pct, 0, 1, 0)}):Play()
        
        local NewMode = ""
        if Val == 0 then NewMode = "Instant"
        elseif Val <= 80 then NewMode = "Fast"
        elseif Val <= 120 then NewMode = "Normal"
        else NewMode = "Slow" end

        ValueText.Text = NewMode

        if NewMode ~= CurrentMode then
            CurrentMode = NewMode
            local TargetColor = (NewMode == "Instant") and Library.CurrentTheme.Accent or Library.CurrentTheme.Text
            local TargetStroke = (NewMode == "Instant") and Library.CurrentTheme.Accent or Library.CurrentTheme.Stroke
            
            if Library.ThemeObjects[ValueText] then Library.ThemeObjects[ValueText] = { TextColor3 = (NewMode == "Instant") and "Accent" or "Text" } end
            if Library.ThemeObjects[PillStroke] then Library.ThemeObjects[PillStroke] = { Color = (NewMode == "Instant") and "Accent" or "Stroke" } end
            
            TweenService:Create(ValueText, TweenInfo.new(0.2), {TextColor3 = TargetColor}):Play()
            TweenService:Create(PillStroke, TweenInfo.new(0.2), {Color = TargetStroke}):Play()
            
            PillScale.Scale = 0.85
            TweenService:Create(PillScale, TweenInfo.new(0.4, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {Scale = 1}):Play()
        end
    end

    local function UpdateDrag(Input)
        local AbsolutePos = Track.AbsolutePosition.X
        local absoluteSize = Track.AbsoluteSize.X
        local Pct = math.clamp((Input.Position.X - AbsolutePos) / absoluteSize, 0, 1)
        local SnappedValue = math.floor(MinSpeed + (MaxSpeed - MinSpeed) * Pct)
        
        if CurrentVisualSpeed ~= SnappedValue then
            CurrentVisualSpeed = SnappedValue
            UpdateVisuals(CurrentVisualSpeed)
            UpdateBuildSettings(CurrentVisualSpeed)
            Library.Flags[SpeedFlag] = CurrentVisualSpeed
        end
    end
    
    UpdateVisuals(CurrentVisualSpeed)
    UpdateBuildSettings(CurrentVisualSpeed)

    Library:Connect(Track.InputBegan, function(Input)
        if Input.UserInputType == Enum.UserInputType.MouseButton1 or Input.UserInputType == Enum.UserInputType.Touch then
            IsDragging = true
            TweenService:Create(KnobScale, TweenInfo.new(0.2, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {Scale = 1.35}):Play()
            UpdateDrag(Input)
        end
    end)

    Library:Connect(UserInputService.InputEnded, function(Input)
        if Input.UserInputType == Enum.UserInputType.MouseButton1 or Input.UserInputType == Enum.UserInputType.Touch then
            IsDragging = false
            TweenService:Create(KnobScale, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Scale = 1}):Play()
        end
    end)

    Library:Connect(UserInputService.InputChanged, function(Input)
        if IsDragging and (Input.UserInputType == Enum.UserInputType.MouseMovement or Input.UserInputType == Enum.UserInputType.Touch) then UpdateDrag(Input) end
    end)

    Library:Connect(SliderContainer.MouseEnter, function() TweenService:Create(ContainerStroke, TweenInfo.new(0.3), {Transparency = 0.5}):Play() end)
    Library:Connect(SliderContainer.MouseLeave, function() TweenService:Create(ContainerStroke, TweenInfo.new(0.3), {Transparency = 0}):Play() end)

    Library.ConfigUpdaters[SpeedFlag] = function(Val)
        CurrentVisualSpeed = math.clamp(tonumber(Val) or 0, MinSpeed, MaxSpeed)
        UpdateVisuals(CurrentVisualSpeed)
        UpdateBuildSettings(CurrentVisualSpeed)
        
        local Pct = math.clamp((CurrentVisualSpeed - MinSpeed) / (MaxSpeed - MinSpeed), 0, 1)
        Fill.Size = UDim2.new(Pct, 0, 1, 0)
    end
    
     
     
     
    Tab:CreateDivider({ Text = "Exploits" })

    local SuccessDoors, DoorsM = pcall(function()
        return require(ReplicatedStorage.ClientModules.Core.DoorsM.DoorsM)
    end)

    local AutoDoorToggle = false
    local LastTouchedDoor = nil
    local CachedDoors = {}

    local function CheckAndCache(Obj)
        if Obj.Name == "TouchToEnter" and Obj.Parent and Obj.Parent.Name == "WorkingParts" then
            CachedDoors[Obj] = Obj.Parent.Parent 
        end
    end

    task.spawn(function()
        local FoldersToSearch = {"Interiors", "HouseExteriors", "Properties"}
        for _, folderName in ipairs(FoldersToSearch) do
            local Folder = workspace:FindFirstChild(folderName)
            if Folder then
                for _, Obj in pairs(Folder:GetDescendants()) do
                    CheckAndCache(Obj)
                end
            end
        end
    end)

    local FoldersToSearch = {"Interiors", "HouseExteriors", "Properties"}
    for _, folderName in ipairs(FoldersToSearch) do
        local Folder = workspace:FindFirstChild(folderName)
        if Folder then
            table.insert(Library.Connections, Folder.DescendantAdded:Connect(function(Obj)
                CheckAndCache(Obj)
            end))
        end
    end

    Tab:CreateToggle({
        Name = "Auto Bypass Doors",
        Description = "Instant activation. Unlocks doors and does not drop FPS.",
        Default = false,
        Flag = "Exploit_AutoDoors",
        Callback = function(State)
            AutoDoorToggle = State
            
            if AutoDoorToggle then
                task.spawn(function()
                    while AutoDoorToggle do
                        if not getgenv().DuskShine_Core or getgenv().DS_StopExecution then 
                            AutoDoorToggle = false
                            break 
                        end
                        
                        local Char = LocalPlayer.Character
                        local Hrp = Char and Char:FindFirstChild("HumanoidRootPart")
                        
                        if Hrp then
                            local ClosestDoor = nil
                            local TouchPart = nil
                            local ShortestDist = 5
                            
                            for Tp, DoorModel in pairs(CachedDoors) do
                                if Tp and Tp.Parent and Tp:IsDescendantOf(workspace) then 
                                    local Dist = (Hrp.Position - Tp.Position).Magnitude
                                    if Dist < ShortestDist then
                                        ClosestDoor = DoorModel
                                        TouchPart = Tp
                                        ShortestDist = Dist
                                    end
                                else
                                    CachedDoors[Tp] = nil
                                end
                            end

                            if ClosestDoor and TouchPart then
                                if ClosestDoor ~= LastTouchedDoor then
                                    if SuccessDoors and DoorsM then
                                        local DoorObj = DoorsM.get_door(ClosestDoor)
                                        if DoorObj then
                                            DoorObj.is_open = true
                                            DoorObj.can_enter = true
                                            DoorObj.locked = false
                                            DoorObj.is_locked = false 
                                            
                                            if type(DoorObj.update) == "function" then
                                                pcall(function() DoorObj:update() end)
                                            end
                                        end
                                    end
                                    
                                    if firetouchinterest then
                                        firetouchinterest(Hrp, TouchPart, 0)
                                        task.wait(0.1)
                                        firetouchinterest(Hrp, TouchPart, 1)
                                    end
                                    
                                    LastTouchedDoor = ClosestDoor
                                    task.wait(4)  
                                end
                            else
                                LastTouchedDoor = nil
                            end
                        end
                        
                        task.wait(0.2)
                    end
                end)
            end
        end
    })
end
return Module
]===],
    ["/raw/modules/adm_cloner/manager"] = [===[local HttpService = game:GetService("HttpService")
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Module = {}
local CachedFurnitureDB = nil
task.spawn(function()
    pcall(function()
        local Fsys = require(game:GetService("ReplicatedStorage"):WaitForChild("Fsys"))
        CachedFurnitureDB = Fsys.load("FurnitureDB")
    end)
end)
Module.FolderName = "DuskAndShine_Houses"

 
 
 
function Module:InitFolder()
    if not isfolder(self.FolderName) then makefolder(self.FolderName) end
end

function Module:GetHouses()
    self:InitFolder()
    local Houses = {}
    local Success, files = pcall(function() return listfiles(self.FolderName) end)
    if not Success or type(Files) ~= "table" then return Houses end
    
    for _, Path in ipairs(Files) do
        local FileName = Path:match("([^/\\]+)%.[jJ][sS][oO][nN]$")
        if FileName then table.insert(Houses, FileName) end
    end
    return Houses
end

function Module:LoadHouse(name)
    local Path = self.FolderName .. "/" .. name .. ".json"
    if isfile(Path) then return HttpService:JSONDecode(readfile(Path)) end
    return nil
end

function Module:SaveHouse(name, Data)
    self:InitFolder()
    writefile(self.FolderName .. "/" .. name .. ".json", HttpService:JSONEncode(Data))
end

function Module:DeleteHouse(name)
    local Path = self.FolderName .. "/" .. name .. ".json"
    if isfile(Path) then delfile(Path) end
end

function Module:RenameHouse(Old, New)
    local OldPath = self.FolderName .. "/" .. old .. ".json"
    local NewPath = self.FolderName .. "/" .. new .. ".json"
    if isfile(OldPath) then
        writefile(NewPath, readfile(OldPath))
        delfile(OldPath)
        return true
    end
    return false
end

 
 
 
function Module:Init(Library, Window, Tab)
    self.Library = Library
    self.Tab = Tab
    self.ActiveDropdown = nil 
    self.ActiveFileMenu = nil
    self.ClickCatcher = nil 

     
     
     
    local HeaderPanel = Library.Utils.Make("Frame", { 
        Size = UDim2.new(1, 0, 0, 30), 
        BackgroundTransparency = 1, 
        Parent = Tab.Page 
    })
    
    Library.Utils.Make("TextLabel", {
        Text = '<b>FILE MANAGER:</b> <font color="#9696a0">House Schematics</font>',
        RichText = true, 
        Size = UDim2.new(1, -40, 1, 0), 
        Position = UDim2.new(0, 5, 0, 0),
        BackgroundTransparency = 1, 
        Font = Enum.Font.Gotham, 
        TextSize = 14, 
        TextXAlignment = Enum.TextXAlignment.Left, 
        Parent = HeaderPanel
    }, { TextColor3 = "Text" })

    local RefreshBtn = Library.Utils.Make("TextButton", {
        Size = UDim2.new(0, 26, 0, 26),
        Position = UDim2.new(1, -26, 0, 2),
        Text = "",
        AutoButtonColor = false,
        Parent = HeaderPanel
    }, { BackgroundColor3 = "Sidebar" })
    Library.Utils.Make("UICorner", { CornerRadius = UDim.new(0, 6), Parent = RefreshBtn })

    local RefStroke = Library.Utils.Make("UIStroke", { Thickness = 1, Transparency = 0.5, Parent = RefreshBtn }, { Color = "Stroke" })
    
    local RefIcon = Library.Utils.Make("ImageLabel", {
        Size = UDim2.new(0, 16, 0, 16),
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.new(0.5, 0, 0.5, 0),
        BackgroundTransparency = 1,
        Image = "rbxassetid://6723921202",
        Parent = RefreshBtn
    }, { ImageColor3 = "SubText" })
    
    local RefScale = Instance.new("UIScale", RefreshBtn)
    
    Library:Connect(RefreshBtn.MouseEnter, function() 
        Library.Utils.TBT(RefStroke, 0.2, {Transparency = 0})
        Library.Utils.TBT(RefreshBtn, 0.2, {BackgroundColor3 = Library.CurrentTheme.Section})
        Library.Utils.TBT(RefIcon, 0.2, {ImageColor3 = Library.CurrentTheme.Accent})
    end)
    Library:Connect(RefreshBtn.MouseLeave, function() 
        Library.Utils.TBT(RefStroke, 0.2, {Transparency = 0.5})
        Library.Utils.TBT(RefreshBtn, 0.2, {BackgroundColor3 = Library.CurrentTheme.Sidebar})
        Library.Utils.TBT(RefIcon, 0.2, {ImageColor3 = Library.CurrentTheme.SubText})
    end)
    
    Library:Connect(RefreshBtn.MouseButton1Click, function()
        local T = Library.Utils.TBT(RefScale, 0.1, {Scale = 0.9})
        T.Completed:Connect(function() Library.Utils.TBT(RefScale, 0.2, {Scale = 1}, Enum.EasingStyle.Bounce) end)
        Library.Utils.TBT(RefIcon, 0.5, {Rotation = 360}); task.delay(0.5, function() RefIcon.Rotation = 0 end)
        
       self:RefreshList()
    end)

    local TopDivider = Library.Utils.Make("Frame", {
        Size = UDim2.new(1, 0, 0, 1),
        BorderSizePixel = 0,
        Parent = Tab.Page
    }, { BackgroundColor3 = "Text" })
    
    local DivGrad = Instance.new("UIGradient", TopDivider)
    DivGrad.Transparency = NumberSequence.new({
        NumberSequenceKeypoint.new(0, 1),
        NumberSequenceKeypoint.new(0.5, 0.8),
        NumberSequenceKeypoint.new(1, 1)
    })

     
    self.ListContainer = Library.Utils.Make("Frame", { Size = UDim2.new(1, 0, 0, 0), AutomaticSize = Enum.AutomaticSize.Y, BackgroundTransparency = 1, Parent = Tab.Page })
    Library.Utils.Make("UIListLayout", { Padding = UDim.new(0, 8), SortOrder = Enum.SortOrder.LayoutOrder, Parent = self.ListContainer })

     
     
     
    local ParseContainer = Library.Utils.Make("Frame", {
        Size = UDim2.new(1, -8, 0, 38),  
        Position = UDim2.new(0.5, 0, 0, 0),
        AnchorPoint = Vector2.new(0.5, 0),
        BackgroundTransparency = 1,
        LayoutOrder = -1, 
        ZIndex = 50,  
        Parent = self.ListContainer
    })

     
    local ParseGlow = Library.Utils.Make("Frame", { 
        Size = UDim2.new(1, 0, 1, 0), 
        BackgroundTransparency = 1, 
        ZIndex = 1, 
        Parent = ParseContainer 
    })
    Library.Utils.Make("UICorner", { CornerRadius = UDim.new(0, 8), Parent = ParseGlow })
    local ParseGlowStroke = Library.Utils.Make("UIStroke", { Thickness = 4, Transparency = 0.85, Parent = ParseGlow }, { Color = "Accent" })

    local ParseBtn = Library.Utils.Make("TextButton", {
        Text = "", 
        Size = UDim2.new(1, 0, 1, 0),
        AutoButtonColor = false,
        ZIndex = 5,
        Parent = ParseContainer 
    }, { BackgroundColor3 = "Section" }) 
    Library.Utils.Make("UICorner", { CornerRadius = UDim.new(0, 8), Parent = ParseBtn })

    local ParseText = Library.Utils.Make("TextLabel", {
        Text = "EXPORT CURRENT INTERIOR",
        Size = UDim2.new(1, 0, 1, 0),
        BackgroundTransparency = 1,
        Font = Enum.Font.GothamBold,
        TextSize = 13,
        ZIndex = 6,
        Parent = ParseBtn
    }, { TextColor3 = "Accent" }) 

    local ParseEdgeStroke = Library.Utils.Make("UIStroke", { Thickness = 1.5, Transparency = 0.2, ApplyStrokeMode = Enum.ApplyStrokeMode.Border, Parent = ParseBtn }, { Color = "Accent" })
    local ParseScale = Instance.new("UIScale", ParseContainer)

    Library:Connect(ParseBtn.MouseEnter, function() 
        Library.Utils.TBT(ParseBtn, 0.3, {BackgroundTransparency = 0.3}) 
        Library.Utils.TBT(ParseEdgeStroke, 0.3, {Transparency = 0}) 
        Library.Utils.TBT(ParseGlowStroke, 0.4, {Thickness = 12, Transparency = 0.6}, Enum.EasingStyle.Quint) 
        Library.Utils.TBT(ParseScale, 0.3, {Scale = 1.03}, Enum.EasingStyle.Back, Enum.EasingDirection.Out) 
    end)
    Library:Connect(ParseBtn.MouseLeave, function() 
        Library.Utils.TBT(ParseBtn, 0.3, {BackgroundTransparency = 0}) 
        Library.Utils.TBT(ParseEdgeStroke, 0.3, {Transparency = 0.2})
        Library.Utils.TBT(ParseGlowStroke, 0.4, {Thickness = 4, Transparency = 0.85}, Enum.EasingStyle.Quint)
        Library.Utils.TBT(ParseScale, 0.3, {Scale = 1}, Enum.EasingStyle.Back, Enum.EasingDirection.Out)
    end)
    
    Library:Connect(ParseBtn.MouseButton1Click, function()
            local T = Library.Utils.TBT(ParseScale, 0.1, {Scale = 0.95})
            T.Completed:Connect(function() Library.Utils.TBT(ParseScale, 0.2, {Scale = 1}, Enum.EasingStyle.Bounce) end)
            
            task.spawn(function()
                 
                local CamY = workspace.CurrentCamera.CFrame.Position.Y
                local Blueprint = workspace:FindFirstChild("HouseInteriors") and workspace.HouseInteriors:FindFirstChild("blueprint")
                
                 
                 
                if CamY < 500 or CamY > 8500 or not Blueprint or #Blueprint:GetChildren() == 0 then
                    return Library:Notify("Error", "Go inside the house! You can't scan outside.", 3, "rbxassetid://73186275216515", "rbxassetid://72958619361915")
                end

            local Data = getgenv().DuskCore.M.ClientData.get_data()
            local TARGETOWNER = Players.LocalPlayer.Name 
            local TargetData = Data[TARGETOWNER]
            
            if not TargetData or not TargetData.house_interior or type(TargetData.house_interior.furniture) ~= "table" then
                return Library:Notify("Error", "Interior data not found or empty!", 3, "rbxassetid://73186275216515", "rbxassetid://72958619361915")
            end
            
            local RawFurniture = TargetData.house_interior.furniture
            local ParsedFurniture = {}
            local WarnedItems = {}
            local WarnedTotal = 0
            
             
            local DbIsValid = type(CachedFurnitureDB) == "table"

            for UniqueId, ItemData in pairs(RawFurniture) do
                local ItemName = ItemData.id
                local IsSuspicious = false
                local WarningReason = ""
                
                 
                if DbIsValid then
                    local DbInfo = CachedFurnitureDB[ItemData.id]
                    if DbInfo then
                        ItemName = DbInfo.name or ItemData.id
                        if DbInfo.is_limited or DbInfo.is_event then
                            IsSuspicious = true
                            WarningReason = "Limited/Event"
                        end
                    else
                         
                        IsSuspicious = true
                        WarningReason = "Not in FurnitureDB"
                    end
                end
                
                 
                if IsSuspicious then
                    local LogKey = ItemName .. " [" .. warningReason .. "]"
                    WarnedItems[LogKey] = (WarnedItems[LogKey] or 0) + 1
                    WarnedTotal = WarnedTotal + 1
                end
                
                 
                 
                local FormattedCFrame = typeof(ItemData.cframe) == "CFrame" and {ItemData.cframe:GetComponents()} or ItemData.cframe
            
                 
                local FormattedColors = {}
                if type(ItemData.colors) == "table" then
                    for I, color in ipairs(ItemData.colors) do
                        if typeof(color) == "Color3" then
                            FormattedColors[I] = {color.R, color.G, color.B}
                        elseif type(color) == "table" then
                            FormattedColors[I] = color
                        end
                    end
                end
            
                 
                ParsedFurniture[#ParsedFurniture + 1] = {
                    id = ItemData.id,
                    cframe = FormattedCFrame,
                    scale = ItemData.scale or 1,
                    colors = FormattedColors
                }
            end

             
            local ParsedTextures = {}
            local RawTextures = TargetData.house_interior.textures or {}
            
            for RoomName, RoomData in pairs(RawTextures) do
                ParsedTextures[RoomName] = {
                    floors = RoomData.floors or "",
                    walls = RoomData.walls or ""
                }
            end

             
            local function FormatAmbianceColors(Tbl)
                local Formatted = {}
                for K, V in pairs(Tbl) do
                    if typeof(V) == "Color3" then
                        Formatted[K] = {V.R, V.G, V.B}
                    elseif type(V) == "table" then
                        Formatted[K] = FormatAmbianceColors(V)
                    else
                        Formatted[K] = V
                    end
                end
                return Formatted
            end

            local RawAmbiance = TargetData.house_interior.ambiance or {}
            local ParsedAmbiance = FormatAmbianceColors(RawAmbiance) 
            
            local ParsedParticles = {}
            if RawAmbiance.custom_props and type(RawAmbiance.custom_props.Custom) == "table" then
                for K, V in pairs(RawAmbiance.custom_props.Custom) do
                    ParsedParticles[K] = V
                end
            end
            
             
            local SaveData = {
                house_type = TargetData.house_interior.building_type,
                furniture = ParsedFurniture,
                textures = ParsedTextures,  
                ambiance = ParsedAmbiance,
                particles = ParsedParticles 
            }
            
            local NewFileName = "AdoptMeHouse_" .. os.date("%H%M%S")
            self:SaveHouse(NewFileName, SaveData)
            
            if getgenv().AutoSelectNewHouse then
                getgenv().AutoSelectNewHouse(NewFileName)
            end
            self:RefreshList()
            
             
            if WarnedTotal > 0 then
                warn("======== [HOUSE PARSER: WARNING ITEMS] ========")
                warn("Exported ALL items, but found items that might not build:")
                local NotifyText = "Exported ALL, but " .. warnedTotal .. " items might be unbuyable:\n"
                local I = 0
                
                for LogKey, Amt in pairs(WarnedItems) do
                    warn(" - " .. logKey .. " (x" .. amt .. ")")
                    if I < 3 then
                        NotifyText = NotifyText .. logKey .. " x" .. amt .. "\n"
                    elseif I == 3 then
                        NotifyText = NotifyText .. "...and more (Check F9)"
                    end
                    I = I + 1
                end
                warn("===============================================")
                
                 
                Library:Notify("Exported With Warnings", NotifyText, 8, "rbxassetid://11401835376", "rbxassetid://72958619361915")
            else
                Library:Notify("Success!", "House exported flawlessly as " .. newFileName, 3, "rbxassetid://91727514118912", "rbxassetid://72958619361915")
            end
        end)
    end)

 
    Tab:CreateDivider({
        Text = "HOUSE SCHEMATICS",
        Parent = self.ListContainer,
        LayoutOrder = 0  
    })
    self:RefreshList()
end

function Module:RefreshList()
    if self.ActiveDropdown then 
        self.ActiveDropdown:Destroy()
        self.ActiveDropdown = nil 
        self.ActiveFileMenu = nil
    end
    if self.ClickCatcher then
        self.ClickCatcher:Destroy()
        self.ClickCatcher = nil
    end

    for _, Child in ipairs(self.ListContainer:GetChildren()) do
         
        if (Child:IsA("TextButton") or Child:IsA("TextLabel")) and Child.LayoutOrder ~= -1 then 
            Child:Destroy() 
        end
    end

    local Houses = self:GetHouses()

    if #Houses == 0 then
        self.Library.Utils.Make("TextLabel", { 
            Text = "NO FILES FOUND", 
            Size = UDim2.new(1, 0, 0, 100),
            BackgroundTransparency = 1, 
            Font = Enum.Font.GothamBold, 
            TextSize = 18, 
            TextXAlignment = Enum.TextXAlignment.Center, 
            TextYAlignment = Enum.TextYAlignment.Center,
            Parent = self.ListContainer 
        }, { TextColor3 = "SubText" }) 
        return
    end

    for _, HouseName in ipairs(Houses) do
        self:CreateFileCard(HouseName)
    end
end


 
 
 
function Module:CreateFileCard(FileName)
    local Library = self.Library

    local Card = Library.Utils.Make("TextButton", { Text = "", Size = UDim2.new(1, 0, 0, 56), AutoButtonColor = false, BackgroundTransparency = 0, ClipsDescendants = false, Parent = self.ListContainer }, { BackgroundColor3 = "Section" })
    Library.Utils.Make("UICorner", { CornerRadius = UDim.new(0, 10), Parent = Card })
    local GlowStroke = Library.Utils.Make("UIStroke", { Thickness = 1, Transparency = 0.8, Parent = Card }, { Color = "Stroke" })

    local FileIcon = Library.Utils.Make("ImageLabel", { Size = UDim2.new(0, 24, 0, 24), Position = UDim2.new(0, 14, 0.5, 0), AnchorPoint = Vector2.new(0, 0.5), BackgroundTransparency = 1, Image = "rbxassetid://105856032975609", Parent = Card }, { ImageColor3 = "Text" })

    local TitleLbl = Library.Utils.Make("TextLabel", { Text = FileName, Size = UDim2.new(1, -110, 0, 20), Position = UDim2.new(0, 54, 0.5, -14), BackgroundTransparency = 1, Font = Enum.Font.GothamBold, TextSize = 14, TextTruncate = Enum.TextTruncate.AtEnd, TextXAlignment = Enum.TextXAlignment.Left, Parent = Card }, { TextColor3 = "Text" })
    
    local RenameBox = Library.Utils.Make("TextBox", {
        Text = FileName, Size = UDim2.new(1, -110, 0, 20), Position = UDim2.new(0, 54, 0.5, -14),
        BackgroundTransparency = 0.5, BackgroundColor3 = Color3.fromRGB(0,0,0),
        Font = Enum.Font.GothamBold, TextSize = 14, TextXAlignment = Enum.TextXAlignment.Left,
        ClipsDescendants = true, ClearTextOnFocus = false, Visible = false, Parent = Card
    }, { TextColor3 = "Accent" })
    Library.Utils.Make("UICorner", { CornerRadius = UDim.new(0, 4), Parent = RenameBox })

    local LastValidText = FileName
    RenameBox:GetPropertyChangedSignal("Text"):Connect(function()
        local CurrentText = RenameBox.Text
        local FilteredText = CurrentText:gsub('[<>:"/\\|?*!@#$%%^&()+=%[%]{};\'.,`~№]', "")
        if CurrentText ~= FilteredText then RenameBox.Text = FilteredText return end
        local Length = utf8.len(FilteredText)
        if not Length or Length > 28 then RenameBox.Text = LastValidText else LastValidText = FilteredText end
    end)
    
     
    local RawTime = FileName:match("_(%d%d)(%d%d)(%d%d)$")
    local TimeStr = os.date("%H:%M:%S")
    if RawTime then
        local H, m, s = FileName:match("_(%d%d)(%d%d)(%d%d)$")
        TimeStr = H .. ":" .. m .. ":" .. s
    end

    Library.Utils.Make("TextLabel", { Text = "Last-saved " .. timeStr, Size = UDim2.new(1, -110, 0, 15), Position = UDim2.new(0, 54, 0.5, 4), BackgroundTransparency = 1, Font = Enum.Font.GothamMedium, TextSize = 11, TextXAlignment = Enum.TextXAlignment.Left, Parent = Card }, { TextColor3 = "SubText" })
   
    local OptionsBtn = Library.Utils.Make("TextButton", { Text = "•••", Size = UDim2.new(0, 34, 0, 24), AnchorPoint = Vector2.new(1, 0.5), Position = UDim2.new(1, -12, 0.5, 0), Font = Enum.Font.GothamBold, TextSize = 14, AutoButtonColor = false, Parent = Card }, { BackgroundColor3 = "Sidebar", TextColor3 = "SubText" })
    Library.Utils.Make("UICorner", { CornerRadius = UDim.new(0, 6), Parent = OptionsBtn })
    local OptStroke = Library.Utils.Make("UIStroke", { Thickness = 1, Transparency = 0.5, Parent = OptionsBtn }, { Color = "Stroke" })

    Library:Connect(Card.MouseEnter, function() Library.Utils.TBT(GlowStroke, 0.2, {Transparency = 0, Thickness = 2}, Enum.EasingStyle.Quint); Library.Utils.TBT(Card, 0.2, {BackgroundTransparency = 0.2}, Enum.EasingStyle.Quint) end)
    Library:Connect(Card.MouseLeave, function() Library.Utils.TBT(GlowStroke, 0.2, {Transparency = 0.8, Thickness = 1}, Enum.EasingStyle.Quint); Library.Utils.TBT(Card, 0.2, {BackgroundTransparency = 0}, Enum.EasingStyle.Quint) end)
    Library:Connect(OptionsBtn.MouseEnter, function() Library.Utils.TBT(OptionsBtn, 0.15, {BackgroundColor3 = Library.CurrentTheme.Section, TextColor3 = Library.CurrentTheme.Accent}); Library.Utils.TBT(OptStroke, 0.15, {Transparency = 0}) end)
    Library:Connect(OptionsBtn.MouseLeave, function() Library.Utils.TBT(OptionsBtn, 0.15, {BackgroundColor3 = Library.CurrentTheme.Sidebar, TextColor3 = Library.CurrentTheme.SubText}); Library.Utils.TBT(OptStroke, 0.15, {Transparency = 0.5}) end)

    local function CloseDropdown()
        if self.ActiveDropdown then
            local Drop = self.ActiveDropdown
            local CloseTween = Library.Utils.TBT(Drop:FindFirstChild("UIScale"), 0.15, {Scale = 0.8})
            Library.Utils.TBT(Drop, 0.15, {BackgroundTransparency = 1})
            
            if Drop:FindFirstChild("DropShadow") then Library.Utils.TBT(Drop.DropShadow, 0.15, {ImageTransparency = 1}) end
            if Drop:FindFirstChild("DropStroke") then Library.Utils.TBT(Drop.DropStroke, 0.15, {Transparency = 1}) end
            
            for _, Child in ipairs(Drop.Content:GetChildren()) do
                if Child:IsA("TextButton") then 
                    Library.Utils.TBT(Child, 0.15, {BackgroundTransparency = 1})
                    for _, D in ipairs(Child:GetDescendants()) do
                        if D:IsA("TextLabel") then Library.Utils.TBT(D, 0.15, {TextTransparency = 1}) end
                        if D:IsA("ImageLabel") then Library.Utils.TBT(D, 0.15, {ImageTransparency = 1}) end
                    end
                end
            end
            
            CloseTween.Completed:Connect(function()
                Drop:Destroy()
            end)
            self.ActiveDropdown = nil
            self.ActiveFileMenu = nil
        end
        if self.ClickCatcher then
            self.ClickCatcher:Destroy()
            self.ClickCatcher = nil
        end
    end

    local function CreateDropdown()
        if self.ActiveDropdown then CloseDropdown() end

        local MainGUI = Card:FindFirstAncestorWhichIsA("ScreenGui")

        self.ClickCatcher = Library.Utils.Make("TextButton", {
            Size = UDim2.new(10, 0, 10, 0),
            Position = UDim2.new(0.5, 0, 0.5, 0),
            AnchorPoint = Vector2.new(0.5, 0.5),
            BackgroundTransparency = 1,
            Text = "",
            ZIndex = 998,
            Parent = MainGUI or Card
        })
        Library:Connect(self.ClickCatcher.MouseButton1Click, CloseDropdown)

         
        local DropHeight = 185
        local page = self.Tab.Page
        local PageBottom = page.AbsolutePosition.Y + page.AbsoluteSize.Y
        local DropBottom = Card.AbsolutePosition.Y + 30 + DropHeight
        
         
        local OpenUpwards = DropBottom > (PageBottom - 10)
        local TargetAnchor = OpenUpwards and Vector2.new(0, 1) or Vector2.new(0, 0)
        local TargetY = OpenUpwards and -5 or 30

        local Dropdown = Library.Utils.Make("Frame", { 
            Size = UDim2.new(0, 160, 0, DropHeight),
            BackgroundTransparency = 1,
            ZIndex = 1000, 
            AnchorPoint = TargetAnchor,
            Position = UDim2.new(1, -172, 0, TargetY), 
            Parent = Card 
        }, { BackgroundColor3 = "Sidebar" })
         
        
        Library.Utils.Make("UICorner", { CornerRadius = UDim.new(0, 8), Parent = Dropdown })
        Library.Utils.Make("UIStroke", { Name = "DropStroke", Thickness = 1, Transparency = 1, Parent = Dropdown }, { Color = "Stroke" })

        local Shadow = Library.Utils.Make("ImageLabel", {
            Name = "DropShadow",
            Size = UDim2.new(1, 40, 1, 40),
            Position = UDim2.new(0.5, 0, 0.5, 4),
            AnchorPoint = Vector2.new(0.5, 0.5),
            BackgroundTransparency = 1,
            Image = "rbxassetid://13192800046",
            ImageColor3 = Color3.new(0, 0, 0),
            ImageTransparency = 1,
            ScaleType = Enum.ScaleType.Slice,
            SliceCenter = Rect.new(20, 20, 280, 280),
            ZIndex = 999, 
            Parent = Dropdown
        })

        local Content = Library.Utils.Make("Frame", {
            Name = "Content",
            Size = UDim2.new(1, 0, 1, 0),
            BackgroundTransparency = 1,
            ZIndex = 1001,
            Parent = Dropdown
        })
        Library.Utils.Make("UIPadding", { PaddingTop = UDim.new(0, 6), PaddingBottom = UDim.new(0, 6), PaddingLeft = UDim.new(0, 6), PaddingRight = UDim.new(0, 6), Parent = Content })
        Library.Utils.Make("UIListLayout", { SortOrder = Enum.SortOrder.LayoutOrder, Padding = UDim.new(0, 4), Parent = Content })
        
        self.ActiveDropdown = Dropdown
        self.ActiveFileMenu = FileName

        local DropScale = Instance.new("UIScale", Dropdown)
        DropScale.Scale = 0.8
        
        Library.Utils.TBT(DropScale, 0.25, {Scale = 1}, Enum.EasingStyle.Back, Enum.EasingDirection.Out)
        Library.Utils.TBT(Dropdown, 0.15, {BackgroundTransparency = 0})
        Library.Utils.TBT(Dropdown:FindFirstChild("DropStroke"), 0.15, {Transparency = 0.2})
        Library.Utils.TBT(Shadow, 0.2, {ImageTransparency = 0.6})
        
        local function AddAction(Title, IconId, BaseColorKey, HoverColorKey, IsDelete, Callback)
            local Btn = Library.Utils.Make("TextButton", { 
                Text = "", Size = UDim2.new(1, 0, 0, 29), BackgroundTransparency = 1, ZIndex = 1002, AutoButtonColor = false, Parent = Content 
            })
            Library.Utils.Make("UICorner", { CornerRadius = UDim.new(0, 6), Parent = Btn })
            local IsPriceIcon = (Title == "Price Viewer")
            local Icon, PriceRingStroke, PriceDollarTxt

            if IsPriceIcon then
                Icon = Library.Utils.Make("Frame", {
                    Size = UDim2.new(0, 15, 0, 15), AnchorPoint = Vector2.new(0.5, 0.5), Position = UDim2.new(0, 16, 0.5, 0),
                    BackgroundTransparency = 1, ZIndex = 1003, Parent = Btn
                })
                Library.Utils.Make("UICorner", { CornerRadius = UDim.new(1, 0), Parent = Icon })
                PriceRingStroke = Library.Utils.Make("UIStroke", {
                    Thickness = 1.6, Transparency = 1, Parent = Icon
                }, { Color = BaseColorKey })

                PriceDollarTxt = Library.Utils.Make("TextLabel", {
                    Text = "$", Size = UDim2.new(1, 0, 1, 0), Position = UDim2.new(0, 0, 0, 0),
                    BackgroundTransparency = 1, Font = Enum.Font.GothamBold, TextSize = 11, TextTransparency = 1,
                    ZIndex = 1004, Parent = Icon
                }, { TextColor3 = BaseColorKey })

                Library.Utils.TBT(PriceRingStroke, 0.15, {Transparency = 0})
                Library.Utils.TBT(PriceDollarTxt, 0.15, {TextTransparency = 0})
            else
                Icon = Library.Utils.Make("ImageLabel", {
                    Size = UDim2.new(0, 16, 0, 16), AnchorPoint = Vector2.new(0.5, 0.5), Position = UDim2.new(0, 16, 0.5, 0),
                    BackgroundTransparency = 1, Image = IconId, ImageTransparency = 1, ZIndex = 1003, Parent = Btn
                }, { ImageColor3 = BaseColorKey })
                Library.Utils.TBT(Icon, 0.15, {ImageTransparency = 0})
            end

            local TextLbl = Library.Utils.Make("TextLabel", {
                Text = Title, Size = UDim2.new(1, -34, 1, 0), Position = UDim2.new(0, 34, 0, 0),
                BackgroundTransparency = 1, Font = Enum.Font.GothamMedium, TextSize = 13, TextTransparency = 1,
                TextXAlignment = Enum.TextXAlignment.Left, ZIndex = 1003, Parent = Btn
            }, { TextColor3 = BaseColorKey })

            Library.Utils.TBT(TextLbl, 0.15, {TextTransparency = 0})

            local IsConfirming = false
            
            Library:Connect(Btn.MouseEnter, function() 
                if IsDelete then
                    Library.Utils.TBT(Btn, 0.15, {BackgroundTransparency = 0.85}, Enum.EasingStyle.Quint)
                else
                    Library.Utils.TBT(Btn, 0.15, {BackgroundTransparency = 0.85}, Enum.EasingStyle.Quint) 
                    Library.Utils.TBT(TextLbl, 0.15, {TextColor3 = Library.CurrentTheme[HoverColorKey]}, Enum.EasingStyle.Quint)
                    if IsPriceIcon then
                        Library.Utils.TBT(PriceRingStroke, 0.15, {Color = Library.CurrentTheme[HoverColorKey]}, Enum.EasingStyle.Quint)
                        Library.Utils.TBT(PriceDollarTxt, 0.15, {TextColor3 = Library.CurrentTheme[HoverColorKey]}, Enum.EasingStyle.Quint)
                    else
                        Library.Utils.TBT(Icon, 0.15, {ImageColor3 = Library.CurrentTheme[HoverColorKey]}, Enum.EasingStyle.Quint)
                    end
                end
            end)
            
            Library:Connect(Btn.MouseLeave, function() 
                Library.Utils.TBT(Btn, 0.15, {BackgroundTransparency = 1}, Enum.EasingStyle.Quint) 
                if not IsDelete then
                    Library.Utils.TBT(TextLbl, 0.15, {TextColor3 = Library.CurrentTheme[BaseColorKey]}, Enum.EasingStyle.Quint)
                    if IsPriceIcon then
                        Library.Utils.TBT(PriceRingStroke, 0.15, {Color = Library.CurrentTheme[BaseColorKey]}, Enum.EasingStyle.Quint)
                        Library.Utils.TBT(PriceDollarTxt, 0.15, {TextColor3 = Library.CurrentTheme[BaseColorKey]}, Enum.EasingStyle.Quint)
                    else
                        Library.Utils.TBT(Icon, 0.15, {ImageColor3 = Library.CurrentTheme[BaseColorKey]}, Enum.EasingStyle.Quint)
                    end
                end
            end)

            Library:Connect(Btn.MouseButton1Click, function() 
                if IsDelete then
                    if not IsConfirming then
                        IsConfirming = true
                        TextLbl.Text = "Are you sure?"
                        task.delay(3, function()
                            if IsConfirming and TextLbl then
                                IsConfirming = false
                                TextLbl.Text = Title
                            end
                        end)
                        return
                    end
                end
                pcall(Callback)
                CloseDropdown()
            end)
        end

        AddAction("Rename", "rbxassetid://77580518418895", "SubText", "Accent", false, function() TitleLbl.Visible = false; RenameBox.Visible = true; RenameBox.Text = FileName; RenameBox:CaptureFocus() end)
        AddAction("Duplicate", "rbxassetid://91403080584860", "SubText", "Accent", false, function() local Data = self:LoadHouse(FileName); if Data then self:SaveHouse(FileName .. "_copy", Data); self:RefreshList(); Library:Notify("File Manager", "Duplicated: " .. fileName, 3, "rbxassetid://91727514118912", "rbxassetid://72958619361915" ) end end)
        AddAction("Copy Code", "rbxassetid://76443890191204", "SubText", "Accent", false, function() local Data = self:LoadHouse(FileName); if Data and setclipboard then setclipboard(HttpService:JSONEncode(Data)); Library:Notify("Copied", "JSON code copied to clipboard!", 3, "rbxassetid://91727514118912", "rbxassetid://72958619361915") end end)

        AddAction("Price Viewer", "rbxassetid://126904798120349", "SubText", "Accent", false, function()
            local Data = self:LoadHouse(FileName)
            if not Data or type(Data.furniture) ~= "table" then
                return Library:Notify("Error", "Failed to read house data!", 3, "rbxassetid://73186275216515", "rbxassetid://72958619361915")
            end

            local TotalCost = 0
            local TotalItems = #Data.furniture
            local UnbuyableCount = 0
            local UnbuyableNames = {}
            local DbIsValid = type(CachedFurnitureDB) == "table"

            for _, Item in ipairs(Data.furniture) do
                local DbInfo = DbIsValid and CachedFurnitureDB[Item.id]
                if DbInfo and DbInfo.cost ~= nil and not DbInfo.is_limited and not DbInfo.is_event then
                    TotalCost = TotalCost + DbInfo.cost
                else
                    UnbuyableCount = UnbuyableCount + 1
                    local DisplayName = (DbInfo and DbInfo.name) and (DbInfo.name .. " [" .. item.id .. "]") or tostring(Item.id)
                    UnbuyableNames[DisplayName] = (UnbuyableNames[DisplayName] or 0) + 1
                end
            end

            local InfoText = string.format("Items: %d | Cost: $%d", TotalItems, TotalCost)
            
            if UnbuyableCount > 0 then
                InfoText = InfoText .. string.format("\nUnbuyable (%d):", UnbuyableCount)
                local Shown = 0
                for name, Count in pairs(UnbuyableNames) do
                    if Shown < 2 then
                        InfoText = InfoText .. string.format("\n• %s x%d", name, Count)
                    elseif Shown == 2 then
                        InfoText = InfoText .. "\n• ...and more"
                    end
                    Shown = Shown + 1
                    if getgenv().DuskCore and getgenv().DuskCore.warn then
                        getgenv().DuskCore.warn("[Price Viewer] Unbuyable: " .. name .. " x" .. count)
                    end
                end
            end

            Library:Notify("Price Viewer: " .. fileName, InfoText, 7, "rbxassetid://126904798120349", "rbxassetid://72958619361915")
        end)

        local Div = Library.Utils.Make("Frame", { Size = UDim2.new(1, -12, 0, 1), Position = UDim2.new(0, 6, 0, 0), BackgroundTransparency = 0.8, ZIndex = 1002, Parent = Content }, { BackgroundColor3 = "Stroke" })
        Library.Utils.TBT(Div, 0.15, {BackgroundTransparency = 0.8})
        
        AddAction("Delete File", "rbxassetid://90865958932830", "Red", "Red", true, function() self:DeleteHouse(FileName); self:RefreshList(); Library:Notify("Deleted", FileName .. " has been removed.", 3, "rbxassetid://91727514118912", "rbxassetid://72958619361915") end)
    end

    Library:Connect(OptionsBtn.MouseButton1Click, function()
        Library.Utils.TBT(OptionsBtn, 0.1, {BackgroundTransparency = 0.3})
        task.delay(0.1, function() Library.Utils.TBT(OptionsBtn, 0.2, {BackgroundTransparency = 0}) end)
        
        if self.ActiveFileMenu == FileName and self.ActiveDropdown then 
            CloseDropdown()
        else 
            CreateDropdown() 
        end
    end)

    Library:Connect(RenameBox.FocusLost, function()
        RenameBox.Visible = false; TitleLbl.Visible = true
        local NewName = RenameBox.Text:match("^%s*(.-)%s*$") 
        if NewName and NewName ~= "" and NewName ~= FileName then
            if self:RenameHouse(FileName, NewName) then 
                self:RefreshList() 
                Library:Notify("File Manager", "Renamed to " .. newName, 3, "rbxassetid://91727514118912", "rbxassetid://72958619361915") 
            end
        else 
            RenameBox.Text = FileName 
        end
    end)
end

return Module
]===],
    ["/raw/modules/adm_cloner/teleport"] = [===[
local RunService = game:GetService("RunService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")
local LocalPlayer = getgenv().DuskCore.plr

local Module = {}

function Module:Init(Library, Window, Tab)

     
     
     
    local function ApplyAvatar(ImageLabel, Username, Index)
        task.spawn(function()
            task.wait(Index * 0.15) 

            local userId = nil
            local Player = Players:FindFirstChild(Username)

            if Player then
                userId = Player.UserId
            else
                local Success, id = pcall(function() return Players:GetUserIdFromNameAsync(Username) end)
                if Success then userId = Id end
            end

            if userId then
                ImageLabel.Image = "rbxthumb://type=AvatarHeadShot&id=" .. userId .. "&w=150&h=150"
            else
                ImageLabel.Image = "rbxassetid://10827393433" 
            end
        end)
    end

     
     
     
    local function BuildCleanPreview(houseType, ViewportFrame)
        local IsUnknown = false
        
         
        if houseType == "Unknown" then
            IsUnknown = true
            houseType = "Micro"
        end
        
        houseType = tostring(houseType)  
        local HouseModel = nil

         
        local Resources = ReplicatedStorage:FindFirstChild("Resources")
        local RsExteriors = Resources and Resources:FindFirstChild("HouseExteriors")
        if RsExteriors then
            HouseModel = RsExteriors:FindFirstChild(houseType)
        end

         
        if not HouseModel then
            local WsExteriors = workspace:FindFirstChild("HouseExteriors")
            if WsExteriors then
                for _, Plot in pairs(WsExteriors:GetChildren()) do
                    local H = Plot:GetChildren()[1]
                    if H and H.Name == houseType then
                        HouseModel = H
                        break
                    end
                end
            end
        end

        if HouseModel then
            local DisplayHouse = HouseModel:Clone()

            if DisplayHouse:FindFirstChild("Doors") then DisplayHouse.Doors:Destroy() end
            
            for _, Part in pairs(DisplayHouse:GetDescendants()) do
                if Part:IsA("BasePart") then
                    local N = string.lower(Part.Name)
                    if Part.Transparency >= 1 or N == "plot" or N == "base" or N == "hitbox" or N == "driveway" or N == "floor" then
                        Part:Destroy()
                    else
                        Part.Anchored = true
                        Part.CanCollide = false
                        
                         
                        if IsUnknown then
                             
                            for _, Fx in pairs(Part:GetChildren()) do
                                if Fx:IsA("Texture") or Fx:IsA("Decal") then
                                    Fx:Destroy()
                                end
                            end
                             
                            Part.Material = Enum.Material.ForceField  
                            Part.Color = Color3.fromRGB(150, 200, 255)  
                            Part.Transparency = 0.2
                        end
                         
                    end
                elseif not Part:IsA("Model") and not Part:IsA("Folder") then
                    Part:Destroy() 
                end
            end

            DisplayHouse.Parent = ViewportFrame
            local Cf, size = DisplayHouse:GetBoundingBox()
            return DisplayHouse, size, Cf.Position
        end
        return nil, nil, nil
    end

     
     
     
     
    getgenv().DuskHouseCache = getgenv().DuskHouseCache or {}

    local function GetServerHouses()
        local Houses = {}
        local AddedOwners = {}

        local WorkspaceExteriors = workspace:FindFirstChild("HouseExteriors")
        
         
        if WorkspaceExteriors then
            for _, Plot in pairs(WorkspaceExteriors:GetChildren()) do
                local HouseModel = Plot:GetChildren()[1]
                if HouseModel and HouseModel:FindFirstChild("Doors") and HouseModel.Doors:FindFirstChild("MainDoor") then
                    local mainDoor = HouseModel.Doors.MainDoor
                    local Config = mainDoor:FindFirstChild("WorkingParts") and mainDoor.WorkingParts:FindFirstChild("Configuration")

                    if Config and Config:FindFirstChild("house_owner") then
                        local OwnerName = Config.house_owner.Value
                        if OwnerName and OwnerName ~= "" then
                             
                            getgenv().DuskHouseCache[OwnerName] = tostring(HouseModel.Name)
                        end
                    end
                end
            end
        end

         
        for _, P in ipairs(Players:GetPlayers()) do
            AddedOwners[P.Name] = true
            
            local HType = "Unknown"

            if P == LocalPlayer then
                 
                local Success, clientDataModule = pcall(function() return getgenv().DuskCore.M.ClientData end)
                if Success and ClientDataModule and type(ClientDataModule.get_data) == "function" then
                    local MyData = ClientDataModule.get_data()[P.Name]
                    if MyData and MyData.house_exterior_model then
                        HType = MyData.house_exterior_model
                    end
                end
            elseif getgenv().DuskHouseCache[P.Name] then
                 
                HType = getgenv().DuskHouseCache[P.Name]
            end

             
            local TouchPart = nil
            if WorkspaceExteriors and HType ~= "Unknown" then
                for _, Plot in pairs(WorkspaceExteriors:GetChildren()) do
                    local H = Plot:GetChildren()[1]
                    if H and H.Name == tostring(HType) then
                        local Conf = H:FindFirstChild("Doors") and H.Doors.MainDoor.WorkingParts:FindFirstChild("Configuration")
                        if Conf and Conf:FindFirstChild("house_owner") and Conf.house_owner.Value == P.Name then
                            TouchPart = H.Doors.MainDoor.WorkingParts:FindFirstChild("TouchToEnter")
                            break
                        end
                    end
                end
            end

            table.insert(Houses, {
                Owner = P.Name,
                HouseType = tostring(HType),
                DoorPart = TouchPart
            })
        end

        return Houses
    end
     
     
     
    Library.Utils.Make("TextLabel", { 
        Text = "Teleport to house:", 
        Size = UDim2.new(1, 0, 0, 20), 
        BackgroundTransparency = 1, 
        Font = Enum.Font.GothamMedium, 
        TextSize = 13, 
        TextXAlignment = Enum.TextXAlignment.Left,
        Parent = Tab.Page 
    }, { TextColor3 = "SubText" })

    local Container = Library.Utils.Make("Frame", { 
        Size = UDim2.new(1, 0, 0, 0), 
        AutomaticSize = Enum.AutomaticSize.Y, 
        BackgroundTransparency = 1, 
        Parent = Tab.Page 
    })

    Library.Utils.Make("UIGridLayout", { 
        CellSize = UDim2.new(0.48, 0, 0, 150), 
        CellPadding = UDim2.new(0.04, 0, 0, 15), 
        SortOrder = Enum.SortOrder.LayoutOrder, 
        Parent = Container 
    })

    local function CreateHouseCard(HouseData, Index)
        local Tile = Library.Utils.Make("TextButton", { Text = "", AutoButtonColor = false, ClipsDescendants = false, Parent = Container }, { BackgroundColor3 = "Section" })
        Library.Utils.Make("UICorner", {CornerRadius = UDim.new(0, 12), Parent = Tile})
        Library.Utils.Make("UIStroke", {Thickness = 1, Transparency = 0.5, Parent = Tile}, {Color = "Stroke"})

        Library.Utils.Make("UIPadding", { 
            PaddingTop = UDim.new(0, 8), PaddingBottom = UDim.new(0, 8), 
            PaddingLeft = UDim.new(0, 8), PaddingRight = UDim.new(0, 8), 
            Parent = Tile 
        })

        local RippleContainer = Library.Utils.Make("Frame", { Size = UDim2.new(1, 16, 1, 16), Position = UDim2.new(0, -8, 0, -8), BackgroundTransparency = 1, ClipsDescendants = true, ZIndex = 10, Parent = Tile })
        Library.Utils.Make("UICorner", {CornerRadius = UDim.new(0, 12), Parent = RippleContainer})

        local Viewport = Library.Utils.Make("ViewportFrame", {
            Size = UDim2.new(1, -16, 1, -40), 
            Position = UDim2.new(0, 8, 0, 8), 
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            ClipsDescendants = true,
            ZIndex = 1, 
            Parent = Tile
        })
        Library.Utils.Make("UICorner", {CornerRadius = UDim.new(0, 8), Parent = Viewport})
        Library.Utils.Make("UIStroke", {Thickness = 1, Transparency = 0.7, Parent = Viewport}, {Color = "Stroke"})

        local AccentLine = Library.Utils.Make("Frame", { 
            Size = UDim2.new(0.35, 0, 0, 3), 
            Position = UDim2.new(1, -6, 1, -6), 
            AnchorPoint = Vector2.new(1, 1), 
            BorderSizePixel = 0, 
            ZIndex = 5, 
            Parent = Viewport 
        }, { BackgroundColor3 = "Accent" })
        Library.Utils.Make("UICorner", {CornerRadius = UDim.new(1, 0), Parent = AccentLine})

        local DisplayHouse, HouseSize, centerPos = BuildCleanPreview(HouseData.HouseType, Viewport)

        if DisplayHouse and HouseSize and CenterPos then
            local VpCamera = Instance.new("Camera")
            VpCamera.FieldOfView = 50 
            Viewport.CurrentCamera = VpCamera
            VpCamera.Parent = Viewport

            local Radius = HouseSize.Magnitude / 2
            local Distance = (Radius / math.tan(math.rad(VpCamera.FieldOfView / 2))) * 1.1

            local RenderConn 
            RenderConn = RunService.RenderStepped:Connect(function()
                if not Viewport.Parent then 
                    if RenderConn then RenderConn:Disconnect() end 
                    return 
                end
                
                 
                local CurrentTime = os.clock()
                local Speed = 0.5  
                local Angle = CurrentTime * Speed
                
                local CamPos = CenterPos + Vector3.new(math.cos(Angle) * Distance * 0.8, Distance * 0.4, math.sin(Angle) * Distance * 0.8)
                VpCamera.CFrame = CFrame.lookAt(CamPos, CenterPos)
            end)
        end

        local Avatar = Library.Utils.Make("ImageLabel", {
            Size = UDim2.new(0, 28, 0, 28), 
            Position = UDim2.new(0, 14, 1, -8), 
            AnchorPoint = Vector2.new(0, 1), 
            BackgroundTransparency = 1, 
            ZIndex = 4, 
            Parent = Tile
        })
        Library.Utils.Make("UICorner", {CornerRadius = UDim.new(1, 0), Parent = Avatar})
        Library.Utils.Make("UIStroke", {Thickness = 2, Parent = Avatar}, {Color = "Section"}) 
        ApplyAvatar(Avatar, HouseData.Owner, Index) 

         
        local DisplayName = HouseData.Owner
        if HouseData.HouseType == "Unknown" then
            DisplayName = HouseData.Owner .. " (?)"
        end

        local NameLbl = Library.Utils.Make("TextLabel", { 
            Text = DisplayName, 
            Size = UDim2.new(1, -54, 0, 20),
            Position = UDim2.new(0, 48, 1, -12), 
            AnchorPoint = Vector2.new(0, 1), 
            BackgroundTransparency = 1, 
            TextXAlignment = Enum.TextXAlignment.Left,
            Font = Enum.Font.GothamMedium, 
            TextSize = 13, 
            TextTruncate = Enum.TextTruncate.AtEnd, 
            ZIndex = 3, 
            Parent = Tile 
        }, { TextColor3 = "Text" })

        local Scale = Instance.new("UIScale", Tile)

        Library:Connect(Tile.MouseEnter, function()
            Library.Utils.TBT(AccentLine, 0.3, {Size = UDim2.new(0.6, 0, 0, 4)})
        end)

        Library:Connect(Tile.MouseLeave, function()
            Library.Utils.TBT(AccentLine, 0.3, {Size = UDim2.new(0.35, 0, 0, 3)})
        end)

        Library:Connect(Tile.MouseButton1Down, function() 
            Library.Utils.TBT(Scale, 0.1, {Scale = 0.96}) 
        end)

         
        Library:Connect(Tile.MouseButton1Click, function()
            Library.Utils.TBT(Scale, 0.15, {Scale = 1}, Enum.EasingStyle.Bounce)
            Library.Utils.CreateRipple(RippleContainer)

            local TargetPlayer = Players:FindFirstChild(HouseData.Owner)
            
            if not TargetPlayer then
                if Library.Notify then Library:Notify("Error", "Player is no longer in the server!", 3, "rbxassetid://73186275216515", "rbxassetid://72958619361915") end
                return
            end

            if Library.Notify then 
                Library:Notify("Teleport", "Entering " .. houseData.Owner .. "'s house...", 3, "rbxassetid://91727514118912", "rbxassetid://72958619361915") 
            end

            task.spawn(function()
                local DuskCore = getgenv().DuskCore
                local API = DuskCore.API
                local ClientDataModule = DuskCore.M.ClientData
                
                 
                local CurrentLoc = ClientDataModule.get("location_id")
                if CurrentLoc == "housing" then
                    pcall(function() API.UnsubscribeFromHouse:InvokeServer(LocalPlayer) end)
                end
                
                 
                pcall(function() API.SetLocation:FireServer("Neighborhood") end)
                task.wait(0.5)
                
                local SetIdentity = (syn and syn.set_thread_identity) or setthreadidentity or setidentity
                local GetIdentity = (syn and syn.get_thread_identity) or getthreadidentity or getidentity

                local CurrentId = GetIdentity and GetIdentity() or 7
                
                 
                pcall(function() 
                    if SetIdentity then pcall(SetIdentity, 2) end
                    
                    local InteriorsM = require(ReplicatedStorage.ClientModules.Core.InteriorsM.InteriorsM)
                    InteriorsM.enter_smooth("housing", "MainDoor", {
                        ["house_owner"] = TargetPlayer
                    }) 
                end)
                
                if SetIdentity then pcall(SetIdentity, CurrentId) end
            end)
        end)
    end

    local RefreshThread = nil
    local CachedHouses = {}

    local function UpdateHouseCards()
        for _, Child in ipairs(Container:GetChildren()) do
            if Child:IsA("TextButton") then
                Child:Destroy()
            end
        end

        local Success, err = pcall(function()
            local Houses = GetServerHouses()

            if #Houses > 0 then
                CachedHouses = Houses
            else
                Houses = CachedHouses 
            end

            if #Houses > 0 then
                for Index, HouseData in ipairs(Houses) do
                    CreateHouseCard(HouseData, Index)
                end
            else
                CreateHouseCard({
                    Owner = LocalPlayer.Name,
                    HouseType = "Micro",
                    DoorPart = nil
                }, 1)
            end
        end)

        if not Success then warn("[Dusk&Shine Teleport] Render error: ", Err) end
    end

    local function QueueRefresh()
        if RefreshThread then task.cancel(RefreshThread) end
        RefreshThread = task.spawn(function()
            task.wait(1.5) 
            UpdateHouseCards()
        end)
    end

    QueueRefresh()

local WorkspaceExteriors = workspace:WaitForChild("HouseExteriors", 5)
    if WorkspaceExteriors then
        table.insert(Library.Connections, WorkspaceExteriors.DescendantAdded:Connect(function(Descendant)
            if Descendant.Parent and Descendant.Parent.Parent == WorkspaceExteriors then
                QueueRefresh()
            end
        end))

        table.insert(Library.Connections, WorkspaceExteriors.DescendantRemoving:Connect(function(Descendant)
            if Descendant.Parent and Descendant.Parent.Parent == WorkspaceExteriors then
                QueueRefresh()
            end
        end))
    end

   table.insert(Library.Connections, Players.PlayerRemoving:Connect(QueueRefresh))
end

return Module
]===],
    ["/raw/modules/adm_cloner/settings"] = [===[local Module = {}

function Module:Init(Library, Window, Tab)
    local Players = game:GetService("Players")
    local LocalPlayer = Players.LocalPlayer
    local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")
    local TweenService = game:GetService("TweenService")
    local Screen = PlayerGui:WaitForChild("DuskShine_Mega", 10)

     
     
     
    if not getgenv().UIScaleSize then
        local Camera = workspace.CurrentCamera
        local ScreenWidth = Camera and Camera.ViewportSize.X or 1920
        getgenv().UIScaleSize = math.clamp(math.floor((ScreenWidth / 1920) * 100), 45, 100)
        if getgenv().SaveConfig then pcall(getgenv().SaveConfig) end
    end

     
     
     
    local ParticleFrame = Library.Utils.Make("Frame", {
        Size = UDim2.new(1, 0, 1, 0), BackgroundTransparency = 1, ZIndex = 1, 
        ClipsDescendants = true, Parent = Window.MainFrame
    })

    local function SpawnParticle()
        if not getgenv().MenuParticlesEnabled then return end

        local PType = getgenv().ParticleType or "Old Vanilla"
        local P
        local FallTime = math.random(4, 8)
        local RotSpeed = math.random(-40, 40)

        if PType == "Old Vanilla" then
            P = Instance.new("Frame")
            P.BackgroundColor3 = Color3.new(1, 1, 1)
            P.BorderSizePixel = 0
            P.Size = UDim2.new(0, math.random(3, 6), 0, math.random(3, 6))
        elseif PType == "Snow" then
            P = Instance.new("Frame")
            P.BackgroundColor3 = Color3.new(1, 1, 1)
            P.BorderSizePixel = 0
            local S = math.random(4, 9)
            P.Size = UDim2.new(0, S, 0, S)
            Library.Utils.Make("UICorner", {CornerRadius = UDim.new(1, 0), Parent = P})
        elseif PType == "Bubbles" then
            P = Instance.new("Frame")
            P.BackgroundTransparency = 1
            P.BorderSizePixel = 0
            local S = math.random(8, 16)
            P.Size = UDim2.new(0, S, 0, S)
            Library.Utils.Make("UICorner", {CornerRadius = UDim.new(1, 0), Parent = P})
            local stroke = Instance.new("UIStroke", P)
            stroke.Color = Color3.new(1, 1, 1)
            stroke.Thickness = 1.2
        elseif PType == "Sakura Petals" then
            P = Instance.new("Frame")
            P.BackgroundColor3 = Color3.fromRGB(255, 183, 197)
            P.BorderSizePixel = 0
            P.Size = UDim2.new(0, math.random(5, 10), 0, math.random(4, 7))
            Library.Utils.Make("UICorner", {CornerRadius = UDim.new(0.5, 0), Parent = P})
        elseif PType == "Stars" then
            P = Instance.new("ImageLabel")
            P.BackgroundTransparency = 1
            P.Image = "rbxassetid://6031225815"
            P.Size = UDim2.new(0, math.random(12, 20), 0, math.random(12, 20))
            if Library.CurrentTheme then P.ImageColor3 = Library.CurrentTheme.Accent end
        end

        P.ZIndex = 1
        P.Position = UDim2.new(math.random(), 0, -0.1, 0)
        P.Rotation = math.random(0, 360)
        P.Parent = ParticleFrame

        local TargetProps = { Position = UDim2.new(P.Position.X.Scale, 0, 1.1, 0), Rotation = P.Rotation + (RotSpeed * FallTime) }

        if PType == "Bubbles" then
            local stroke = P:FindFirstChildOfClass("UIStroke")
            if stroke then 
                stroke.Transparency = math.random(2, 6) / 10
                TweenService:Create(stroke, TweenInfo.new(FallTime, Enum.EasingStyle.Linear), {Transparency = 1}):Play() 
            end
        elseif PType == "Stars" then
            P.ImageTransparency = math.random(2, 6) / 10
            TargetProps.ImageTransparency = 1 
        else
            P.BackgroundTransparency = math.random(2, 6) / 10
            TargetProps.BackgroundTransparency = 1
        end

        local T = TweenService:Create(P, TweenInfo.new(FallTime, Enum.EasingStyle.Linear), TargetProps)
        T:Play()
        T.Completed:Connect(function() P:Destroy() end)
    end

    task.spawn(function()
        while task.wait(0.15) do
            if not getgenv().DuskShine_Core or getgenv().DS_StopExecution then break end
            if Window.MainFrame.Visible then SpawnParticle() end
        end
    end)

     
     
     
    Tab:CreateDivider({ Text = "UI Settings & Particles" })

    Tab:CreateToggle({
        Name = "Menu Particles",
        Description = "Falling effects in the background of the menu.",
        Flag = "MenuParticlesEnabled",
        Default = getgenv().MenuParticlesEnabled or false,
        Callback = function(State) getgenv().MenuParticlesEnabled = State end
    })

    local ParticlePickerContainer = Library.Utils.Make("Frame", { Size = UDim2.new(1, 0, 0, 70), Parent = Tab.Page }, { BackgroundColor3 = "Section" })
    Library.Utils.Make("UICorner", { CornerRadius = UDim.new(0, 10), Parent = ParticlePickerContainer })
    Library.Utils.Make("UIStroke", { Thickness = 1, Parent = ParticlePickerContainer }, { Color = "Stroke" })

    local GridHolder = Library.Utils.Make("Frame", { Size = UDim2.new(1, 0, 1, 0), BackgroundTransparency = 1, Parent = ParticlePickerContainer })
    Library.Utils.Make("UIPadding", { PaddingTop = UDim.new(0, 10), PaddingBottom = UDim.new(0, 10), PaddingLeft = UDim.new(0, 10), PaddingRight = UDim.new(0, 10), Parent = GridHolder })
    Library.Utils.Make("UIListLayout", { FillDirection = Enum.FillDirection.Horizontal, HorizontalAlignment = Enum.HorizontalAlignment.Center, VerticalAlignment = Enum.VerticalAlignment.Center, SortOrder = Enum.SortOrder.LayoutOrder, Padding = UDim.new(0, 8), Parent = GridHolder })

    local ParticleTypes = {"Old Vanilla", "Stars", "Snow", "Sakura Petals", "Bubbles"}
    local ParticleTiles = {}

    for I, PType in ipairs(ParticleTypes) do
        local IsSelected = (getgenv().ParticleType == PType)
        
         
        local OuterGlow = Library.Utils.Make("Frame", { Size = UDim2.new(0.2, -7, 1, 0), LayoutOrder = I, BackgroundTransparency = IsSelected and 0 or 1, Parent = GridHolder })
        Library.Utils.Make("UICorner", {CornerRadius = UDim.new(0, 10), Parent = OuterGlow})
        
        local GlowGrad = Instance.new("UIGradient", OuterGlow)
        GlowGrad.Offset = Vector2.new(-1, 0)
        local GradTween = TweenService:Create(GlowGrad, TweenInfo.new(1.5, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, -1), {Offset = Vector2.new(1, 0)})
        if IsSelected then GradTween:Play() end

        local function UpdateGradientColor()
            local SCol = Library.CurrentTheme and Library.CurrentTheme.Stroke or Color3.fromRGB(50, 50, 55)
            local ACol = Library.CurrentTheme and Library.CurrentTheme.Accent or Color3.fromRGB(255, 255, 255)
            GlowGrad.Color = ColorSequence.new({ ColorSequenceKeypoint.new(0, SCol), ColorSequenceKeypoint.new(0.5, ACol), ColorSequenceKeypoint.new(1, SCol) })
        end
        UpdateGradientColor()
        
        local ThemeWatcher = Library.Utils.Make("Frame", {Visible = false, Parent = OuterGlow}, {BackgroundColor3 = "Accent"})
        ThemeWatcher:GetPropertyChangedSignal("BackgroundColor3"):Connect(UpdateGradientColor)

        local Tile = Library.Utils.Make("TextButton", { Size = UDim2.new(1, -4, 1, -4), Position = UDim2.new(0.5, 0, 0.5, 0), AnchorPoint = Vector2.new(0.5, 0.5), Text = "", AutoButtonColor = false, ClipsDescendants = true, Parent = OuterGlow }, { BackgroundColor3 = "Sidebar" })
        Library.Utils.Make("UICorner", { CornerRadius = UDim.new(0, 8), Parent = Tile })
        local scale = Instance.new("UIScale", Tile)
        
        ParticleTiles[PType] = { Glow = OuterGlow, Tween = GradTween, Grad = GlowGrad }

        Library:Connect(Tile.MouseEnter, function()
            if getgenv().ParticleType ~= PType then TweenService:Create(OuterGlow, TweenInfo.new(0.2), {BackgroundTransparency = 0}):Play(); GradTween:Play() end
            TweenService:Create(scale, TweenInfo.new(0.25, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {Scale = 1.06}):Play()
        end)

        Library:Connect(Tile.MouseLeave, function()
            if getgenv().ParticleType ~= PType then TweenService:Create(OuterGlow, TweenInfo.new(0.2), {BackgroundTransparency = 1}):Play(); GradTween:Pause(); GlowGrad.Offset = Vector2.new(-1, 0) end
            TweenService:Create(scale, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Scale = 1}):Play()
        end)

        task.spawn(function()
            while Tile and Tile.Parent do
                if Window.MainFrame.Visible then
                    local P = Instance.new("Frame")
                    P.BorderSizePixel = 0
                    P.Parent = Tile

                    if PType == "Old Vanilla" then P.Size = UDim2.new(0, 3, 0, 3); P.BackgroundColor3 = Color3.new(1, 1, 1); P.Position = UDim2.new(math.random(), 0, 0, 0)
                    elseif PType == "Stars" then P.Size = UDim2.new(0, 10, 0, 10); P.BackgroundTransparency = 1; local Img = Instance.new("ImageLabel", P); Img.Size = UDim2.new(1, 0, 1, 0); Img.BackgroundTransparency = 1; Img.Image = "rbxassetid://6031225815"; Img.ImageColor3 = Library.CurrentTheme.Accent; P.Position = UDim2.new(math.random(), 0, 0, 0)
                    elseif PType == "Snow" then P.Size = UDim2.new(0, 5, 0, 5); P.BackgroundColor3 = Color3.new(1, 1, 1); Library.Utils.Make("UICorner", {CornerRadius = UDim.new(1, 0), Parent = P}); P.Position = UDim2.new(math.random(), 0, 0, 0)
                    elseif PType == "Sakura Petals" then P.Size = UDim2.new(0, 7, 0, 4); P.BackgroundColor3 = Color3.fromRGB(255, 183, 197); Library.Utils.Make("UICorner", {CornerRadius = UDim.new(0.5, 0), Parent = P}); P.Position = UDim2.new(math.random(), 0, 0, 0)
                    elseif PType == "Bubbles" then P.Size = UDim2.new(0, 8, 0, 8); P.BackgroundTransparency = 1; Library.Utils.Make("UICorner", {CornerRadius = UDim.new(1, 0), Parent = P}); local stroke = Instance.new("UIStroke", P); stroke.Color = Color3.new(1, 1, 1); stroke.Thickness = 1; P.Position = UDim2.new(math.random(), 0, 0, 0) end
                    TweenService:Create(P, TweenInfo.new(1.2, Enum.EasingStyle.Linear), { Position = UDim2.new(P.Position.X.Scale, math.random(-6, 6), 1, 4), BackgroundTransparency = 1 }):Play()
                    task.delay(1.2, function() if P then P:Destroy() end end)
                end
                task.wait(0.35)
            end
        end)

        Library:Connect(Tile.MouseButton1Click, function()
            getgenv().ParticleType = PType
            for name, Data in pairs(ParticleTiles) do
                local Active = (name == PType)
                TweenService:Create(Data.Glow, TweenInfo.new(0.25), {BackgroundTransparency = Active and 0 or 1}):Play()
                if Active then Data.Tween:Play() else Data.Tween:Pause(); Data.Grad.Offset = Vector2.new(-1, 0) end
            end
            scale.Scale = 0.92
            TweenService:Create(scale, TweenInfo.new(0.35, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {Scale = 1.06}):Play()
        end)
    end

    local CloserStyleContainer = Library.Utils.Make("Frame", { Size = UDim2.new(1, 0, 0, 75), Parent = Tab.Page }, { BackgroundColor3 = "Section" })
    Library.Utils.Make("UICorner", { CornerRadius = UDim.new(0, 10), Parent = CloserStyleContainer })
    Library.Utils.Make("UIStroke", { Thickness = 1, Transparency = 0.7, Parent = CloserStyleContainer }, { Color = "Stroke" })
    
    local CloserTitle = Library.Utils.Make("TextLabel", {
        Text = "MINIMIZE BUTTON STYLE", Size = UDim2.new(1, -20, 0, 20), Position = UDim2.new(0, 12, 0, 8),
        BackgroundTransparency = 1, Font = Enum.Font.GothamBold, TextSize = 11, TextXAlignment = Enum.TextXAlignment.Left, Parent = CloserStyleContainer
    }, { TextColor3 = "Accent" })
    Library.Utils.ApplyGradient(CloserTitle, Library.CurrentTheme and Library.CurrentTheme.Accent or Color3.new(1,1,1))

    local CloserGrid = Library.Utils.Make("Frame", { Size = UDim2.new(1, -24, 0, 36), Position = UDim2.new(0, 12, 0, 30), BackgroundTransparency = 1, Parent = CloserStyleContainer })
    Library.Utils.Make("UIListLayout", { FillDirection = Enum.FillDirection.Horizontal, HorizontalAlignment = Enum.HorizontalAlignment.Center, VerticalAlignment = Enum.VerticalAlignment.Center, SortOrder = Enum.SortOrder.LayoutOrder, Padding = UDim.new(0, 10), Parent = CloserGrid })

    local CloserOptions = {"Top Bar", "Floating Logo"}
    local CloserBtns = {}

    for I, Opt in ipairs(CloserOptions) do
        local IsSelected = (getgenv().CloserType == Opt or (not getgenv().CloserType and Opt == "Top Bar"))
        
        local Btn = Library.Utils.Make("TextButton", { 
            Size = UDim2.new(0.5, -5, 1, 0), 
            LayoutOrder = I, 
            Text = Opt, 
            Font = Enum.Font.GothamSemibold, 
            TextSize = 13, 
            AutoButtonColor = false, 
            Parent = CloserGrid 
        }, { 
            BackgroundColor3 = "Sidebar", 
            TextColor3 = IsSelected and "Accent" or "SubText" 
        })
        
        Library.Utils.Make("UICorner", { CornerRadius = UDim.new(0, 8), Parent = Btn })
        local scale = Instance.new("UIScale", Btn)
        
        CloserBtns[Opt] = Btn

        Library:Connect(Btn.MouseEnter, function()
            TweenService:Create(scale, TweenInfo.new(0.25, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {Scale = 1.04}):Play()
             
            if getgenv().CloserType ~= Opt then
                TweenService:Create(Btn, TweenInfo.new(0.2), {TextColor3 = Library.CurrentTheme.Text}):Play()
            end
        end)

        Library:Connect(Btn.MouseLeave, function()
            TweenService:Create(scale, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Scale = 1}):Play()
             
            if getgenv().CloserType ~= Opt then
                TweenService:Create(Btn, TweenInfo.new(0.2), {TextColor3 = Library.CurrentTheme.SubText}):Play()
            end
        end)

        Library:Connect(Btn.MouseButton1Click, function()
            getgenv().CloserType = Opt
            
             
            for name, Button in pairs(CloserBtns) do
                local Active = (name == Opt)
                TweenService:Create(Button, TweenInfo.new(0.25, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
                    TextColor3 = Active and Library.CurrentTheme.Accent or Library.CurrentTheme.SubText
                }):Play()
            end
            
            scale.Scale = 0.94
            TweenService:Create(scale, TweenInfo.new(0.35, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {Scale = 1.04}):Play()
        end)
    end

    local Camera = workspace.CurrentCamera
    local Viewport = Camera and Camera.ViewportSize or Vector2.new(1920, 1080)
    
     
    local MaxScaleX = (Viewport.X - 40) / 680
    local MaxScaleY = (Viewport.Y - 40) / 450
    local DynamicMax = math.floor(math.min(MaxScaleX, MaxScaleY) * 100)
    
     
    local SafeMaxScale = math.clamp(DynamicMax, 50, 175)

    Tab:CreateUIXPanel({
        Min = 25, 
        Max = SafeMaxScale,
        DefaultScale = math.clamp(getgenv().UIScaleSize or 50, 25, SafeMaxScale),
        ScaleFlag = "UIScaleSize",
        ScaleCallback = function(Val)
            getgenv().UIScaleSize = Val
            local UIScaleObj = Screen and Screen:FindFirstChildOfClass("UIScale")
            if UIScaleObj then 
                UIScaleObj.Scale = Val / 100 
                
                 
                if Window and Window.MainFrame then
                    TweenService:Create(Window.MainFrame, TweenInfo.new(0.3, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
                        Position = UDim2.new(0.5, 0, 0.5, 0)
                    }):Play()
                end
            end
            if getgenv().SaveConfig then pcall(getgenv().SaveConfig) end
        end,

        DefaultColor = Library.CurrentTheme.Accent or Color3.fromRGB(255, 255, 255),
        ColorFlag = "ThemeAccent",
        ColorCallback = function(Col)
            Library.CurrentTheme.Accent = Col
            Library.Themes.Dark.Accent = Col
            Library.Themes.Light.Accent = Col

            for Element, Props in pairs(Library.ThemeObjects) do
                if Element and Element.Parent then
                    for PropName, ThemeKey in pairs(Props) do
                        if ThemeKey == "Accent" then
                            TweenService:Create(Element, TweenInfo.new(0.3), {[PropName] = Col}):Play()
                            local grad = Element:FindFirstChild("DuskShine_Gradient")
                            if grad then
                                local glow = Color3.new(math.clamp(Col.R + 0.35, 0, 1), math.clamp(Col.G + 0.35, 0, 1), math.clamp(Col.B + 0.35, 0, 1))
                                grad.Color = ColorSequence.new({
                                    ColorSequenceKeypoint.new(0, Col),
                                    ColorSequenceKeypoint.new(0.5, glow),
                                    ColorSequenceKeypoint.new(1, Col)
                                })
                            end
                        end
                    end
                end
            end
        end
    })

    local Lighting = game:GetService("Lighting")
    local DuskBlur = Lighting:FindFirstChild("DuskMenuBlur") or Instance.new("BlurEffect", Lighting)
    DuskBlur.Name = "DuskMenuBlur"; DuskBlur.Size = 0; DuskBlur.Enabled = false

    Library:Connect(Window.MainFrame:GetPropertyChangedSignal("Visible"), function()
        if getgenv().MenuBlurEnabled then
            if Window.MainFrame.Visible then DuskBlur.Enabled = true; TweenService:Create(DuskBlur, TweenInfo.new(0.3), {Size = 24}):Play()
            else local T = TweenService:Create(DuskBlur, TweenInfo.new(0.3), {Size = 0}); T:Play(); T.Completed:Connect(function() DuskBlur.Enabled = false end) end
        end
    end)

    Tab:CreateToggle({
        Name = "Menu Blur", Description = "Blur background when menu is open.", Flag = "MenuBlurEnabled", Default = getgenv().MenuBlurEnabled or false,
        Callback = function(State)
            getgenv().MenuBlurEnabled = State
            if State and Window.MainFrame.Visible then DuskBlur.Enabled = true; TweenService:Create(DuskBlur, TweenInfo.new(0.3), {Size = 24}):Play()
            elseif not State then local T = TweenService:Create(DuskBlur, TweenInfo.new(0.3), {Size = 0}); T:Play(); T.Completed:Connect(function() DuskBlur.Enabled = false end) end
        end
    })

     
     
     
    Tab:CreateDivider({ Text = "Global Settings" })

    Tab:CreateToggle({ Name = "Auto-Update Kicker", Description = "Kicks you from the server if a new script version is found.", Flag = "AutoUpdateKicker", Default = getgenv().AutoUpdateKicker or false, Callback = function(State) getgenv().AutoUpdateKicker = State end })
    Tab:CreateToggle({
        Name = "Anonymous Mode", Description = "Hides your identity to prevent streaming snipes.", Flag = "AnonymousMode", Default = getgenv().AnonymousMode or false,
        Callback = function(State)
            getgenv().AnonymousMode = State
            for _, AvatarData in ipairs(Library.AnonItems.Avatars) do
                if State then AvatarData.ImageObj.ImageTransparency = 1; AvatarData.ImageObj.BackgroundTransparency = 0; AvatarData.ImageObj.BackgroundColor3 = Color3.new(0,0,0); AvatarData.Letter.Visible = true
                else AvatarData.ImageObj.ImageTransparency = 0; AvatarData.ImageObj.BackgroundTransparency = 1; AvatarData.Letter.Visible = false end
            end
            for _, NameData in ipairs(Library.AnonItems.Names) do NameData.Obj.Text = string.format(NameData.Format, State and "Hidden User" or LocalPlayer.DisplayName) end
        end
    })

     
    local KeybindCard = Library.Utils.Make("Frame", { Size = UDim2.new(1, 0, 0, 70), Parent = Tab.Page }, { BackgroundColor3 = "Section" })
    Library.Utils.Make("UICorner", {CornerRadius = UDim.new(0, 10), Parent = KeybindCard})
    Library.Utils.Make("UIStroke", {Thickness = 1, Parent = KeybindCard}, {Color = "Stroke"})
    
    Library.Utils.Make("TextLabel", { Text = "Toggle Menu Key", Size = UDim2.new(1, -120, 0, 20), Position = UDim2.new(0, 20, 0, 15), BackgroundTransparency = 1, Font = Enum.Font.GothamBold, TextSize = 16, TextXAlignment = Enum.TextXAlignment.Left, Parent = KeybindCard }, { TextColor3 = "Text" })
    Library.Utils.Make("TextLabel", { Text = "Key to hide or show the menu.", Size = UDim2.new(1, -120, 0, 15), Position = UDim2.new(0, 20, 0, 38), BackgroundTransparency = 1, Font = Enum.Font.Gotham, TextSize = 13, TextXAlignment = Enum.TextXAlignment.Left, Parent = KeybindCard }, { TextColor3 = "SubText" })

    local BindBtn = Library.Utils.Make("TextButton", { Size = UDim2.new(0, 80, 0, 34), AnchorPoint = Vector2.new(1, 0.5), Position = UDim2.new(1, -20, 0.5, 0), Font = Enum.Font.Gotham, TextSize = 13, AutoButtonColor = false, Text = (getgenv().ToggleUIKey or Enum.KeyCode.RightControl).Name, Parent = KeybindCard }, { BackgroundColor3 = "Sidebar", TextColor3 = "SubText" })
    Library.Utils.Make("UICorner", {CornerRadius = UDim.new(0, 8), Parent = BindBtn})
    Library.Utils.Make("UIStroke", {Thickness = 1, Parent = BindBtn}, {Color = "Stroke"})

    local Listening = false
    Library:Connect(BindBtn.MouseButton1Click, function()
        if Listening then return end
        Listening = true
        BindBtn.Text = "..."
        Library.Utils.TBT(BindBtn, 0.2, {TextColor3 = Library.CurrentTheme.Accent})

        local TempConnection
        TempConnection = game:GetService("UserInputService").InputBegan:Connect(function(Input)
            local IsKey = Input.UserInputType == Enum.UserInputType.Keyboard
            local IsMouse = Input.UserInputType == Enum.UserInputType.MouseButton1 or Input.UserInputType == Enum.UserInputType.MouseButton2 or Input.UserInputType == Enum.UserInputType.MouseButton3

            if IsKey or IsMouse then
                local NewKey = IsKey and Input.KeyCode or Input.UserInputType
                if NewKey == Enum.KeyCode.Escape then NewKey = Enum.KeyCode.Unknown end

                getgenv().ToggleUIKey = NewKey
                BindBtn.Text = NewKey.Name
                Listening = false
                Library.Utils.TBT(BindBtn, 0.2, {TextColor3 = Library.CurrentTheme.SubText})

                if getgenv().SaveConfig then pcall(getgenv().SaveConfig) end
                if TempConnection then TempConnection:Disconnect() end
            end
        end)
    end)

    Library:Connect(game:GetService("UserInputService").InputBegan, function(Input, Processed)
        if not Processed and Input.KeyCode == getgenv().ToggleUIKey then
            task.spawn(function() if Window.ToggleMenu then Window:ToggleMenu() end end)
        end
    end)

     
     
     
    Tab:CreateDivider({ Text = "Performance" })
    
    local UserInputService = game:GetService("UserInputService")
    
    local SliderContainer = Library.Utils.Make("Frame", { Size = UDim2.new(1, 0, 0, 70), Parent = Tab.Page }, { BackgroundColor3 = "Section" })
    Library.Utils.Make("UICorner", { CornerRadius = UDim.new(0, 10), Parent = SliderContainer })
    local ContainerStroke = Library.Utils.Make("UIStroke", { Thickness = 1, Parent = SliderContainer }, { Color = "Stroke" })

    Library.Utils.Make("TextLabel", { Text = "Frame Rate Limit", Size = UDim2.new(1, -100, 0, 20), Position = UDim2.new(0, 20, 0, 10), BackgroundTransparency = 1, Font = Enum.Font.GothamBold, TextSize = 16, TextXAlignment = Enum.TextXAlignment.Left, Parent = SliderContainer }, { TextColor3 = "Text" })
    Library.Utils.Make("TextLabel", { Text = "Drag to the far right to completely uncap FPS.", Size = UDim2.new(1, -100, 0, 15), Position = UDim2.new(0, 20, 0, 30), BackgroundTransparency = 1, Font = Enum.Font.Gotham, TextSize = 13, TextXAlignment = Enum.TextXAlignment.Left, Parent = SliderContainer }, { TextColor3 = "SubText" })

    local PillFrame = Library.Utils.Make("Frame", { Size = UDim2.new(0, 76, 0, 24), AnchorPoint = Vector2.new(1, 0), Position = UDim2.new(1, -20, 0, 9), Parent = SliderContainer }, { BackgroundColor3 = "Sidebar" }) 
    Library.Utils.Make("UICorner", { CornerRadius = UDim.new(0, 6), Parent = PillFrame })
    local PillStroke = Library.Utils.Make("UIStroke", { Thickness = 1, Parent = PillFrame }, { Color = "Stroke" })
    
    local ValueText = Library.Utils.Make("TextBox", { Size = UDim2.new(1, 0, 1, 0), BackgroundTransparency = 1, Font = Enum.Font.Gotham, TextSize = 13, ClearTextOnFocus = false, ZIndex = 2, Parent = PillFrame }, { TextColor3 = "Text" })
    local PillScale = Instance.new("UIScale", PillFrame)

    local Track = Library.Utils.Make("TextButton", { Size = UDim2.new(1, -40, 0, 4), Position = UDim2.new(0, 20, 1, -12), AnchorPoint = Vector2.new(0, 1), Text = "", AutoButtonColor = false, Parent = SliderContainer }, { BackgroundColor3 = "Sidebar" })
    Library.Utils.Make("UICorner", { CornerRadius = UDim.new(1, 0), Parent = Track })

    local Fill = Library.Utils.Make("Frame", { Size = UDim2.new(0, 0, 1, 0), Parent = Track }, { BackgroundColor3 = "Accent" })
    Library.Utils.Make("UICorner", { CornerRadius = UDim.new(1, 0), Parent = Fill })

    local Knob = Library.Utils.Make("Frame", { Size = UDim2.new(0, 12, 0, 12), AnchorPoint = Vector2.new(0.5, 0.5), Position = UDim2.new(1, 0, 0.5, 0), Parent = Fill }, { BackgroundColor3 = "Text" })
    Library.Utils.Make("UICorner", { CornerRadius = UDim.new(1, 0), Parent = Knob })
    
    local KnobScale = Instance.new("UIScale", Knob)

    local MinFPS, maxFPS = 15, 360
    local RawSavedFPS = getgenv().FPSLimit or 0
    local CurrentVisualFPS = (RawSavedFPS == 0) and MaxFPS or RawSavedFPS 
    local IsDragging = false
    local IsUncapped = false

    local function UpdateVisuals(Val)
        local Pct = math.clamp((Val - MinFPS) / (MaxFPS - MinFPS), 0, 1)
        TweenService:Create(Fill, TweenInfo.new(0.15, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Size = UDim2.new(Pct, 0, 1, 0)}):Play()
        
        if Val == MaxFPS then
            ValueText.Text = "Uncapped"
            if not IsUncapped then
                IsUncapped = true
                if Library.ThemeObjects[ValueText] then Library.ThemeObjects[ValueText] = { TextColor3 = "Accent" } end
                if Library.ThemeObjects[PillStroke] then Library.ThemeObjects[PillStroke] = { Color = "Accent" } end
                TweenService:Create(ValueText, TweenInfo.new(0.2), {TextColor3 = Library.CurrentTheme.Accent}):Play()
                TweenService:Create(PillStroke, TweenInfo.new(0.2), {Color = Library.CurrentTheme.Accent}):Play()
                PillScale.Scale = 0.85; TweenService:Create(PillScale, TweenInfo.new(0.4, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {Scale = 1}):Play()
            end
        else
            ValueText.Text = tostring(Val)
            if IsUncapped then
                IsUncapped = false
                if Library.ThemeObjects[ValueText] then Library.ThemeObjects[ValueText] = { TextColor3 = "Text" } end
                if Library.ThemeObjects[PillStroke] then Library.ThemeObjects[PillStroke] = { Color = "Stroke" } end
                TweenService:Create(ValueText, TweenInfo.new(0.2), {TextColor3 = Library.CurrentTheme.Text}):Play()
                TweenService:Create(PillStroke, TweenInfo.new(0.2), {Color = Library.CurrentTheme.Stroke}):Play()
            end
        end
    end

    local function UpdateDrag(Input)
        local AbsolutePos = Track.AbsolutePosition.X
        local absoluteSize = Track.AbsoluteSize.X
        local Pct = math.clamp((Input.Position.X - AbsolutePos) / absoluteSize, 0, 1)
        local SnappedValue = math.floor(MinFPS + (MaxFPS - MinFPS) * Pct)
        
        if CurrentVisualFPS ~= SnappedValue then
            CurrentVisualFPS = SnappedValue
            UpdateVisuals(CurrentVisualFPS)
            local ActualFPS = (CurrentVisualFPS == MaxFPS) and 0 or CurrentVisualFPS
            getgenv().FPSLimit = ActualFPS
            if not getgenv().EcoModeEnabled and setfpscap then pcall(function() setfpscap(ActualFPS) end) end
        end
    end

    ValueText.FocusLost:Connect(function()
        local Num = tonumber(ValueText.Text:match("%d+"))
        if Num then
            Num = math.clamp(Num, MinFPS, MaxFPS)
            CurrentVisualFPS = Num
            UpdateVisuals(CurrentVisualFPS)
            local ActualFPS = (CurrentVisualFPS == MaxFPS) and 0 or CurrentVisualFPS
            getgenv().FPSLimit = ActualFPS
            if not getgenv().EcoModeEnabled and setfpscap then pcall(function() setfpscap(ActualFPS) end) end
        else
            ValueText.Text = (CurrentVisualFPS == MaxFPS) and "Uncapped" or tostring(CurrentVisualFPS)
        end
    end)

    UpdateVisuals(CurrentVisualFPS)

    Library:Connect(Track.InputBegan, function(Input)
        if Input.UserInputType == Enum.UserInputType.MouseButton1 or Input.UserInputType == Enum.UserInputType.Touch then
            IsDragging = true; TweenService:Create(KnobScale, TweenInfo.new(0.2, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {Scale = 1.35}):Play(); UpdateDrag(Input)
        end
    end)

    Library:Connect(UserInputService.InputEnded, function(Input)
        if Input.UserInputType == Enum.UserInputType.MouseButton1 or Input.UserInputType == Enum.UserInputType.Touch then
            IsDragging = false; TweenService:Create(KnobScale, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Scale = 1}):Play()
        end
    end)

    Library:Connect(UserInputService.InputChanged, function(Input)
        if IsDragging and (Input.UserInputType == Enum.UserInputType.MouseMovement or Input.UserInputType == Enum.UserInputType.Touch) then UpdateDrag(Input) end
    end)

    Library:Connect(SliderContainer.MouseEnter, function() TweenService:Create(ContainerStroke, TweenInfo.new(0.3), {Transparency = 0.5}):Play() end)
    Library:Connect(SliderContainer.MouseLeave, function() TweenService:Create(ContainerStroke, TweenInfo.new(0.3), {Transparency = 0}):Play() end)
    
    Tab:CreateToggle({
        Name = "Extreme Performance (NoRender)", Description = "Kills 3D rendering, shadows, and textures for MAX FPS.", Flag = "PerformanceModeEnabled", Default = getgenv().PerformanceModeEnabled or false,
        Callback = function(State)
            getgenv().PerformanceModeEnabled = State
            local Terrain = workspace:FindFirstChildOfClass("Terrain")
            if State then
                Lighting.GlobalShadows = false; Lighting.FogEnd = 9e9; Lighting.ShadowSoftness = 0; Lighting.Brightness = 0
                if Terrain then Terrain.WaterWaveSize = 0; Terrain.WaterWaveSpeed = 0; Terrain.WaterReflectance = 0; Terrain.WaterTransparency = 0 end
                pcall(function() settings().Rendering.QualityLevel = Enum.QualityLevel.Level01 end)
            else
                Lighting.GlobalShadows = true; Lighting.Brightness = 1
                pcall(function() settings().Rendering.QualityLevel = Enum.QualityLevel.Automatic end)
            end
        end
    })
end

return Module
]===],
}

 
 
local function V13(url)
    local Path = tostring(url):gsub("^https?://[^/]+", ""):match("^[^?]+")
    local Source = __HouseClonerSources[Path]
    if Source then return true, Source end
    return false, "Missing captured source: " .. tostring(Path)
end

 
LocalPlayer.Idled:Connect(function()
    pcall(function()
        VirtualUser:CaptureController()
        VirtualUser:ClickButton2(Vector2.new())
    end)
end)

if getgenv().DS_StopExecution then
	return
end

getgenv().DuskSessionID = (getgenv().DuskSessionID or 0) + 1

if getgenv().GlobalDuskConnections then
	for _, GlobalDuskConnection in pairs(getgenv().GlobalDuskConnections) do
		pcall(function()
			GlobalDuskConnection:Disconnect()
		end)
	end
end

getgenv().GlobalDuskConnections = {}

local Fsys

pcall(function()
	Fsys = require(game:GetService("ReplicatedStorage"):WaitForChild("Fsys", 5))
end)

local T1 = {
	RouterClient = Fsys and Fsys.load("RouterClient") or nil,
	ClientData = Fsys and Fsys.load("ClientData") or nil
}

getgenv().DuskCore = {
	M = T1,
	API = {
		BuyFurnitures = T1.RouterClient and T1.RouterClient.get("HousingAPI/BuyFurnitures") or nil,
		ActivateInterior = T1.RouterClient and T1.RouterClient.get("HousingAPI/ActivateInteriorFurniture") or nil,
		ActivateFurniture = T1.RouterClient and T1.RouterClient.get("HousingAPI/ActivateFurniture") or nil
	},
	Cac = {
		Connections = {}
	},
	plr = LocalPlayer,
	print = Clonefunction,
	warn = Clonefunction2
}

local V36, v37 = V13(DuskDomain .. "/raw/dusk_library_test?t=" .. tostring(tick()))

if not V36 or V37 == "" or V37:match("404 Not Found") then
	return Clonefunction2("[D&S] Core 404")
end

local Lib = loadstring(V37)()
local S2 = ""
local T2 = {
	Folder = "DuskAndShineConfigs",
	Library = nil,
	Init = function(P2, P3)
		P2.Library = P3

		if not isfolder(P2.Folder) then
			makefolder(P2.Folder)
		end
	end,
	Save = function(P4)
		if not P4.Library then
			return
		end

		local T3 = {
			Theme = P4.Library.CurrentThemeName,
			Flags = {}
		}

		for K, V43 in pairs(P4.Library.Flags) do
			if typeof(V43) == "Color3" then
				T3.Flags[K] = {
					r = V43.R,
					g = V43.G,
					b = V43.B,
					_type = "Color3"
				}
			elseif typeof(V43) == "EnumItem" then
				T3.Flags[K] = {
					name = V43.Name,
					typeStr = tostring(V43.EnumType):gsub("Enum%.", ""),
					_type = "Enum"
				}
			else
				T3.Flags[K] = V43
			end
		end

		local function V44()
			local Json = HttpService:JSONEncode(T3)

			if Json ~= S2 then
				writefile(P4.Folder .. "/TrueSettings.json", Json)
				S2 = Json
			end
		end

		pcall(V44)
	end,
	Load = function(P5)
		if not P5.Library then
			return
		end

		local V46 = P5.Folder .. "/TrueSettings.json"

		if not isfile(V46) then
			return
		end

		local Ok, result = pcall(function()
			return HttpService:JSONDecode(readfile(V46))
		end)

		if not Ok or type(Result) ~= "table" then
			return
		end

		if Result.Theme and P5.Library.Themes[Result.Theme] then
			P5.Library:SetTheme(Result.Theme)
		end

		if not getgenv().DuskConfigCache then
			getgenv().DuskConfigCache = {}
		end

		if Result.Flags then
			for K, V50 in pairs(Result.Flags) do
				local color3 = V50

				if type(V50) == "table" then
					if V50._type == "Color3" then
						color3 = Color3.new(V50.r, V50.g, V50.b)
					elseif V50._type == "Enum" then
						pcall(function()
							color3 = Enum[V50.typeStr][V50.name]
						end)
					end
				end

				getgenv().DuskConfigCache[K] = color3

				if P5.Library.ConfigUpdaters[K] then
					pcall(P5.Library.ConfigUpdaters[K], color3)
				else
					P5.Library.Flags[K] = color3
				end
			end
		end
	end,
	StartLoop = function(P6)
		task.spawn(function()
			while true do
				if task.wait(5) then
					if not getgenv().DS_StopExecution then
						P6:Save()

						continue
					end

					break
				end

				break
			end
		end)
	end
}

T2:Init(Lib)
T2:Load()
T2:StartLoop()
getgenv().SaveConfig = function()
	T2:Save()
end

if getgenv().DuskTheme and Lib.SetTheme then
	Lib:SetTheme(getgenv().DuskTheme)
end

if getgenv().DuskConfigCache and getgenv().DuskConfigCache.TransparentUI ~= nil then
	getgenv().TransparentUI = getgenv().DuskConfigCache.TransparentUI
end

local V52 = Lib:CreateWindow({
	Title = "Dusk &",
	AccentTitle = "Shine",
	Version = getgenv().DuskVersion
})
local T4 = {
	Home = V52:CreateTab({
		Name = "Home",
		Icon = "7733960981"
	}),
	Main = V52:CreateTab({
		Name = "Main",
		Icon = "10709782497"
	}),
	FileManager = V52:CreateTab({
		Name = "FileManager",
		Icon = "133109488933647"
	}),
	teleport = V52:CreateTab({
		Name = "Teleport",
		Icon = "13549782519"
	}),
	Settings = V52:CreateTab({
		Name = "Settings",
		Icon = "7734053495"
	})
}

V52:SelectTab(T4.Home)
V52:Build()

local T5 = {
	{
		Name = "Home",
		Url = DuskDomain .. "/raw/modules/adm_cloner/home?nocache=" .. tostring(tick()),
		Tab = T4.Home,
		Loaded = false
	},
	{
		Name = "Main",
		Url = DuskDomain .. "/raw/modules/adm_cloner/main?nocache=" .. tostring(tick()),
		Tab = T4.Main,
		Loaded = false
	},
	{
		Name = "FileManager",
		Url = DuskDomain .. "/raw/modules/adm_cloner/manager?nocache=" .. tostring(tick()),
		Tab = T4.FileManager,
		Loaded = false
	},
	{
		Name = "Teleport",
		Url = DuskDomain .. "/raw/modules/adm_cloner/teleport?nocache=" .. tostring(tick()),
		Tab = T4.teleport,
		Loaded = false
	},
	{
		Name = "Settings",
		Url = DuskDomain .. "/raw/modules/adm_cloner/settings?nocache=" .. tostring(tick()),
		Tab = T4.Settings,
		Loaded = false
	}
}
local N2 = 0

local function V56(P7)
	if P7.Loaded then
		N2 += 1

		return
	end

	task.spawn(function()
		local V57, v58 = V13(P7.Url)

		if V57 and V58 then
			if not V58:match("404 Not Found") then
				local Chunk = loadstring(V58, "@" .. p7.Name)

				if Chunk then
					local OkInit, initErr = pcall(function()
						local V60 = Chunk()
						if V60 and type(V60.Init) == "function" then
							V60:Init(Lib, V52, P7.Tab)
						end
					end)
					if not OkInit then
						warn("[HouseCloner] Module init failed: " .. p7.Name .. " — " .. tostring(InitErr))
					end
				end
			end
		end

		P7.Loaded = true
		N2 += 1
	end)
end

task.spawn(function()
	local V61 = #T5

	for I = 1, V61 do
		V56(T5[I])
	end

	while N2 < V61 do
		task.wait(0.05)
	end

	getgenv().AllDuskModulesLoaded = true
	Clonefunction("🚀 Загрузка завершена! (Strictly In-Memory)")

	if Lib and type(Lib.UpdateScale) == "function" then
		pcall(function()
			local UIScaleSize = getgenv().UIScaleSize or 125

			Lib:UpdateScale(UIScaleSize)

			if Lib.ConfigUpdaters and Lib.ConfigUpdaters.UIScaleSize then
				Lib.Flags.UIScaleSize = nil
				Lib.ConfigUpdaters.UIScaleSize(UIScaleSize)
			end

			if V52 and V52.MainFrame then
				local Size = V52.MainFrame.Size

				V52.MainFrame.Size = Size + UDim2.new(0, 1, 0, 0)
				game:GetService("RunService").RenderStepped:Wait()
				V52.MainFrame.Size = Size
			end
		end)
	end
end)
