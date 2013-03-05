function changeImage()
{
  var radios = document.getElementsByTagName('input');
  var choice;
  for (var i = 0; i < radios.length; i++) {
    if (radios[i].type == 'radio' && radios[i].checked) {
        // get value, set checked flag or do whatever you need to
        choice = radios[i].value;       
    }
  } 

  if(choice == "kitten")
  {
    document.getElementById('animalPic').src = "kitten.jpg"
  }
  else if(choice == "puppy")
  {
    document.getElementById('animalPic').src = "puppy.jpg"
  }
  else if(choice == "snake")
  {
    document.getElementById('animalPic').src = "snake.jpg" 
  }
  else if(choice == "rabbit")
  {
    document.getElementById('animalPic').src = "rabbit.jpg" 
  }
  else if(choice == "pig")
  {
    document.getElementById('animalPic').src = "pig.jpg" 
  }
}
