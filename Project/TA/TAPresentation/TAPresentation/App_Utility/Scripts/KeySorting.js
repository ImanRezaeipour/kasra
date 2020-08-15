	function KeySort(dropdownlist,caseSensitive) 
	{
	    var undefined	    
		if (dropdownlist.keypressBuffer == undefined) 
			dropdownlist.keypressBuffer = ''
		var key = String.fromCharCode(window.event.keyCode)
		if(window.event.keyCode==1740)//ي
			key=String.fromCharCode(1610)//ي
		dropdownlist.keypressBuffer += key
		if (!caseSensitive) 
			dropdownlist.keypressBuffer = dropdownlist.keypressBuffer.toLowerCase()
		var optionsLength = dropdownlist.options.length
		for (var n=0; n < optionsLength; n++) { 
			var optionText = dropdownlist.options[n].text
			if (!caseSensitive)
			optionText = optionText.toLowerCase()
			if (optionText.indexOf(dropdownlist.keypressBuffer,0) == 0) {
			    dropdownlist.selectedIndex = n;
			    return false
			} 
		} 
		dropdownlist.keypressBuffer = key;
		return true
	}
