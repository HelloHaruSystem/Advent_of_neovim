-- This is a comment in Lua.


--[[ This is also
	a comment.

	but it spans multiple lines!
--]]

-- local
local number = 5
local string = "hello world"
local single 'also a string'
local crazy = [[ multi
	line literal ]]

local truth, lies = true, false
local nothing = nil

-- functions are first class
local function hello(name)
	print("Hello," name)
end

local greet = function(name)
	-- .. is a string concatenation
	print("Greetings, " .. name .. "!")
end

local higher_order = functions(value)
	return function(another)
		return value + another
	end
end

local add_one = higher_order(1)
print("add_one(2) -> ", add_one(2))


