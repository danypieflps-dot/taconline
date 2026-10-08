function camThing_setupOffsets()
	camThing_addBF(200, 170)
	camThing_addDad(700, 170)
	camThing_setOffset(25)
	camThing_setAngle(0.3)
end

function onStepHit()
    if curStep == 1530 then
		camThing_addDad(0, 260)
	end
	if curStep == 1536 then
		camThing_addDad(0, -260)
	end
end
