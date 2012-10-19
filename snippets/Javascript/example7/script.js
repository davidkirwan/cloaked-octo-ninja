
function hideAndShow(){

  if(document.getElementById("hiddenBox").style.visibility == "visible"){
    document.getElementById("hiddenBox").style.visibility = "hidden";
  }
  else{
    document.getElementById("hiddenBox").style.visibility = "visible";
  }
}

function loadThisFirst(theVar){
  if(theVar == "middle"){
    middleFocus();
  }
  else if(theVar == "left"){
    leftFocus();
  }
  else{
    rightFocus();
  }
}

function leftFocus(){
  document.getElementById("leftTextBox").value = "";
  document.getElementById("bodyImageDiv").innerHTML = '<img src="eyes_left.jpg"/>';
}

function middleFocus(){
  document.getElementById("middleTextBox").value = "";
  document.getElementById("bodyImageDiv").innerHTML = '<img src="eyes_down.jpg"/>';
}

function rightFocus(){
  document.getElementById("rightTextBox").value = "";
  document.getElementById("bodyImageDiv").innerHTML = '<img src="eyes_right.jpg"/>';
}

function buttonClick(){
  var a = document.getElementById("leftTextBox").value;
  var b = document.getElementById("middleTextBox").value;
  var c = document.getElementById("rightTextBox").value;

  document.getElementById("bodyDiv").innerHTML = '<img src="eyes.gif"/><div id="resultDiv" ></div>';

  if(a == "<div"){
    a = "Divs not allowed!!";
  }

  document.getElementById("resultDiv").innerHTML = "Left box: " + a + 
" : " + " Middle box:" + b + " : " + " Right box:" + c;

  document.getElementById("hiddenDiv").style.visibility = "visible";
}








