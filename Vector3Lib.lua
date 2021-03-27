local vector3 = {}

vector3.newPart = function(self, props)
	local part = Instance.new("Part")
	part.Position = props.position or Vector3.new(0,0,0)
	part.Size = props.size or Vector3.new(0.5,0.5,0.5)
	part.Material = props.material or Enum.Material.Neon
	part.BrickColor = props.colour or BrickColor.new("Bright red")
	part.Anchored = true
	part.Name = props.name or "Vector3Part"
	part.Parent = props.parent or workspace
	return part
end

vector3.plot = function(self, ...)
	local parts = {}
	for i, v in next, {...} do
		if typeof(v) ~= "Vector3" then return error(tostring(v) .. " is not a valid Vector3.") end
		table.insert(parts, self:newPart({
			position = v;
			parent = workspace:FindFirstChild("VectorPlots") or (function()
				local f = Instance.new("Folder")
				f.Name = "VectorPlots"
				f.Parent = workspace
				return f
			end)();
		}))
	end
	return unpack(parts)
end

vector3.attach = function(self, v1, v2)
	if typeof(v1) ~= "Vector3" or typeof(v2) ~= "Vector3" then return error("Not a valid Vector3.") end
	local part = self:newPart({})
	part.CFrame = CFrame.new((v1 + v2) / 2, v2)
	part.Size = Vector3.new(0.5, 0.5, (v1-v2).Magnitude)
	return part
end

vector3.compareVectors = function(self, v1, v2)
	for _, v in next, {"X";"Y";"Z"} do
		if math.floor(v1[v]*10^5) ~= math.floor(v2[v]*10^5) then
			return false
		end
	end
	return true
end

vector3.isParallel = function(self, v1, v2)
	if typeof(v1) ~= "Vector3" or typeof(v2) ~= "Vector3" then return error("Not a valid Vector3.") end
	local u1 = v1.unit
	local u2 = v2.unit
	return self:compareVectors(u1, u2)
end

vector3.isPerpindicular = function(self, v1, v2)
	if typeof(v1) ~= "Vector3" or typeof(v2) ~= "Vector3" then return error("Not a valid Vector3.") end
	local u1 = v1.unit
	local u2 = v2.unit
	return self:compareVectors(u1, u2 * -1)
end

vector3.toggleAxis = function(self)
	if self.axis and #self.axis > 0 then
		for i, v in next, self.axis do
			v:Destroy()
		end
	else
		self.axis = {}
		for i = 1, 3 do
			local axisPart = self:visualise(Vector3.new((i == 1 and 2048) or 0, (i == 2 and 2048) or 0, (i == 3 and 2048) or 0), {
				colour = (i == 1 and BrickColor.new("Really red")) or (i == 2 and BrickColor.new("Lime green")) or (i == 3 and BrickColor.new("Deep blue"));
				material = Enum.Material.Neon;
				origin = Vector3.new(0, 0, 0);
				guiRange = 0;
			})
			table.insert(self.axis, axisPart)
		end
	end
end

vector3.visualise = function(self, v, options)
	if not options then options = {} end
	setmetatable(options, {__index = {
		material = Enum.Material.SmoothPlastic;
		colour = BrickColor.new("Lime green");
		origin = Vector3.new(0, 0, 0);
		size = Vector3.new(0.05, 0.05, 0.05);
		coneSize = Vector3.new(0.15, 0.25, 0.15);
		guiRange = 20;
	}})
	
	local part = self:newPart(options)
	
	local v1 = options.origin
	local v2 = v
	
	part.CFrame = CFrame.new((v1 + (v2 / 2)), v1 + v2) * CFrame.fromEulerAnglesXYZ(0, math.rad(90), 0)
	part.Size = Vector3.new((v1-v2).Magnitude, options.size, options.size)
	
	local mesh = Instance.new("SpecialMesh")
	mesh.MeshType = Enum.MeshType.Cylinder
	mesh.Parent = part
	
	local cone = script.EnhancedCone:Clone()
	cone.CFrame = part.CFrame * CFrame.new(part.Size.X / 2, 0, 0) * CFrame.fromEulerAnglesXYZ(0, 0, math.rad(270))
	cone.Size = options.coneSize
	cone.Material = options.material
	cone.BrickColor = options.colour
	cone.Parent = part
	
	local vectorInfo = script.VectorInfo:Clone()
	vectorInfo.MaxDistance = options.guiRange
	vectorInfo.Frame.Vector.Text = "("..self:roundNum(v.X, 3)..", "..self:roundNum(v.Y, 3)..", "..self:roundNum(v.Z, 3)..")"
	vectorInfo.Frame.Origin.Text = "Origin: ".."("..self:roundNum(v1.X, 3)..", "..self:roundNum(v1.Y, 3)..", "..self:roundNum(v1.Z, 3)..")"
	vectorInfo.Frame.Magnitude.Text = "Magnitude: "..self:roundNum(v.Magnitude, 3)
	local unit = self:round(v.Unit, 3)
	vectorInfo.Frame.Unit.Text = "Unit: ("..string.format("%.3f", unit.X)..", "..string.format("%.3f", unit.Y)..", "..string.format("%.3f", unit.Z)..")"
	vectorInfo.Parent = part
	
	return part
end

--// Misc
vector3.roundNum = function(self, num, roundingPlaces)
	roundingPlaces = roundingPlaces or 2
	return math.floor(num * 10^roundingPlaces + 0.5) / 10^roundingPlaces
end

vector3.round = function(self, v, roundingPlaces)
	return Vector3.new(self:roundNum(v.X, roundingPlaces), self:roundNum(v.Y, roundingPlaces), self:roundNum(v.Z, roundingPlaces))
end

return vector3
