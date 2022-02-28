layer_create(-200,"logo_sequance_sequance");
logo_sequance_layer = layer_sequence_create("logo_sequance_sequance",(room_width/2),
((room_height/2) -(155)) + 70,
logo_sequence);

layer_sequence_xscale(logo_sequance_layer,2);
layer_sequence_yscale(logo_sequance_layer,2);

layer_sequence_play(logo_sequance_layer);