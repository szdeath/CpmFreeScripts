GLabel = 'Car Parking 2'
GProcess = 'com.olzhas.carparking.multyplayer2'

local versions = {"1.3.1.3"}
local v = gg.getTargetInfo()
local supported_version = false
for i, version in ipairs(versions) do
    if v.versionName == version then
        supported_version = true
        GVersion = version
        break
    end
end

if not supported_version then
    gg.alert("This script is for game Version:\n" .. table.concat(versions, "\n") .. "\n\nYour Game Version is:\n" .. v.versionName)
    os.exit()
end

if v.processName ~= GProcess then
    gg.alert("This Script is for:\n" .. GLabel .. "\n" .. GProcess .. "\n\nYou Select:\n" .. v.label .. "\n" .. v.processName)
    os.exit()
end

if GVersion ~= v.versionName then
    gg.alert("This script is for game Version:\n" .. GVersion .. "\n\nYour Game Version is:\n" .. v.versionName)
    gg.setVisible(false)
    os.exit()
end

function TesterLua() end
function setvalue(address,flags,value) TesterLua('Modify address value(Address, value type, value to be modified)')
local tt = {}
tt[1]= {}
tt[1].address = address
tt[1].flags = flags
tt[1].value = value
gg.setValues(tt)
end
----------------------------------------------------------------------------------------------------------------
gg.alert("👤 Death Gun Script | Car Parking v1.3.1.3 (FREE)\n 𝗙𝗼𝗹𝗹𝗼𝘄 𝗺𝗲\n[ 🅾 ] Instagram: szrikz_\n[ ▶︎] Youtube: Ikki\n[ ꚠ ] TikTok: szdeath_ ")

gg.setVisible(false)
gg.clearList()
gg.toast("Auto Bypass Actived ✅")
gg.clearResults()

local TAG = "DEATH GUN"

function get_lib()
    local ranges = gg.getRangesList("libil2cpp.so")
    if not ranges or #ranges < 2 then
        gg.toast("libil2cpp not found")
        return nil
    end
    return ranges[2].start
end

function setvalue(address, flags, value)
    local v = {address = address, flags = flags, value = value, freeze = true}
    gg.addListItems({v})
    gg.removeListItems({v})
end

-- ========================
-- MOD MODULES
-- ========================

function do_money()
    gg.setVisible(false)
    local base = get_lib()
    if not base then return end

setvalue(base + 0x3839B64, gg.TYPE_DWORD, 310934496)
setvalue(base + 0x3839B64 + 0x4, gg.TYPE_DWORD, 1923712960)
setvalue(base + 0x3839B64 + 0x8, gg.TYPE_DWORD, 505872384)
setvalue(base + 0x3839B64 + 0xC, gg.TYPE_DWORD, -698416192)

    gg.toast("💰 50M Money Added")
        gg.setVisible(false)
end

function do_unlock_all()
    gg.setVisible(false)
    local base = get_lib()
    if not base then return end

    local offsets = {
        0x3F9CB30, 0x3F9C8E0, 0x3F9CC28,
        0x3D975E4, 0x3F4C1E4,
        0x3B8C378, 0x3FA2E00
    }

    for _, off in ipairs(offsets) do
        setvalue(base + off, gg.TYPE_DWORD, -763363296)
        setvalue(base + off + 0x4, gg.TYPE_DWORD, -698416192)
    end

    gg.toast("🔓 All Unlocked!")
        gg.setVisible(false)
end

function do_airsus()
    gg.setVisible(false)
    local base = get_lib()
    if not base then return end

setvalue(base + 0x40C2250, gg.TYPE_DWORD, -763363296)
setvalue(base + 0x40C2250 + 0x4, gg.TYPE_DWORD, -698416192)

    gg.toast("🚓 Police Enabled")
        gg.setVisible(false)
end

function do_fuel()
    gg.setVisible(false)
    local base = get_lib()
    if not base then return end

    setvalue(base + 0x39F69A4, gg.TYPE_DWORD, -763363328)
    setvalue(base + 0x39F69A4 + 0x4, gg.TYPE_DWORD, -698416192)

    gg.toast("⛽ Unlimited Fuel Enabled")
        gg.setVisible(false)
end

-- ========================
-- MENU
-- ========================

function main_menu()
gg.toast(" Death Gun Script ")
    local menu = gg.choice({
        "〇 50m Money",
        "〇 Unlock All",
        "〇 Unlock Police",
        "〇 Unlimited Fuel",
        "[[𝘌𝘹𝘪𝘵 𝘚𝘤𝘳𝘪𝘱𝘵]]",
 }, nil, "👑  YouTube  𝘿𝙚𝙖𝙩𝙝 𝙂𝙪𝙣 👑")

    if not menu then return end

    if menu == 1 then do_money()
    elseif menu == 2 then do_unlock_all()
    elseif menu == 3 then do_airsus()
    elseif menu == 4 then do_fuel()
    elseif menu == 5 then Exit()
    end
end

function Exit()
gg.clearResults()
gg.clearList()
  print(" Death Gun Script ") 
  gg.setVisible(true)
  os.exit()
end

while true do
    if gg.isVisible(true) then
        gg.setVisible(false)
        main_menu()
    end
    gg.sleep(100)
end
