function Ville(values) {
	try
	{
		this.values = values;
	}
	catch(ex)
	{
		this.values = null;
		this.err = ex;
	}	
}

/*	
*	Summary	: 	Return an array with the finded cities
*	Result 	: 	Array of cities
*/
Ville.prototype.toArray = function(type){
	var result = [];
	for(var i = 1 ; i <= this.values.count ; i++)
	{
		if(type == "ville")
			result.push({ "label" : this.values[i].ville , "ville" : this.values[i].cp});
		else if(type == "cp")
			result.push({ "label" : this.values[i].cp , "ville" : this.values[i].ville});
		else
			result.push({ "label" : this.values[i].cp , "ville" : this.values[i].ville});
	}
	console.log(result)
	return result;
}



module.exports = Ville;