let count = 1;
  document.getElementById ("radio1").checked = true;

setInterval(function(){
  nextImage();
  }, 5000)

function nextImage(){
  count++;
  if(count >3){
  count = 1;
  }

document.getElementById ("radio" + count).checked = true;
    }

function toggleMenu() {
  var menu = document.getElementById('menu');
  if (menu.style.display === 'block') {
      menu.style.display = 'none';
  } else {
      menu.style.display = 'block';
  }
}
