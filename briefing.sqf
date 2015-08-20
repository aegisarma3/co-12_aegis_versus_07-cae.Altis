/* Briefing
 * The briefing can be defined by calling FHQ_TT_addBriefing.
 * The array is built like this.
 * The first element should be a filter (side, group, faction, or a piece of script). All units matching the 
 * filter will see the briefing
 * This is followed by pairs of strings, a head line, and an actual text.
 * Briefings are added in the order in which they appear for any unit that matches
 * the last filter.
 */
[
	{true}, 
		["Mission",
			"<marker name='perditus_start'>Perditus</marker> and <marker name='derelictus_start'>Derelictus</marker> will ambush the fuel <marker name='obj1'>transport convoy</marker>, seize the <marker name='obj2'>temporary prison camp</marker> and cover the inmates' escape by neutralizing the immediate AAF <marker name='obj3'>response</marker> before disappearing to the <marker name='obj4'>south</marker>."],
			
		["Situation",
			"January 24th 2025: eight hours ago PMC Versus local high command (callsign 'Corona') learned that the Altian maximum security prison was partly destroyed in a gas explosion and the most dangerous inmates are being relocated to a <marker name='obj2'>temporary prison camp</marker> by the AAF forces for tonight. Corona has seen this as an opportunity to liberate the prisoners and wreak havoc among the Altian populace. Two Versus teams have been inserted near the prison camp: the <marker name='perditus_start'>surgical team</marker> (callsign 'Perditus') on the and the <marker name='derelictus_start'>supporting team</marker> (callsign'Derelictus').<br/><br/>Corona wants the Versus operators to eliminate the AAF forces guarding the temporary camp and also neutralize the immediate AAF <marker name='obj3'>response</marker> thus allowing the inmates to escape in the cover of darkness and fog.<br/><br/>Corona has learned that a fuel transport <marker name='obj1'>convoy</marker> is moving towards the temporary camp from the east to provide fuel for the generators meant to keep the prisoners warm for the night. Corona wants Versus operators to ambush the transport and make sure all the vehicles are destroyed. The loss of this much fuel and transport vehicles will surely hurt the AAF forces. Should the convoy reach the temporary prison camp, Versus operators are met with additional resistance. When all the objectives have been completed, Versus teams are to leave the AO to the <marker name='obj4'>south</marker>."],

		["Enemy",
			"The temporary camp is being guarded by the local AAF forces. PMC Versus reconnaissance satellite Hannibal-6 is picking up approximately 10 foot mobiles and 2 alpha victors. The AAF response will most likely come from the west since a squad-sized garrison is located in the village of Krya Nera. The second nearest AAF force is believed to be near the airstrip to the south-west. Should everything go as planned, Versus operators have left the AO long before the troops at the airstrip can respond. The convoy is currently on the move and Hannibal-6 has confirmed three victors in tight column formation.<br/><br/>Corona reminds the Versus operators that the prisoners are extremely dangerous and are not to be let near any weapons. Corona has learned that among the prisoners are i.a. Theodoros the Mangler, Kleitos 'The Eel' Panagos and Origenes of Pyrsos. On a more positive note, Corona made a fishing trip to the southern Altis last week and dug up the Versus equipment left there last November. Enjoy."],

		["Callsigns",
			"Corona: local high command operating at FOB Aurum.<br/>Perditus: surgical element, based at FOB Cuprum.<br/>Derelictus: supporting element, based at FOB Ferrum."],
            
        ["Additional",
			"PMC Versus uses FHQ Task Tracker to provide operators with briefings and tasks.<br/><br/>The AAF's highly volatile fuel reserves are mixed by a mysterious chemist behind the pseudonym 'JohnnyBoy'."]
    
] call FHQ_TT_addBriefing;

[
	{true},                                                         // Filter
    	["task1",										// Task name
         "Ambush the fuel <marker name='obj1'>transport convoy</marker>. Destroy all the vehicles.",				       // Task text in briefing
         "Ambush the transport.",							// Task title in briefing
         "courier"										// Waypoint text

        ],
        ["task2",										// Task name
         "Seize the <marker name='obj2'>temporary prison camp</marker>.",				       // Task text in briefing
         "Seize the camp.",							// Task title in briefing
         "commander"											// Waypoint text
        ],
        
		["task3",										// Task name
         "Stay in the vicinity and neutralize any <marker name='obj3'>threats</marker> against the fleeing prisoners.",				       // Task text in briefing
         "Cover the prison break.",							// Task title in briefing
         "ammo trucks"											// Waypoint text
        ],
        
        ["task4",										// Task name
         "Disappear <marker name='obj4'>south</marker>.",				       // Task text in briefing
         "Disappear.",							// Task title in briefing
         "ammo trucks"											// Waypoint text
        ]

] call FHQ_TT_addTasks;