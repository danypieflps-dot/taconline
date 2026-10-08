function camThing_setupOffsets()
	camThing_addBF(700, 140)
	camThing_addDad(600, -150)
	camThing_setOffset(25)
	camThing_setAngle(0.3)
end

function onStepHit()
    if curStep == 480 then
		camThing_addDad(-100, 350)
		setProperty('cameraSpeed', 0.8)
	end

	if curStep == 512 then
		camThing_addDad(200, -250)
	end
end

