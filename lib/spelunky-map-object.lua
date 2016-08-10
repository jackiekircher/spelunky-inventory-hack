MapObject = {}
MapObject.__index = MapObject

function MapObject.new(address)
  local self = setmetatable({}, MapObject)

  self.address = address
  self.id      = readInteger(self.address+12)
  self.x       = readFloat(self.address+48)
  self.y       = readFloat(self.address+52)
  self.health  = readInteger(self.address+320)

  return self
end

function MapObject:isAlive()
  return self.health > 0
end

function MapObject:isDamsel()
  return self.id == 1005
end

function MapObject:isEnemy()
  return ((self.id > 1000) and (self.id < 1057))
end

function MapObject:isHumanoid()
  return ((self.id == 1004) or  -- caveman
          (self.id == 1005) or  -- damsel
          (self.id == 1006) or  -- shopkeeper
          (self.id == 1009) or  -- yeti
          (self.id == 1011) or  -- hawk man
          (self.id == 1014) or  -- mummy
          (self.id == 1015) or  -- monkey
          (self.id == 1019) or  -- jiang shi
          (self.id == 1020) or  -- vampire
          (self.id == 1025) or  -- yeti king
          (self.id == 1028) or  -- vlad
          (self.id == 1031) or  -- devil
          (self.id == 1033) or  -- anubis
          (self.id == 1041) or  -- tiki man
          (self.id == 1044) or  -- croc man
          (self.id == 1045) or  -- green knight
          (self.id == 1049) or  -- black knight
          (self.id == 1051) or  -- succubus
          (self.id == 1052) or  -- horse head
          (self.id == 1053) or  -- ox face
          (self.id == 1054) or  -- anubis II
          (self.id == 1056))    -- yama
end

function MapObject:type()
  if (self.id == 0x03E9) then
    return "snake"
  elseif (self.id == 0x03EA) then
    return "spider"
  elseif (self.id == 0x03EB) then
    return "bat"
  elseif (self.id == 0x03EC) then
    return "caveman"
  elseif (self.id == 0x03ED) then
    return "damsel"
  elseif (self.id == 0x03EE) then
    return "shopkeeper"
  elseif (self.id == 0x03EF) then
    return "frog"
  elseif (self.id == 0x03F0) then
    return "man"
  elseif (self.id == 0x03F1) then
    return "yeti"
  elseif (self.id == 0x03F2) then
    return "ufo"
  elseif (self.id == 0x03F3) then
    return "hawk"
  elseif (self.id == 0x03F4) then
    return "skeleton"
  elseif (self.id == 0x03F5) then
    return "pirahna"
  elseif (self.id == 0x03F6) then
    return "mummy"
  elseif (self.id == 0x03F7) then
    return "monkey"
  elseif (self.id == 0x03F8) then
    return "alien"
  elseif (self.id == 0x03F9) then
    return "ghost"
  elseif (self.id == 0x03FA) then
    return "giant"
  elseif (self.id == 0x03FB) then
    return "jiang"
  elseif (self.id == 0x03FC) then
    return "vampire"
  elseif (self.id == 0x03FD) then
    return "fire"
  elseif (self.id == 0x03FE) then
    return "tunnel"
  elseif (self.id == 0x03FF) then
    return "old"
  elseif (self.id == 0x0400) then
    return "scarab"
  elseif (self.id == 0x0401) then
    return "yeti"
  elseif (self.id == 0x0402) then
    return "alien"
  elseif (self.id == 0x0403) then
    return "magma"
  elseif (self.id == 0x0404) then
    return "vlad"
  elseif (self.id == 0x0405) then
    return "scorpion"
  elseif (self.id == 0x0406) then
    return "imp"
  elseif (self.id == 0x0407) then
    return "devil"
  elseif (self.id == 0x0408) then
    return "killer"
  elseif (self.id == 0x0409) then
    return "anubis"
  elseif (self.id == 0x040A) then
    return "queen"
  elseif (self.id == 0x040B) then
    return "bacterium"
  elseif (self.id == 0x040C) then
    return "cobra"
  elseif (self.id == 0x040D) then
    return "spinner"
  elseif (self.id == 0x040E) then
    return "giant"
  elseif (self.id == 0x040F) then
    return "mammoth"
  elseif (self.id == 0x0410) then
    return "alien"
  elseif (self.id == 0x0411) then
    return "tiki"
  elseif (self.id == 0x0412) then
    return "scorpion"
  elseif (self.id == 0x0413) then
    return "snail"
  elseif (self.id == 0x0414) then
    return "croc"
  elseif (self.id == 0x0415) then
    return "green"
  elseif (self.id == 0x0416) then
    return "worm"
  elseif (self.id == 0x0417) then
    return "worm"
  elseif (self.id == 0x0418) then
    return "alien"
  elseif (self.id == 0x0419) then
    return "black"
  elseif (self.id == 0x041A) then
    return "golden"
  elseif (self.id == 0x041B) then
    return "succubus"
  elseif (self.id == 0x041C) then
    return "horse"
  elseif (self.id == 0x041D) then
    return "ox"
  elseif (self.id == 0x041E) then
    return "anubis"
  elseif (self.id == 0x041F) then
    return "olmec"
  elseif (self.id == 0x0420) then
    return "yama"
  else
    return string.format("%x", self.id)
  end
end

function MapObject:position()
  return string.format("x: %2.2f,\t y: %2.2f", self.x, self.y)
end

function MapObject:printPosition()
  print(self:position())
end
