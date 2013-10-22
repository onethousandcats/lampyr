-----------------------------------------------------------------------------------------
--
-- LAMPYR GAME
--
-----------------------------------------------------------------------------------------

local w = display.viewableContentWidth
local h = display.viewableContentHeight

local s = display.newGroup()
local front = display.newGroup();

local confetti = {
	container = display.newRect( 0, 0, w, h ),
	reflectX = true,
}

local background = display.newRect(0, 0, w, h)
background:setFillColor( 225, 225, 225 )
s:insert( background, true )
background.x = w/2; background.y = h/2
background.width = w; background.height = h;

local num_c = 1000;

local width_c = 20;

for i=1, num_c do

	local c = display.newRect(0, 0, width_c, width_c)

	c.x = math.random( 1, w - 10 ) + 10
	c.y = math.random( -h, h )

	c.vx = math.random(-1, 1)
	c.vy = math.random(1, 6)

	c.alpha = .6

	local r = math.random(0, 255)
	local g = math.random(0, 255)
	local b = math.random(0, 255)

	print(r)

	c:setFillColor( r, g, b )

	confetti[ #confetti + 1 ] = c

end

function confetti:enterFrame( event )

	for _,c in ipairs( confetti ) do

		c:translate( c.vx, c.vy )

		if ( c.alpha > 0 and c.y > 0 ) then
			c.alpha = c.alpha - .002
		end

		if ( c.y > h ) then
			c.y = -10
			c.alpha = 1
		end

	end

end

Runtime:addEventListener( "enterFrame", confetti )