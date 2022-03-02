#region "unknown" macros
#macro __FHINPUT_Gamepad_Vendor_Unknown "Unknown Vendor"
#macro __FHINPUT_Gamepad_Model_Unknown "Unknown Model"
#endregion

#region __fhInputGetGamepadVendor(guid)
function __fhInputGetGamepadVendor(guid)
{
    var vendorString;
    var pt1 = string_char_at(guid, 1) + string_char_at(guid, 2);
    var pt2 = string_char_at(guid, 3) + string_char_at(guid, 4);
    var vendorID = pt2 + pt1;
    
    switch(vendorID)
	{
        case "0079": vendorString = "DragonRise"; break;
        case "0414": vendorString = "Giga-Byte Technology"; break;
        case "0810": vendorString = "PCS"; break;
        case "0955": vendorString = "NVIDIA Corp."; break;
        case "1617": vendorString = "Sony"; break;
        case "1949": vendorString = "Lab126"; break;
        case "2563": vendorString = "ShenZhen"; break;
        case "6472": vendorString = "Sony "; break;
        case "044f": vendorString = "ThrustMaster"; break;
        case "045e": vendorString = "Microsoft"; break;
        case "046d": vendorString = "Logitech"; break;
        case "0483": vendorString = "STMicroelectronics"; break;
        case "04b4": vendorString = "Cypress Semiconductor"; break;
        case "054c": vendorString = "Sony"; break;
        case "057e": vendorString = "Nintendo"; break;
        case "06a3": vendorString = "Saitek"; break;
        case "06cb": vendorString = "Synaptics"; break;
        case "0738": vendorString = "Mad Catz"; break;
        case "07af": vendorString = "MicroTech"; break;
        case "07b5": vendorString = "Mega World International"; break;
        case "08f1": vendorString = "CTI Electronics"; break;
        case "0a51": vendorString = "Sony"; break;
        case "0c12": vendorString = "Zeroplus"; break;
        case "0ca3": vendorString = "Sega"; break;
        case "0e6f": vendorString = "Logic3"; break;
        case "0e8f": vendorString = "GreenAsia"; break;
        case "0f0d": vendorString = "Hori"; break;
        case "0fce": vendorString = "Sony"; break;
        case "11c0": vendorString = "Betop"; break;
        case "12ba": vendorString = "Licensed by Sony"; break;
        case "12bd": vendorString = "Gembird"; break;
        case "1345": vendorString = "Sino Lite Technology"; break;
        case "1430": vendorString = "RedOctane"; break;
        case "146b": vendorString = "BigBen Interactive"; break;
        case "1532": vendorString = "Razer USA"; break;
        case "1689": vendorString = "Razer USA"; break;
        case "16c0": vendorString = "Van Ooijen Technische Informatica"; break;
        case "187c": vendorString = "Alienware"; break;
        case "18d1": vendorString = "Google"; break;
        case "19fa": vendorString = "Gampaq"; break;
        case "1a34": vendorString = "ACRUX"; break;
        case "1d57": vendorString = "Xenta"; break;
        case "22ba": vendorString = "Technology Innovation Holdings"; break;
        case "2341": vendorString = "Arduino"; break;
        case "25f0": vendorString = "ShanWan"; break;
        case "2dc8": vendorString = "8BitDo"; break;
        case "6666": vendorString = "Prototype product Vendor ID"; break;
        case "9886": vendorString = "Astro Gaming"; break;
        case "d209": vendorString = "Ultimarc"; break;
        case "289b": vendorString = "Raphnet"; break;
        default    : vendorString = __FHINPUT_Gamepad_Vendor_Unknown; break;
    }
	return vendorString;
}
#endregion

