--local logger = hs.logger.new("blah", "debug")
--logger.d("init")

--hs.loadSpoon('ControlEscape'):start()

-- Easy system-wide shortcuts for my most-used apps
hs.hotkey.bind({"ctrl"}, "1", function()
    hs.application.launchOrFocus("iTerm")
end)

hs.hotkey.bind({"ctrl"}, "2", function()
    hs.application.launchOrFocus("Firefox")
end)

hs.hotkey.bind({"ctrl"}, "3", function()
    hs.application.launchOrFocus("Slack")
end)

-- Helper function for mapping the media keys below
function systemKey(key)
  return function ()
    hs.eventtap.event.newSystemKeyEvent(key, true):post()
    hs.eventtap.event.newSystemKeyEvent(key, false):post()
  end
end

-- Map the media keys for my Durgod Taurus keyboard
hs.hotkey.bind({}, 'F1', systemKey("PLAY"), nil, systemKey("PLAY"))
hs.hotkey.bind({}, 'F3', systemKey("PREVIOUS"), nil, systemKey("PREVIOUS"))
hs.hotkey.bind({}, 'F4', systemKey("NEXT"), nil, systemKey("NEXT"))
hs.hotkey.bind({}, 'F5', systemKey("MUTE"), nil, systemKey("MUTE"))
hs.hotkey.bind({}, 'F6', systemKey("SOUND_DOWN"), nil, systemKey("SOUND_DOWN"))
hs.hotkey.bind({}, 'F7', systemKey("SOUND_UP"), nil, systemKey("SOUND_UP"))

-- Map back/forward mouse buttons for my old Alienware mouse in Firefox
blah = hs.eventtap.new({hs.eventtap.event.types.otherMouseDown}, function(event)
    button = event:getProperty(hs.eventtap.event.properties.mouseEventButtonNumber)
    current_app = hs.application.frontmostApplication()
    firefox = hs.application.find("Firefox")
    safari = hs.application.find("Safari")

    if (current_app == firefox or current_app == safari) then
        if (button == 3) then
            hs.eventtap.keyStroke({"cmd"}, "[")
            return true
        elseif (button == 4) then
            hs.eventtap.keyStroke({"cmd"}, "]")
            return true
        end
    end

    return false
end):start()
