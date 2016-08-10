local InventoryWindow = {}

local helpText = [[These caves are dangerous. Equip yourself as you see fit.]]

-- initialize bombs/health/ropes
local function fetchStats()
  local health = addressList:getMemoryRecordByDescription('shadow health')
  local bombs  = addressList:getMemoryRecordByDescription('bombs')
  local ropes  = addressList:getMemoryRecordByDescription('ropes')

  setProperty(Inventory.HealthEdit,"Text", health:getValue())
  setProperty(Inventory.BombsEdit, "Text", bombs:getValue())
  setProperty(Inventory.RopesEdit, "Text", ropes:getValue())
end

function InventoryWindow.init()

  -- show the inventory window
  form_show(Inventory)

  -- let us close the window
  function CloseClick()
    closeCE()
    return caFree
  end
  Inventory.OnClose = CloseClick

  -- initialize the stat values
  Inventory.OnActivate = fetchStats
end

function InventoryWindow.AboutButtonClick(sender)
  showMessage(helpText)
end

function InventoryWindow.ToggleInventory(sender)
  local cheatEntry = addressList:getMemoryRecordByDescription(sender.getCaption())

  if (sender.getState() == 1) then
    cheatEntry:setValue(1)
  else
    cheatEntry:setValue(0)
  end
end

function InventoryWindow.StatEditChange(sender)
  local value      = getProperty(sender, 'Text')
  local cheatEntry = addressList:getMemoryRecordByDescription(getProperty(sender, 'Hint'))

  if (value ~= '') or (value ~= '??') then
    cheatEntry:setValue(value)
  end
end

return InventoryWindow
