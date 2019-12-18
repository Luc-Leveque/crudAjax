#cp-ville-node
=============

Petite implémentation de l'API [cp-ville](http://cp-ville.com) pour node.js.

##Installation
```
npm install cp-ville-node --save
```

##Utilisation de l'API

```javascript
var cpVille = require('cp-ville-node');

cpVille.find("69005",function(err,data)
{
	if(err) console.log(err)
	else
		console.log(data)

	/*
	*{ '1': { ville: 'LYON', cp: '69009' },
	*count: 1,
	*typeretour: 'ville' }
	*/

})

cpVille.find("pomp",function(err,data)
{
	if(err) console.log(err)
	else
		console.log(data.toArray("cp"))

	/*
	*[ { cp: '19230' },
	*{ cp: '24240' },
	*{ cp: '24170' },
	*{ cp: '25340' },
	*{ cp: '30170' },
	*{ cp: '31450' },
	*{ cp: '32130' },
	*{ cp: '33730' },
	*{ cp: '33370' },
	*{ cp: '47230' },
	*{ cp: '47420' },
	*{ cp: '48110' },
	*{ cp: '54340' },
	*{ cp: '64370' },
	*{ cp: '77400' },
	*{ cp: '79200' },
	*{ cp: '79160' },
	*{ cp: '82170' },
	*{ cp: '88300' },
	*{ cp: '97316' } ]
	*/
})
```