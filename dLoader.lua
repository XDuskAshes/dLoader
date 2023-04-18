--[[
    dLoader 1.0
    Created in 20 f---ing minutes on 4/18/2023
    Created by Dusk (Dusk#0834)
    Make your thing detectable by adding '--for dLoader' at the first line
    probably inneficient code
--]]

if fs.exists(".tmp/") == true then
    fs.delete(".tmp/")
end

term.clear()
term.setCursorPos(1,1)
print("dLoader - An Adventure Modloader [1.0]")
print("By Dusk")
print("Provide a path to a mod to load.")
print(" ")
local input = read()
local f = fs.open(input,"r")

local modfile = input
if fs.exists(input) == true then
    if f.readLine(1) == "--for dLoader" then
        sleep(0.1)
        print("File is valid!")
        print("Start loading process...")
        sleep(1)
    else
        error("Invalid file type.")
    end
end

term.clear()
term.setCursorPos(1,1)
print("-BEGIN LOAD-")
print(" ")
print("Step 1: Create files")
print(" ")
sleep(0.3)
fs.makeDir(".tmp/")
print(".tmp/ created.")
sleep(0.3)
shell.run("copy rom/programs/fun/adventure.lua .tmp/adv-mod.lua")
if fs.exists(".tmp/adv-mod.lua") == false then
    error("Failure to create file to mod.")
end
print("Created moddable file.")
print(" ")
print("Step 2: Mod file")
shell.run(modfile)
print(" ")
print("Launching...")
textutils.slowPrint("==========")
sleep(1)
term.clear()
term.setCursorPos(1,1)
shell.run(".tmp/adv-mod.lua")