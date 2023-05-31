function resetAll() {
	list = SVG.find('g.unpowered')
	list.removeClass('powered')
	SVG.find('g g.go').removeClass('go')
}

// (text)			: Description
// (num) 			: start position only. set myself (obsolete)
// (num, arr)		: set these too, unconditionally
// (num, arr, num)	: set these too, if previous is num

// You tried being directionally insensitive. It didn't work

function fillPath(Pattern, directedPath, allowToggle = false) {


	if(Pattern[1] == directedPath[1]) {
		// doing myself
		if (Pattern[2] === undefined) {
			console.warn("Patching pattern");
			Pattern[2] = [Pattern[1]]
		}

		console.info("DirectedPath in: [" + directedPath.toString() + "]"
			+ "allowToggle: " + allowToggle)

		console.log(Pattern);
	}
	else {
		//console.log("Not me: " + Pattern[1] + " " + directedPath[1]);

		return // not me
	}


	for (step of Pattern[2]) {
		if (
			directedPath[1] == Pattern[1] && directedPath[0] == Pattern[3]
			||
			directedPath[1] == Pattern[1] && Pattern[3] === undefined
			) {

			console.log(Pattern[0] + " :::: " + directedPath.toString() 
				+ " with step: " + step)

			step = step.toString()

			// Toggle
			if (directedPath[0] == directedPath[1] && Pattern[0] == 'Myself' && allowToggle) {
				togglestep = directedPath[0].toString()

				togglestep = togglestep.charAt(0) + '_' + togglestep.charAt(1);

				console.log('toggleClass: g#gleis' + togglestep);
				SVG.find('g#gleis' + togglestep).toggleClass("powered");
			}
			else if (step.charAt(0) == "-") {
				if(step.length == 3) { step = step.charAt(1) + '_' + step.charAt(2);	}
				if(step.length == 4) { step = step.charAt(1) + step.charAt(3);			}

				console.log('removeClass: g.powered#gleis' + step);
				SVG.find('g.powered#gleis' + step).removeClass('powered');
			}
			else {
				if(step.length == 2) { step = step.charAt(0) + '_' + step.charAt(1);	}
				if(step.length == 3) { step = step.split('0').join('');			}

				console.log('addClass: g#gleis' + step);
				SVG.find('g#gleis' + step).addClass('powered');
			}
		} // end if

		// Do we even know the switch positions?
		if (SVG.find('g#gleis7_1').hasClass("powered") && SVG.find('g#gleis1_2').hasClass("powered")) {

		}
	} // end for
}
