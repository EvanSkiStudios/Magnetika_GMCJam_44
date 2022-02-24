
function fhInputIsInitialized()
{
	if(variable_global_exists("__fhInputIsInitialized"))
	{
		if(global.__fhInputIsInitialized)
		{
			return true;
		}
	}
	return false;
}

function fhi_is_initialized()
{
	if(false){return fhi_is_initialized;}
	return fhInputIsInitialized();
}