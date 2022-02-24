x = (room_width/2) - sprite_get_width(spr_phr_logo);
y = (room_height/2) - sprite_get_height(spr_phr_logo);

sequance_id = layer_sequence_create("Assets_1",x,y,seq_phr_presents);

layer_sequence_xscale(sequance_id,2);
layer_sequence_yscale(sequance_id,2);

layer_sequence_play(sequance_id);