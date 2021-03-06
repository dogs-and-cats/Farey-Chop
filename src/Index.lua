local function Farey(Number, Iterations)
    local Integer, Decimal = math.modf(Number)

    local LowerRangeMin, LowerRangeMax = 0, 1
    local UpperRangeMin, UpperRangeMax = 1, 1

    local MediantMin, MediantMax = LowerRangeMin + UpperRangeMin, LowerRangeMax + UpperRangeMax
    local MediantCompare = MediantMin / MediantMax

    for I = 1, Iterations do
        if (Decimal < MediantCompare) then
            UpperRangeMin, UpperRangeMax = MediantMin, MediantMax
        elseif (Decimal > MediantCompare) then
            LowerRangeMin, LowerRangeMax = MediantMin, MediantMax
        end

        MediantMin, MediantMax = LowerRangeMin + UpperRangeMin, LowerRangeMax + UpperRangeMax
        MediantCompare = MediantMin / MediantMax
    end

    return MediantMin + MediantMax * Integer, MediantMax
end

local Input = io.read()
local Iterations = io.read()

local Start = os.clock()
local X, Y = Farey(Input, Iterations)

print("Took: ", os.clock() - Start, "seconds.")
print(X .. "/" .. Y)
