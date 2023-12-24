CMenu = CMenu or {}

-- Load File Function
function CMenu:LoadFile(path)
    local filename = path:GetFileFromFilename()
    filename = filename ~= "" and filename or path
    local flagCL = filename:StartsWith(filename, "cl_")
    local flagSV = filename:StartsWith(filename, "sv_")
    local flagSH = filename:StartsWith(filename, "sh_")

    if SERVER then
        if flagCL or flagSH then
            AddCSLuaFile(path)
        end

        if flagSV or flagSH then
            include(path)
        end
    elseif flagCL or flagSH then
        include(path)
    end
end

-- Load Directory Function
function CMenu:LoadDirectory(directory)
    local files, folders = file.Find(directory .. "/*", "LUA")

    for _, folder in ipairs(folders) do
        self:LoadDirectory(directory .. "/" .. folder)
        print("Directory: " .. directory .. "/" .. folder)
    end

    for _, filee in ipairs(files) do
        self:LoadFile(directory .. "/" .. filee)
        print("File: " .. directory .. "/" .. filee)
    end
end

CMenu:LoadDirectory("cmenu")

print("CMenu Loaded")
concommand.Add("CMenu_menu", function(ply)
    if ply:IsValid() then return end
    vgui.Create("CMenu_BMain")
end)