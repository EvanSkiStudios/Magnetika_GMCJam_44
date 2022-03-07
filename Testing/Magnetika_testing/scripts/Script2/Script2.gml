/*

//create ds_list full of the ids of all objects in the room
var ids_list = ds_list_create();
var list = ids_list;
with (all)
{
ds_list_add(list, id);
}
var size = ds_list_size(ids_list);
											
//START LOOP
for (i = 0; i < size; i++)
{
//GET THE ID OF THE OBJECT, GET ALL OF ITS VARIABLES AND THE LENGTH OF THE RETURNED ARRAY
var inst = ids_list[| i];
var _memdump_array = variable_instance_get_names(inst);
var _memdump_arraylength = array_length(_memdump_array);
											    
//WRITE THE OBEJCTS NAME TO LOG FILE
file_text_write_string(_f, "["+string(object_get_name(inst.object_index))+"]"+":"+"\n");
//WRITE THE OBEJCTS ID TO LOG FILE
file_text_write_string(_f, "Object_ID: "+string(inst)+"\n");
//WRITE THE OBEJCTS X Cord TO LOG FILE
file_text_write_string(_f, "X_cord: "+string(inst.x)+"\n");
//WRITE THE OBEJCTS Y Cord TO LOG FILE
file_text_write_string(_f, "Y_cord: "+string(inst.y)+"\n");
												
//START LOOP
var j = 0;
for (var l = 0; l < _memdump_arraylength; l++;)
{
if ( j != _memdump_arraylength)
{
//GET THE VARIBLE FROM OUR ARRAY's VALUE
var _variableValue = array_get(_memdump_array,j);
j++;
}
//WRITE THAT VALUE AND THE VARIABLE NAME TO LOG
var _variable = variable_instance_get(inst,_variableValue);
file_text_write_string(_f, string(_variableValue)+" = "+string(_variable)+"\n");
}
//ADD SPACE FOR NEXT LOOP
file_text_write_string(_f, "\n"+"\n");
}
file_text_close(_f);