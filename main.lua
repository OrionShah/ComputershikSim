debug = true
local startTime;
local locTimeSeconds = 0;
local locTimeMinutes = 0;
local locTimeHours = 0;

require("player");
require("test");


local ui = require 'ui'

function love.load(arg)
	  ui.registerEvents()
	  startTime = love.timer.getTime();
	  print(player);
end

function love.update(dt)

end

function love.draw(dt)

	love.graphics.setBackgroundColor(255, 255, 255);
	love.graphics.setColor(0, 0, 0);
	-- системная инфа
	local startX = 10;
	local startY = 10;
	local major, minor, revision, codename = love.getVersion();
    local version = string.format("LOVE v. %d.%d.%d - %s", major, minor, revision, codename);
    local os = love.system.getOS();

    local FPSnum = love.timer.getFPS();
    local TimeNum = love.timer.getTime();
    local FPS = string.format("FPS: %d", FPSnum);
    local Time = string.format("Time: %d", TimeNum);

    local x, y = love.mouse.getPosition();
    local pos = string.format("x: %d y: %d ", x, y);

    locTimeSeconds = TimeNum - startTime;
    if (locTimeSeconds > 59) then
    	locTimeMinutes = locTimeMinutes + 1;
    	locTimeSeconds = 0;
    end
    if (locTimeMinutes > 59) then
    	locTimeHours = locTimeHours + 1;
    	locTimeMinutes = 0;
    end

    time = string.format("Time from start: %d:%d:%d", locTimeHours, locTimeMinutes, locTimeSeconds);

	love.graphics.print(version, startX+5, startY+5);
	love.graphics.print(os, startX+5, startY+20);
	love.graphics.print(FPS, startX+5, startY+35);
	love.graphics.print(Time, startX+5, startY+50);
	love.graphics.print(pos, startX+5, startY+65);
	love.graphics.print(time, startX+5, startY+80);
	player.print();
end