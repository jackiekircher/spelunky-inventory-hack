package.loaded['spelunky-map-object'] = nil
require "spelunky-map-object"

local RadarWindow = {}

local bg     = Radar.RadarImage
local canvas = bg.getCanvas()
local brush  = canvas.getBrush()

local cRed   = 858083
local cGreen = 35653
local cGrey  = 8684676
local cWhite = 16777215

-- timer
local timer = createTimer(nil, true)

local function startTimer()
  timer.setInterval(100)
  timer.setEnabled(true)
end

local function pauseTimer()
  timer.setEnabled(false)
end

-- canvas
local function clearCanvas()
  brush.setColor(0)
  canvas.clear()
end

local function drawSquare(x, y, color)
  x = tonumber(x)
  y = tonumber(y)
  if (x == nil) or (y == nil) then return end   -- can't draw this

  -- map runs from 2.8,99.3 to 42.2,68
  local mapx =   (x-2.8) * (400/39.4)  - 5
  local mapy = (-((y-68) / 31.3) + 1) * 300 - 5

  brush.setColor(color)
  canvas.fillRect(mapx, mapy, mapx+10, mapy+10)
end

local function drawPlayer()
  local playerx = addressList.getMemoryRecordByDescription('player x')
  local playery = addressList.getMemoryRecordByDescription('player y')

  drawSquare(playerx:getValue(), playery:getValue(), cWhite)
end

local function drawEnemies()
  clearCanvas()
  drawPlayer()

  -- locate map object array from the cheat table
  mapObjects = addressList.getMemoryRecordByDescription('object pointer array')

  -- get the address of the first object
  mapObjectsAddress = tonumber(mapObjects:getValue(), 16)
  objectAddress = readPointer(mapObjectsAddress)

  while (objectAddress ~= 0) do
    -- initialize a new object
    o = MapObject.new(objectAddress)

    if o:isEnemy() then
      local color = cGrey

      if o:isAlive() then
        if o:isDamsel() then
          color = cGreen
        else
          color = cRed
        end
      end

      drawSquare(o.x, o.y, color)
    end

    mapObjectsAddress = mapObjectsAddress + 0x04
    objectAddress = readPointer(mapObjectsAddress)
  end

end

function RadarWindow.init()

  -- show the inventory window
  form_show(Radar)

  -- destroy the timer when the window is closed
  local function RadarCloseClick()
    timer.destroy()
    return caFree
  end
  Radar.OnClose = RadarCloseClick

  -- setup pause/resume popup menu
  local function ToggleRadarTimer(sender)
    if (sender.getCaption() == 'pause') then
      pauseTimer()
      sender.setCaption('resume')
    else
      startTimer()
      sender.setCaption('pause')
    end
  end
  Radar.PopupMenu1.getItems().getItem(0).setOnClick(ToggleRadarTimer)

  -- redraw radar every 200ms
  timer.setOnTimer(drawEnemies)
  startTimer()
end

return RadarWindow
