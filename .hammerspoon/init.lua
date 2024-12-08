--local logger = hs.logger.new("blah", "debug")
--logger.d("init")

--hs.loadSpoon('ControlEscape'):start()

-- Easy system-wide shortcuts for my most-used apps
hs.hotkey.bind({"ctrl"}, "1", function()
    hs.application.launchOrFocus("Alacritty")
end)

hs.hotkey.bind({"ctrl"}, "2", function()
    hs.application.launchOrFocus("Firefox")
end)

hs.hotkey.bind({"ctrl"}, "3", function()
    hs.application.launchOrFocus("Slack")
end)

-- Map back/forward mouse buttons for my Logitech MX Master 3S
blah = hs.eventtap.new({hs.eventtap.event.types.otherMouseDown}, function(event)
  button = event:getProperty(hs.eventtap.event.properties.mouseEventButtonNumber)

  if (button == 3) then
    hs.eventtap.keyStroke({"cmd"}, "[")
    return true
  end

  if (button == 4) then
    hs.eventtap.keyStroke({"cmd"}, "]")
    return true
  end

  if (button == 5) then
    hs.spaces.toggleMissionControl()
    return true
  end

  return false
end):start()

function audioDeviceChanged(arg)
    local elgato = hs.audiodevice.findInputByName('Elgato Wave:3')
    elgato:setDefaultInputDevice()
end

hs.audiodevice.watcher.setCallback(audioDeviceChanged)
hs.audiodevice.watcher.start()
