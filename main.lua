-- sanity check
local isUUFLoading, _ = C_AddOns.IsAddOnLoaded("UnhaltedUnitFrames")
if not isUUFLoading then
    return
end


local UUF_LDB = {}

UUF_LDB.LDB = LibStub("LibDataBroker-1.1")
UUF_LDB.LDBIcon = LibStub("LibDBIcon-1.0")
UUF_LDB.ADDON_NAME = C_AddOns.GetAddOnMetadata("UnhaltedUnitFrames", "Title")

local function InitializeDataBroker()
    local LDB = UUF_LDB.LDB:NewDataObject(UUF_LDB.ADDON_NAME, {
        label = UUF_LDB.ADDON_NAME,
        type = "launcher",
        icon = "Interface/Addons/UnhaltedUnitFrames/Media/Textures/Logo.tga",
        OnClick = function(...)
            local _, b = ...
            if b then SlashCmdList["UUF"]() end
        end,
        OnTooltipShow = function(tooltip)
            tooltip:SetText(UUF_LDB.ADDON_NAME, 1, 1, 1)
            tooltip:AddLine("Open " .. UUF_LDB.ADDON_NAME .. " config", NORMAL_FONT_COLOR.r, NORMAL_FONT_COLOR.g, NORMAL_FONT_COLOR.b)
        end
    })
    local showbutton = {
        hide = false,
    }
    UUF_LDB.LDBIcon:Register(UUF_LDB.ADDON_NAME, LDB, showbutton)
    UUF_LDB.LDBIcon:AddButtonToCompartment(UUF_LDB.ADDON_NAME)
end

InitializeDataBroker()