#region __fhInputGetGamepadModel(guid)
function __fhInputGetGamepadModel(guid)
{
    var vendorString = __fhInputGetGamepadVendor(guid);
    var pt1 = string_char_at(guid, 5) + string_char_at(guid, 6);
    var pt2 = string_char_at(guid, 7) + string_char_at(guid, 8);
    var modelID = pt2 + pt1;
	var description = __FHINPUT_Gamepad_Model_Unknown;
    switch(vendorString)
	{        
        case "8BitDo":
            switch(modelID)
			{
                case "5006": description = "M30 Bluetooth"; break;
                case "6000": description = "SF30 Pro"; break;
                case "6001": description = "SN30/SF30 Pro"; break;
                case "ab11": description = "F30"; break;
                case "ab12": description = "N30"; break;
                case "ab20": description = "SN30/SF30"; break;
                case "ab21": description = "SF30"; break;
                default    : description = __FHINPUT_Gamepad_Model_Unknown; break;               
            }
            break;
        case "ACRUX":
            switch(modelID)
			{
                case "0802": description = "Gamepad"; break;
                default    : description = __FHINPUT_Gamepad_Model_Unknown; break;               
            }
            break;
        case "Alienware":
            switch(modelID)
			{
                case "0600": description = "Dual Compatible Game Pad"; break;
                default    : description = __FHINPUT_Gamepad_Model_Unknown; break;               
            }
            break;
        case "Arduino":
            switch(modelID)
			{
                default    : description = __FHINPUT_Gamepad_Model_Unknown; break;               
            }
            break;
        case "Astro Gaming":
            switch(modelID)
			{
                case "0015": description = "A50"; break;
                default    : description = __FHINPUT_Gamepad_Model_Unknown; break;               
            }
            break;
        case "Betop":
            switch(modelID)
			{
                case "5506": description = "Gamepad"; break;
                default    : description = __FHINPUT_Gamepad_Model_Unknown; break;               
            }
            break;
        case "BigBen Interactive":
            switch(modelID)
			{
                case "0601": description = "Gamepad"; break;
                case "0902": description = "Wired Mini PS3 Game Controller"; break;
                default    : description = __FHINPUT_Gamepad_Model_Unknown; break;               
            }
            break;
        case "CTI Electronics":
            switch(modelID)
			{
                default    : description = __FHINPUT_Gamepad_Model_Unknown; break;               
            }
			break;
        case "Cypress Semiconductor":
            switch(modelID)
			{
                case "d5d5": description = "Zoltrix Z-Boxer"; break;
                default    : description = __FHINPUT_Gamepad_Model_Unknown; break;               
            }
			break;
        case "DragonRise":
            switch(modelID)
			{
                case "0006": description = "TWIN SHOCK Gamepad"; break;
                case "0011": description = "Generic Gamepad"; break;
                case "1800": description = "Wii U Pro Controller Adapter"; break;
                case "181b": description = "Venom Arcade Joystick"; break;
                case "1843": description = "GameCube"; break;
                case "1844": description = "GameCube Controller"; break;
                default    : description = __FHINPUT_Gamepad_Model_Unknown; break;               
            }
			break;
        case "Gampaq":
            switch(modelID)
			{
                case "0607": description = "Game Controller"; break;
                case "0703": description = "Steering Wheel"; break;
                default    : description = __FHINPUT_Gamepad_Model_Unknown; break;               
            }
			break;
        case "Gembird":
            switch(modelID)
			{
                case "d012": description = "JPD Shockforce gamepad"; break;
                case "d015": description = "4-button NES Controller"; break;
                default    : description = __FHINPUT_Gamepad_Model_Unknown; break;               
            }
			break;
        case "Giga-Byte Technology":
            switch(modelID)
			{
                default    : description = __FHINPUT_Gamepad_Model_Unknown; break;               
            }
			break;
        case "Google":
            switch(modelID)
			{
                default    : description = __FHINPUT_Gamepad_Model_Unknown; break;               
            }
			break;
        case "GreenAsia":
            switch(modelID)
			{
                case "0003": description = "MaxFire Blaze 2"; break;
                case "0012": description = "Joystick/Gamepad"; break;
                case "0020": description = "PS2 Adaptor"; break;
                case "3008": description = "Xbox Controller"; break;
                case "300a": description = "Steering Wheel"; break;
                default    : description = __FHINPUT_Gamepad_Model_Unknown; break;               
            }
			break;
        case "Hori":
            switch(modelID)
			{
                case "000a": description = "Dead or Alive 4 FightStick"; break;
                case "000c": description = "Horipad EX Turbo"; break;
                case "000d": description = "Fighting Stick EX2"; break;
                case "0011": description = "Real Arcade Pro 3"; break;
                case "0016": description = "Real Arcade Pro.EX"; break;
                case "001b": description = "Real Aracde Pro.VX"; break;
                case "0063": description = "Real Arcade Pro Hayabusa"; break;
                case "0067": description = "Horipad One"; break;
                case "0078": description = "Real Arcade Pro V Kai"; break;
                case "0090": description = "Horipad Ultimate"; break;
                case "00c1": description = "HORIPAD"; break;
                default    : description = __FHINPUT_Gamepad_Model_Unknown; break;               
            }
			break;
        case "Lab126":
            switch(modelID)
			{
                default    : description = __FHINPUT_Gamepad_Model_Unknown; break;               
            }
			break;
        case "Licensed by Sony":
            switch(modelID)
			{
                case "00ff": description = "Rocksmith Guitar Adapter"; break;
                case "0100": description = "RedOctane Guitar for PlayStation(R)3"; break;
                case "0120": description = "RedOctane Drum Kit for PlayStation(R)3"; break;
                case "0200": description = "Harmonix Guitar for PlayStation(R)3"; break;
                case "0210": description = "Harmonix Drum Kit for PlayStation(R)3"; break;
                default    : description = __FHINPUT_Gamepad_Model_Unknown; break;               
            }
			break;
        case "Logic3":
            switch(modelID)
			{
                case "0180": description = "PDP Faceoff Pro Controller"; break;
                case "0181": description = "PDP Faceoff Pro Controller"; break;
                case "0003": description = "Freebird wireless Controller"; break;
                case "0005": description = "Eclipse wireless Controller"; break;
                case "0006": description = "Edge wireless Controller"; break;
                case "0008": description = "After Glow Pro Controller"; break;
                case "0105": description = "Disney's High School Musical 3 Dance Pad"; break;
                case "0113": description = "Afterglow AX.1 Gamepad"; break;
                case "011f": description = "Rock Candy Wired Controller"; break;
                case "0128": description = "Wireless PS3 Controller"; break;
                case "0131": description = "PDP EA Sports Controller"; break;
                case "0133": description = "Wired Controller"; break;
                case "0139": description = "Afterglow Prismatic Wired Controller"; break;
                case "013a": description = "PDP Xbox One Controller"; break;
                case "0146": description = "Rock Candy Wired Controller"; break;
                case "0147": description = "PDP Marvel Controller"; break;
                case "015c": description = "PDP Arcade Stick"; break;
                case "0161": description = "Camo Wired Controller"; break;
                case "0162": description = "Xbox One Wired Controller"; break;
                case "0163": description = "Legendary Collection Deliverer of Truth"; break;
                case "0164": description = "Battlefield 1 Wired Controller"; break;
                case "0165": description = "Titanfall 2 Wired Controller"; break;
                case "0201": description = "Pelican PL-3601"; break;
                case "0213": description = "Afterglow Gamepad"; break;
                case "021f": description = "Rock Candy Gamepad"; break;
                case "0246": description = "Rock Candy Gamepad for Xbox One"; break;
                case "0301": description = "Controller"; break;
                case "0346": description = "Rock Candy Controller"; break;
                case "0401": description = "Controller"; break;
                case "0413": description = "Afterglow AX.1 Gamepad"; break;
                case "0501": description = "Wired Controller"; break;
                case "f501": description = "Hi-TEC Essentials Wired Gamepad"; break;
                case "f900": description = "Afterglow AX.1"; break;
                default    : description = __FHINPUT_Gamepad_Model_Unknown; break;               
            }
			break;
        case "Logitech":
            switch(modelID)
			{
                case "0200": description = "WingMan Extreme Joystick"; break;
                case "0242": description = "Chillstream"; break;
                case "c129": description = "Harmony Hub"; break;
                case "c12b": description = "Harmony Touch/Ultimate Remote"; break;
                case "c201": description = "WingMan Extreme Joystick with Throttle"; break;
                case "c202": description = "WingMan Formula"; break;
                case "c207": description = "WingMan Extreme Digital 3D"; break;
                case "c208": description = "WingMan Gamepad Extreme"; break;
                case "c209": description = "WingMan Gamepad"; break;
                case "c20a": description = "WingMan RumblePad"; break;
                case "c20b": description = "WingMan Action Pad"; break;
                case "c20c": description = "WingMan Precision"; break;
                case "c20d": description = "WingMan Attack 2"; break;
                case "c20e": description = "WingMan Formula GP"; break;
                case "c211": description = "iTouch Cordless Receiver"; break;
                case "c212": description = "WingMan Extreme Digital 3D"; break;
                case "c213": description = "J-UH16"; break;
                case "c214": description = "ATK3"; break;
                case "c215": description = "Extreme 3D Pro"; break;
                case "c216": description = "F310 Gamepad"; break;
                case "c218": description = "F510 Gamepad"; break;
                case "c219": description = "F710 Gamepad"; break;
                case "c21a": description = "Precision Gamepad"; break;
                case "c21c": description = "G13 Advanced Gameboard"; break;
                case "c21d": description = "F310 Gamepad"; break;
                case "c21e": description = "F510 Gamepad"; break;
                case "c21f": description = "F710 Wireless Gamepad"; break;
                case "c24f": description = "G29 Driving Force Racing Wheel"; break;
                case "c260": description = "G29 Driving Force Racing Wheel"; break;
                case "c281": description = "WingMan Force"; break;
                case "c283": description = "WingMan Force 3D"; break;
                case "c285": description = "WingMan Strike Force 3D"; break;
                case "c286": description = "Force 3D Pro"; break;
                case "c287": description = "Flight System G940"; break;
                case "c291": description = "WingMan Formula Force"; break;
                case "c293": description = "WingMan Formula Force GP"; break;
                case "c294": description = "Driving Force"; break;
                case "c295": description = "Momo Force Steering Wheel"; break;
                case "c298": description = "Driving Force Pro"; break;
                case "c299": description = "G25 Racing Wheel"; break;
                case "c29b": description = "G27 Racing Wheel"; break;
                case "c29c": description = "Speed Force Wireless Wheel for Wii"; break;
                case "c2ab": description = "G13 Joystick"; break;
                case "c705": description = "MX900 Bluetooth Wireless Hub"; break;
                case "c707": description = "Bluetooth wireless hub"; break;
                case "c708": description = "Bluetooth wireless hub"; break;
                case "c709": description = "BT Mini-Receiver"; break;
                case "c70b": description = "BT Mini-Receiver"; break;
                case "c70c": description = "BT Mini-Receiver"; break;
                case "c70d": description = "Bluetooth wireless hub"; break;
                case "c70f": description = "Bluetooth wireless hub"; break;
                case "c712": description = "Bluetooth wireless hub"; break;
                case "c715": description = "Bluetooth wireless hub"; break;
                case "c71a": description = "Bluetooth wireless hub"; break;
                case "c71d": description = "Bluetooth wireless hub"; break;
                case "c720": description = "Bluetooth wireless hub"; break;
                case "ca03": description = "MOMO Racing"; break;
                case "ca04": description = "Formula Vibration Feedback Wheel"; break;
                case "ca84": description = "Cordless Controller for Xbox"; break;
                case "ca88": description = "Thunderpad for Xbox"; break;
                case "ca8a": description = "Precision Vibration Feedback Wheel for Xbox"; break;
                case "caa3": description = "DriveFX Racing Wheel"; break;
                case "cab1": description = "Cordless Keyboard for Wii HID Receiver"; break;
                case "f301": description = "Controller"; break;
                default    : description = __FHINPUT_Gamepad_Model_Unknown; break;               
            }
			break;
        case "Mad Catz":
            switch(modelID)
			{
                case "2215": description = "X-55 Rhino Stick"; break;
                case "2237": description = "V.1 Stick"; break;
                case "4506": description = "Wireless Controller"; break;
                case "4507": description = "XBox Device"; break;
                case "4516": description = "Control Pad"; break;
                case "4520": description = "Control Pad Pro"; break;
                case "4522": description = "LumiCON"; break;
                case "4526": description = "Control Pad Pro"; break;
                case "4530": description = "Universal MC2 Racing Wheel and Pedals"; break;
                case "4536": description = "MicroCON"; break;
                case "4540": description = "Beat Pad"; break;
                case "4556": description = "Lynx Wireless Controller"; break;
                case "4566": description = "XBox Device"; break;
                case "4576": description = "XBox Device"; break;
                case "4586": description = "MicroCON Wireless Controller"; break;
                case "4588": description = "Blaster"; break;
                case "45ff": description = "Beat Pad"; break;
                case "4716": description = "Wired Xbox 360 Controller"; break;
                case "4718": description = "Street Fighter IV FightStick SE"; break;
                case "4726": description = "Xbox 360 Controller"; break;
                case "4728": description = "Street Fighter IV FightPad"; break;
                case "4730": description = "MC2 Racing Wheel"; break;
                case "4736": description = "MicroCON"; break;
                case "4738": description = "Street Fighter IV Wired Controller"; break;
                case "4740": description = "Beat Pad"; break;
                case "4743": description = "Beat Pad Pro"; break;
                case "4758": description = "Arcade Game Stick"; break;
                case "4a01": description = "FightStick TE 2 for Xbox One"; break;
                case "6040": description = "Beat Pad Pro"; break;
                case "8818": description = "Street Fighter IV Arcade FightStick"; break;
                case "9871": description = "Portable Drum Kit"; break;
                case "a109": description = "S.T.R.I.K.E.7 Keyboard"; break;
                case "a215": description = "X-55 Rhino Throttle"; break;
                case "b726": description = "Modern Warfare 2 Controller"; break;
                case "b738": description = "Marvel VS Capcom 2 TE FightStick"; break;
                case "beef": description = "Joytech Neo SE Advanced Gamepad"; break;
                case "cb02": description = "Saitek Cyborg Rumble Pad"; break;
                case "cb03": description = "Saitek P3200 Rumble Pad"; break;
                case "cb29": description = "Saitek Aviator Stick AV8R02"; break;
                case "f738": description = "Super Street Fighter IV FightStick TE S"; break;
                default    : description = __FHINPUT_Gamepad_Model_Unknown; break;               
            }
			break;
        case "Mega World International":
            switch(modelID)
			{
                case "0017": description = "Joystick"; break;
                case "0213": description = "Thrustmaster Firestorm Digital 3 Gamepad"; break;
                case "0312": description = "Gamepad"; break;
                case "9902": description = "GamePad"; break;
                default    : description = __FHINPUT_Gamepad_Model_Unknown; break;               
            }
			break;
        case "Microsoft":
            switch(modelID)
			{
                case "0007": description = "SideWinder Gamepad"; break;
                case "0008": description = "SideWinder Precisison Pro"; break;
                case "0026": description = "SideWinder Gamepad Pro"; break;
                case "0027": description = "SideWinder PnP Gamepad"; break;
                case "0028": description = "SideWinder Dual Strike"; break;
                case "0202": description = "Xbox Controller"; break;
                case "0285": description = "Xbox Controller S"; break;
                case "0289": description = "Xbox Controller S"; break;
                case "0291": description = "Xbox 360 Wireless Receiver"; break;
                case "02e3": description = "Xbox One Elite Controller"; break;
                case "02e6": description = "Wireless XBox Controller Dongle"; break;
                case "02ea": description = "Xbox One S Controller"; break;
                case "000e": description = "SideWinder Freestyle Pro"; break;
                case "001a": description = "SideWinder Precision Racing Wheel"; break;
                case "028e": description = "Xbox 360 Controller"; break;
                case "028f": description = "Xbox 360 Wireless Controller"; break;
                case "02d1": description = "Xbox One Controller"; break;
                case "02dd": description = "Xbox One Controller"; break;
                default    : description = __FHINPUT_Gamepad_Model_Unknown; break;               
            }
			break;
        case "MicroTech":
            switch(modelID)
			{
                default    : description = __FHINPUT_Gamepad_Model_Unknown; break;               
            }
			break;
        case "Nintendo":
            switch(modelID)
			{
                case "0337": description = "Gamecube adapter"; break;
                case "2009": description = "Switch Pro Controller"; break;
                default    : description = __FHINPUT_Gamepad_Model_Unknown; break;               
            }
			break;
        case "NVIDIA Corp.":
            switch(modelID)
			{
                default    : description = __FHINPUT_Gamepad_Model_Unknown; break;               
            }
			break;
        case "PCS":
            switch(modelID)
			{
                case "0001": description = "Dual PSX Adaptor"; break;
                case "0002": description = "Dual PCS Adaptor"; break;
                case "0003": description = "PlayStation Gamepad"; break;
                case "e001": description = "Twin controller"; break;
                case "e501": description = "SNES Gamepad"; break;
                default    : description = __FHINPUT_Gamepad_Model_Unknown; break;               
            }
			break;
        case "Prototype product Vendor ID":
            switch(modelID)
			{
                case "0667": description = "WiseGroup Smart Joy PSX, PS-PC Smart JoyPad"; break;
                default    : description = __FHINPUT_Gamepad_Model_Unknown; break;               
            }
			break;
        case "Raphnet":
            switch(modelID)
			{
                case "0018": description = "Atari jaguar controller"; break;
                case "0019": description = "multidb9joy"; break;
                case "001a": description = "multidb9joy v3"; break;
                case "0014": description = "wusbmote v1.3"; break;
                case "0015": description = "wusbmote v1.3"; break;
                case "0016": description = "wusbmote v1.3"; break;
                case "0017": description = "GameCube/n64 controller v3.0"; break;
                case "0012": description = "wusbmote v1.2.1"; break;
                case "0013": description = "wusbmote v1.2.1"; break;
                case "000e": description = "Virtualboy controller"; break;
                case "0010": description = "wusbmote v1.2"; break;
                case "0011": description = "wusbmote v1.2"; break;
                case "0009": description = "Atari"; break;
                case "000a": description = "Dreamcast"; break;
                case "000b": description = "Gamecube/N64 controller v2.9"; break;
                case "000c": description = "GameCube/N64 controller v2.9"; break;
                case "0006": description = "Saturn"; break;
                case "0007": description = "Famicom controller"; break;
                case "0008": description = "Dreamcast"; break;
                case "0003": description = "4nes4snes"; break;
                case "0004": description = "GameCube/N64 controller v2.3"; break;
                case "0005": description = "Saturn"; break;
                case "0001": description = "GameCube/N64 controller v2.2"; break;
                case "0002": description = "2nes2snes"; break;
                default    : description = __FHINPUT_Gamepad_Model_Unknown; break;               
            }
            break;
        case "Razer USA":
            switch(modelID)
			{
                case "0300": description = "Hydra Motion Sensing"; break;
                case "0401": description = "Panthera Arcade Stick"; break;
                case "0a00": description = "Atrox Arcade Stick"; break;
                case "0a02": description = "ManO'War"; break;
                case "0a03": description = "Wildcat"; break;
                case "0a15": description = "Wolverine Tournament Edition"; break;
                case "0f13": description = "Lian Li O11 Dynamic Razer Edition"; break;
                case "1000": description = "Raiju"; break;
                case "1004": description = "Raiju Ultimate"; break;
                case "1007": description = "Raiju 2 Tournament Edition"; break;
                case "1008": description = "Panthera Evo Flightstick"; break;
                case "1009": description = "Raiju 2 Ultimate Edition"; break;
                case "100a": description = "Raiju 2 Tournament Edition"; break;
                case "fd00": description = "Onza Tournament Edition"; break;
                case "fd01": description = "Onza Classic Edition"; break;
                default    : description = __FHINPUT_Gamepad_Model_Unknown; break;               
            }
			break;
        case "RedOctane":
            switch(modelID)
			{
                case "0150": description = "Wireless receiver for Skylanders"; break;
                case "4734": description = "Guitar Hero4 hub"; break;
                case "4748": description = "Guitar Hero X-plorer"; break;
                case "474b": description = "Guitar Hero MIDI interface"; break;
                case "8888": description = "TX6500 Dance Pad"; break;
                case "f801": description = "Controller"; break;
                default    : description = __FHINPUT_Gamepad_Model_Unknown; break;               
            }
			break;
        case "Saitek":
            switch(modelID)
			{
                case "0006": description = "Cyborg Gold Joystick"; break;
                case "0109": description = "P880 Pad"; break;
                case "0160": description = "ST290 Pro"; break;
                case "0200": description = "Racing Wheel"; break;
                case "0201": description = "Adrenalin Gamepad"; break;
                case "0241": description = "Xbox Adrenalin Gamepad"; break;
                case "0255": description = "X52 Flight Controller"; break;
                case "040b": description = "P990 Dual Analog Pad"; break;
                case "040c": description = "P2900 Wireless Pad"; break;
                case "0422": description = "ST90 Joystick"; break;
                case "0460": description = "ST290 Pro Flight Stick"; break;
                case "0463": description = "ST290"; break;
                case "0464": description = "Cyborg Evo"; break;
                case "0471": description = "Cyborg Graphite Stick"; break;
                case "0501": description = "R100 Sports Wheel"; break;
                case "0502": description = "ST200 Stick"; break;
                case "0506": description = "R220 Digital Wheel"; break;
                case "051e": description = "Cyborg Digital II Stick"; break;
                case "052d": description = "P750 Gamepad"; break;
                case "053c": description = "X45 Flight Controller"; break;
                case "053f": description = "X36F Flightstick"; break;
                case "056c": description = "P2000 Tilt Pad"; break;
                case "056f": description = "P2000 Tilt Pad"; break;
                case "05d2": description = "PC Dash 2"; break;
                case "075c": description = "X52 Flight Controller"; break;
                case "0762": description = "Saitek X52 Pro Flight Control System"; break;
                case "0763": description = "Pro Flight Rudder Pedals"; break;
                case "0764": description = "Flight Pro Combat Rudder"; break;
                case "0805": description = "R440 Force Wheel"; break;
                case "0b4e": description = "Pro Flight Backlit Information Panel"; break;
                case "0bac": description = "Pro Flight Yoke"; break;
                case "0c2d": description = "Pro Flight Quadrant"; break;
                case "0d05": description = "Pro Flight Radio Panel"; break;
                case "0d06": description = "Flight Pro Multi Panel"; break;
                case "0d67": description = "Pro Flight Switch Panel"; break;
                case "1003": description = "GM2 Action Pad"; break;
                case "1009": description = "Action Pad"; break;
                case "100a": description = "SP550 Pad and Joystick Combo"; break;
                case "100b": description = "SP550 Pad"; break;
                case "1509": description = "P3000 Wireless Pad"; break;
                case "1589": description = "P3000 Wireless Pad"; break;
                case "2541": description = "X45 Flight Controller"; break;
                case "3509": description = "P3000 RF GamePad"; break;
                case "353e": description = "Cyborg Evo Wireless"; break;
                case "3589": description = "P3000 Wireless Pad"; break;
                case "35be": description = "Cyborg Evo"; break;
                case "5509": description = "P3000 Wireless Pad"; break;
                case "712c": description = "Pro Flight Yoke integrated hub"; break;
                case "801e": description = "Cyborg 3D Digital Stick II"; break;
                case "802d": description = "P750 Pad"; break;
                case "803f": description = "X36 Flight Controller"; break;
                case "806f": description = "P2000 Tilt Pad"; break;
                case "80c0": description = "Pro Gamer Command Unit"; break;
                case "80c1": description = "Cyborg Command Pad Unit"; break;
                case "a2ae": description = "Pro Flight Instrument Panel"; break;
                case "f518": description = "P3200 Rumble Force Game Pad"; break;
                case "f51a": description = "P3600"; break;
                case "ff04": description = "R440 Force Wheel"; break;
                case "ff0c": description = "Cyborg Force Rumble Pad"; break;
                case "ff0d": description = "P2600 Rumble Force Pad"; break;
                case "ff12": description = "Cyborg 3D Force Stick"; break;
                case "ff17": description = "ST 330 Rumble Force Stick"; break;
                case "ff52": description = "Cyborg 3D Rumble Force Joystick"; break;
                case "ffb5": description = "Cyborg Evo Force Joystick"; break;
                default    : description = __FHINPUT_Gamepad_Model_Unknown; break;               
            }
			break;
        case "Sega":
            switch(modelID)
			{
                default    : description = __FHINPUT_Gamepad_Model_Unknown; break;               
            }
			break;
        case "ShanWan":
            switch(modelID)
			{
                case "c121": description = "PS3 Wired Controller"; break;
                case "c131": description = "Gioteck PS3 Wireless Controller"; break;
                default    : description = __FHINPUT_Gamepad_Model_Unknown; break;               
            }
			break;
        case "ShenZhen":
            switch(modelID)
			{
                case "0523": description = "BM0523 Wireless Gamepad"; break;
                case "0575": description = "ZD-V Gaming  Controller"; break;
                default    : description = __FHINPUT_Gamepad_Model_Unknown; break;               
            }
			break;
        case "Sino Lite Technology":
            switch(modelID)
			{
                case "001c": description = "Xbox Controller Hub"; break;
                case "6006": description = "Defender Wireless Controller"; break;
                default    : description = __FHINPUT_Gamepad_Model_Unknown; break;               
            }
			break;
        case "Sony":
            switch(modelID)
			{
                case "0268": description = "PlayStation 3 Controller"; break;
                case "042f": description = "PlayStation Move Navigation Controller"; break;
                case "09cc": description = "DualShock4"; break;
                case "0ba0": description = "Dualshock4 Wireless Adaptor"; break;
                case "0cda": description = "PS Classic Controller"; break;
                default    : description = __FHINPUT_Gamepad_Model_Unknown; break;               
            }
			break;
        case "STMicroelectronics":
            switch(modelID)
			{
                case "5710": description = "Joystick in FS Mode"; break;
                default    : description = __FHINPUT_Gamepad_Model_Unknown; break;               
            }
			break;
        case "Synaptics":
            switch(modelID)
			{
                default    : description = __FHINPUT_Gamepad_Model_Unknown; break;               
            }
			break;
        case "Technology Innovation Holdings":
            switch(modelID)
			{
                case "0108": description = "Double Shock Steering Wheel HID"; break;
                case "0109": description = "Double Shock Steering Wheel Hub"; break;
                default    : description = __FHINPUT_Gamepad_Model_Unknown; break;               
            }
			break;
        case "ThrustMaster":
            switch(modelID)
			{
                case "0400": description = "HOTAS Cougar"; break;
                case "0402": description = "HOTAS Warthog Joystick"; break;
                case "0404": description = "HOTAS Warthog Throttle"; break;
                case "044f": description = "GP XID"; break;
                case "0f00": description = "Steering Wheel for Xbox"; break;
                case "0f03": description = "Steering Wheel for Xbox"; break;
                case "0f07": description = "Controller for Xbox"; break;
                case "0f10": description = "Modena GT Wheel"; break;
                case "a003": description = "Rage 3D Game Pad"; break;
                case "a01b": description = "PK-GP301 Driving Wheel"; break;
                case "a0a0": description = "Top Gun Joystick"; break;
                case "a0a1": description = "Top Gun Joystick (rev2)"; break;
                case "a0a3": description = "Fusion Digital GamePad"; break;
                case "a201": description = "PK-GP201 PlayStick"; break;
                case "b108": description = "T-Flight Hotas X Flight Stick"; break;
                case "b10a": description = "T.16000M Joystick"; break;
                case "b203": description = "360 Modena Pro Wheel"; break;
                case "b300": description = "Firestorm Dual Power"; break;
                case "b303": description = "FireStorm Dual Analog 2"; break;
                case "b304": description = "Firestorm Dual Power"; break;
                case "b307": description = "vibrating Upad"; break;
                case "b30b": description = "Wireless VibrationPad"; break;
                case "b315": description = "Firestorm Dual Analog 3"; break;
                case "b320": description = "Dual Trigger gamepad PC/PS2 2.0"; break;
                case "b323": description = "Dual Trigger 3-in-1"; break;
                case "b324": description = "Dual Trigger 3-in-1"; break;
                case "b326": description = "Gamepad GP XID"; break;
                case "b351": description = "F16 MFD 1"; break;
                case "b352": description = "F16 MFD 2"; break;
                case "b365": description = "UbiSoft UbiConnect"; break;
                case "b603": description = "force feedback Wheel"; break;
                case "b605": description = "force feedback Racing Wheel"; break;
                case "b651": description = "Ferrari GT Rumble Force Wheel"; break;
                case "b653": description = "RGT Force Feedback Clutch Racing Wheel"; break;
                case "b654": description = "Ferrari GT Force Feedback Wheel"; break;
                case "b678": description = "T.Flight Rudder Pedals"; break;
                case "b679": description = "T-Rudder"; break;
                case "b687": description = "TWCS Throttle"; break;
                case "b700": description = "Tacticalboard"; break;
                default    : description = __FHINPUT_Gamepad_Model_Unknown; break;               
            }
			break;
        case "Ultimarc":
            switch(modelID)
			{
                case "0301": description = "I-PAC"; break;
                case "0501": description = "Ultra-Stik"; break;
                case "1571": description = "A-PACl"; break;
                default    : description = __FHINPUT_Gamepad_Model_Unknown; break;               
            }
			break;
        case "Van Ooijen Technische Informatica":
            switch(modelID)
			{
                default    : description = __FHINPUT_Gamepad_Model_Unknown; break;               
            }
        break;
        case "Xenta":
            switch(modelID)
			{
                default    : description = __FHINPUT_Gamepad_Model_Unknown; break;               
            }
			break;
        case "Zeroplus":
            switch(modelID)
			{
                case "8801": description = "Nyko Xbox Controller"; break;
                case "8802": description = "Xbox Controller"; break;
                case "8809": description = "Red Octane Ignition Xbox DDR Pad"; break;
                case "880a": description = "Pelican Eclipse PL-2023"; break;
                case "8810": description = "Xbox Controller"; break;
                case "9902": description = "VibraX"; break;   
                default    : description = __FHINPUT_Gamepad_Model_Unknown; break;               
            }
			break;
        default            : description = __FHINPUT_Gamepad_Model_Unknown; break;
    }
	return description;
}
#endregion