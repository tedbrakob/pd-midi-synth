import "CoreLibs/graphics"

local pd <const> = playdate
local gfx <const> = pd.graphics

gfx.drawTextAligned("Open this url to use:", 200, 100, kTextAlignment.center)
gfx.drawTextAligned("tedbrakob.github.io/pd-midi-synth-controller", 200, 140, kTextAlignment.center)

local numberOfConcurrentNotes = 64
local inst = pd.sound.instrument.new()
local damperPedal = 0
local damperNotes = {}

for _ = 1, numberOfConcurrentNotes, 1 do
    inst:addVoice(pd.sound.synth.new(pd.sound.kWaveSine))
end

local function noteOn(note, velocity)
    inst:playMIDINote(note, velocity)
end

local function noteOff(note)
    if damperPedal == 1 then
        table.insert(damperNotes, note)
        return
    end

    inst:noteOff(note)
end

local function releaseDamperNotes()
    for _, note in ipairs(damperNotes) do
        inst:noteOff(note)
    end

    damperNotes = {}
end

function pd.serialMessageReceived(encodedMessage)
    local message = json.decode(encodedMessage)

    if message.type == 'noteon' then
        noteOn(message.note, message.velocity)
    end

    if message.type == 'noteoff' then
        noteOff(message.note)
    end

    if message.type == 'damperpedal' then
        damperPedal = message.value

        if damperPedal == 0 then
            releaseDamperNotes()
        end
    end
end

function pd.update()

end
