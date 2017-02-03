-- Hammerspoon Configs

-- Modules
require("hs.application")
require("hs.logger")
require("hs.screen")
require("hs.window")
require("hs.alert")

local keys = require "keys"
require "triggers"

-- Logging
local log = hs.logger.new("My Config")

-- Add Fast Application Switching
keys.deactivateKeys()
keys.activateKeys()

