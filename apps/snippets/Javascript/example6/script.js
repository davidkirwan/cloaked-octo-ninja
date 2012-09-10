

var count = 2000;
var points = 10;
var chosen = 1;

function displaymessage()
{
	document.getElementById(chosen).innerHTML = "";
	var rand = 1 + Math.floor(Math.random() * 100);
	chosen = rand;
	document.getElementById(rand).innerHTML = '<img src="penguin.jpg" height="42" width="42" alt="^oo^" onclick="updateScore()"/>';
	setTimeout("displaymessage()", count);
}

function updateScore()
{ 
	var n = parseInt(document.getElementById("score").value)
	document.getElementById("score").value = n + points;
	
	// If you manage to click it remove it from the screen until next displaymessage() call
        document.getElementById(chosen).innerHTML = "";

	// 700 seems about right any faster and its impossible to click on :)
	if(count > 700)
	{
		count = count-100;

	}

	if(document.getElementById("score").value > 200)
	{
		document.getElementById("winner").innerHTML='<img src="win.jpg" />';	
		
	}
}

function entername()
{
	document.getElementById("playerName").innerHTML = document.getElementById("name").value;
}
