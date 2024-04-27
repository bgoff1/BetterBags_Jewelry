---@class BetterBags: AceAddon
local BetterBags = LibStub('AceAddon-3.0'):GetAddon("BetterBags")
---@class Categories: AceModule
local categories = BetterBags:GetModule('Categories')
---@class Config: AceModule
local config = BetterBags:GetModule('Config')
---@class Constants: AceModule
local const = BetterBags:GetModule('Constants')
---@class Database: AceModule
local db = BetterBags:GetModule('Database')

local _, ns = ...;
local L = ns.L;
local _G = _G

categories:CreateCategory("Jewelry")

-- @param data ItemData
categories:RegisterCategoryFunction("JewelryCategoryFilter", function(data)
    local quality = data.itemInfo.itemQuality

    if (data.itemInfo.itemEquipLoc == "INVTYPE_NECK" or data.itemInfo.itemEquipLoc == "INVTYPE_FINGER") then
        categories:AddItemToCategory(data.itemInfo.itemID, "Jewelry")
        config:GetBag(const.BAG_KIND.BACKPACK):Refresh()
        config:GetBag(const.BAG_KIND.BANK):Refresh()
    end

    return nil
end)
