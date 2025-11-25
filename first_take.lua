-- This is a comment in Lua.


--[[ This is also
	a comment.

	but it spans multiple lines!
--]]

-- local
local number = 5
local string = "hello world"
local single = 'also a string'
local crazy = [[ multi
	line literal ]]

local truth, lies = true, false
local nothing = nil

-- functions are first class
local function hello(name)
	print("Hello, ", name)
end

local greet = function(name)
	-- .. is a string concatenation
	print("Greetings, " .. name .. "!")
end

local higher_order = function(value)
	return function(another)
		return value + another
	end
end

local add_one = higher_order(1)
print("add_one(2) -> ", add_one(2))

-- Only one way to store data in Lua
-- Tables!
-- same structure is used for maps and list

-- as a list
-- Lua lists starts at index 1 :(
local list = { "first", 2, false, function() print("Fourth!") end }
print("Yup, 1-indexed:", list[1])
print("Fourth is 4..", list[4])

-- as a map
local t = {
	literal_key = "a string",
	["an expression"] = "also works",
	[function() end] = true
}

print("literal_key    :  ", t.literal_key)
print("an expression  :  ", t.["an expression"])
print("function() end :  ", t.[function() end])

-- control flow
-- # is the length/count operator
local favorite_foods = { "ramen", "curry", "steak" }

-- remember to start at index 1!
for index = 1, #favorite_foods do
	print(index, favorite_foods[index])
end

for index, value in ipairs(favorite_foods) do
	print(index, value)
end

--  key value pair
local food_score = { pizza = 9.5, natto = 8.5 }
for key, value in pairs(food_score) do
	print(key, value)
end

-- if statements
local function action(loves_coffee)
	if loves_coffee then
		print("It's cool")
	else
		print("It's still cool")
	end
end

-- falsey: nil, false
action() -- same as: action(nil)
action(false)

-- Everything else is truthy
action(true)
action(0)
action({})
 then
	 print("It's cool")
	else
		print("It's still cool")
	end
end

-- falsey: nil, false
action() -- same as: action(nil)
action(false)

-- Everything else is truthy
action(true)
action(0)
action({})

-- Modules 
-- There isn't anything special about modules.
-- Modules are just files!

-- Example:
-- foo.lua
-- local M = {}
-- M.cool_function = function() end
-- return M

-- bar.lua
-- local foo = require('foo')
-- foo.cool_function()

-- It's a convetion to return a table usally called M for module 


