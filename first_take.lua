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

-- Functions: Multiple returns
-- functions can return multiple values

local returns_four_values = function()
	return 1, 2, 3, 4
end

first, second, last = returns_four_values()

-- Example 1
print("first: ", first)
print("second:", second)
print("last:  ", last)
-- the `4` is discarded :(

-- Example 2
local variable_arguments = function( ... )
	local arguments = { ... }
	for i, v in ipairs({ ... }) do print(i, v) end
	return unpack(arguments)
end

print("=========================")
print("1:", variable_arguments("Hello", "world", "!"))
print("=========================")
print("2:", variable_arguments("Hello", "world", "!"), "<lost>")

-- String Shorthand
local single_string = function(s)
	return s .. " - WOW!"
end

local x = single_string("hi")
local y = single_string "hi"
print(x, y)

-- Table Shorthand
local setup = function(opts)
	if opts.default == nil then
		opts.default = 17
	end

	print(opts.default, opts.other)
end

setup { default = 12, other = false }
setup { other = true }

-- Functions: Colon Functions
local MyTable = {}

function MyTable.something(self, ... ) end
functions MyTable:something( ... ) end     -- syntax sugar the use of : = the . and the self argument

-- Metatables
local vector_mt = {}
vector_mt.__add = function(left, right)
	return setmetatable({
		left[1] + right[1],
		left[2] + right[2],
		left[3] + right[3],
	}, vector_mt)
end

local v1 = setmetatable({ 3, 1, 5 }, vector_mt)
local v2 = setmetatable({ -3, 2, 2 }, vector_mt)
local v3 = v1 + v2
vim.print(v3[1], v3[2], v3[3])
vim.print(v3 + v3)

-- Metatable 2
local fib_mt = {
	__index = function(self, key)
		if key < 2 then return 1 end
		-- Update the table, to save the intermediate results
		self[key] = self[key - 2] + self[key - 1]
		-- return the result
		return self[key]
	end
}

local fib = setmetatable({}, fib_mt)

print(fib[5])
print(fib[1000])

-- Other notable fields:
-- - `__newindex(self, key, value)`
-- - `__call(self, ... ) `
-- These can be overwritten

-- Quick Neovim things for keymapping
-- vim.keymap("n", "<space><space>x", "<cmd>source %<CR>")
-- vim.keymap("n", "<space>x", ":.lua<CR>")
-- vim.keymap("v", "space>x, ":lua<CR>")


