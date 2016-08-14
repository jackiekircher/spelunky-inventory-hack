package.loaded['spelunky-map-object'] = nil
require "spelunky-map-object"

local RadarWindow = {}

local canvas
local brush
local radarImage = createImage(Radar)
local level = 0

-- colors
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

-- levels
local function levelBg()
  if level > 16 then
    return 'images/hellbg.png'
  elseif level > 12 then
    return 'images/templebg.png'
  elseif level > 8 then
    return 'images/icebg.png'
  elseif level > 4 then
    return 'images/junglebg.png'
  else
    return 'images/minebg.png'
  end
end

local function borderBg()
  if level > 16 then
    return 'images/radar-border-hell.png'
  else
    return 'images/radar-border.png'
  end
end

local function updateBg()
  local currentLevel = addressList.getMemoryRecordByDescription('level')
  currentLevel = tonumber(currentLevel.getValue())

  if currentLevel == level then
    return
  end

  level = currentLevel
  local bgPicture = Radar.Background.getPicture()
  bgPicture.loadFromFile(levelBg())
  local borderPicture = Radar.Border.getPicture()
  borderPicture.loadFromFile(borderBg())
end

-- canvas
local function newFrame()
  image = createImage(Radar)
  image.setWidth(400)
  image.setHeight(300)
  image.setTop(20)
  image.setLeft(20)
  image.setTransparent(true)

  bitmap = image.getPicture().getBitmap()
  bitmap.setWidth(image.getWidth())
  bitmap.setHeight(image.getHeight())
  bitmap.setTransparentColor(0)

  canvas = image.getCanvas()
  brush  = canvas.getBrush()

  return image
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
  updateBg()

  -- create a fresh image to draw the next frame of the radar
  image = newFrame()

  -- draw the player
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

  -- destroy the old image so we don't kill memory
  radarImage.destroy()
  radarImage = image
end

function RadarWindow.init()

  -- show the inventory window
  form_show(Radar)

  -- destroy the timer when the window is closed
  local function RadarCloseClick()
    radarImage.destroy()
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
  -- drawEnemies()
end

return RadarWindow
