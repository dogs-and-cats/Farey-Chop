local function farey_chop(x, n)
    local i, d = math.modf(x)

    local l_min, l_max = 0, 1
    local u_min, u_max = 1, 1

    local m_min, m_max = l_min + u_min, l_max + u_max 
    local m_c = m_min / m_max

    local j = 0
    while j < n and d ~= m_c do
        if d < m_c then
            u_min, u_max = m_min, m_max
        else
            l_min, l_max = m_min, m_max
        end

        m_min, m_max = l_min + u_min, l_max + u_max
        m_c = m_min / m_max
        j = j + 1
    end

    return m_min + m_max * i, m_max
end

local input = io.read()
local count = io.read() + 0 -- abuse of type casting

local start = os.clock()
local x, y = farey_chop(input, count)

print("took: ", os.clock() - start, "seconds.", "\n",
    x, "/", y)
