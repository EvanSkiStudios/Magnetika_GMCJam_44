//language id ref
enum game_langs{
	english = 0,
	spanish,
	japanese
}
//English should always be 0


function ETW_text_get_lang(lang=0){

/* =====How to use=====
struct_ref_game_uses_to_get_strings = {
	string_name_ref :  "string_value",
}*/

	switch(lang){
		
		default:
		case game_langs.english:{

			ETW_Text_lang = {
				level_1_intro: "Hello, Welcome to the Gauss Magnetics Corporation, [SUBJECT_NAME_HERE]. Your goal is simple, make it from point A to point B.",
				level_1_outro: "Very well done! The G.M.C would like to congratulate"+"\n"+"you on completing such a hard task.",
				
				level_2_intro: "Other tests will require more effort from you to solve them.",
				level_2_outro: "To no one's surprise you were heavy enough to weigh down the button."+"\n"+"Congratulations,......fatty." ,
				
				level_4_intro: "After the year [ERROR CODE GMC-74-47] The G.M.C is legally required by law"+"\n"+"to inform you of the potential health risks involved in these tests.",
				level_4_intro_2: "Risk of falling, vaporization, lead poisoning, neodymium inhalation poisoning,"+"\n"+"Flash blindness, Monologophobia, Risk of falling.",
				level_4_intro_3: "If you feel that at any point you suffer from any of the health risks"+"\n"+"stated above, you understand that the G.M.C is not liable for cause of injury.",
				level_4_outro: "Shame, I wanted to see what would happen when a human reaches"+"\n"+"terminal velocity, then splats 20km downwards, maybe next time.",
				
				level_5_intro: "For this next test I'm going to require you to solve it as fast as possible.",
				level_5_outro: "We specifically said 'as fast as possible!'",
				
				level_6_intro: "The tests from this point on shall make use of the G.M.C Magnetic Field Manipulator Gun."+"\n"+"We are no longer allowed to say it's true name.",
				level_6_intro_2:"The MFMG allows you to pick up and move ferromagnetic objects,"+"\n"+"such as the standard G.M.C"+"\n"+"Heavy Weight Alnico Alloy Storage Compression Cubes.",
				level_6_intro_3:"Note, The gun can only move objects in the direction you face them!"+"\n"+"If you face a cube from north, you can only move a cube north and south"+"\n"+"likewise if you face it from the sides.",
				level_6_outro: "The G.M.C would like to remind you that the compression cubes are just cubes,"+"\n"+"not some conscious object.",
				
				level_9_intro:"These tests will involve G.M.C"+"\n"+"light amplification by the stimulated emission of radiation emitters.",
				level_9_intro_2:"These laser emitters have proven to be completely safe.",
				level_9_intro_3:"The lasers themselves have not.",
				level_9_intro_4:"Do not look directly into the emitter output socket."+"\n"+"Do not stick any body part into the emitter output socket."+"\n"+"Most importantly do not [ERROR]",
				
				level_11_outro:"What?! How did you not die?!!! I-",
				level_11_outro_2:"We at the G.M.C would like to congratulate you, the next test shall be your last.",
			};
		}break;
	}
}