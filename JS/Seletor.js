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

function myFunction() {
  document.getElementById("myDropdown").classList.toggle("show");
}

window.onclick = function(event) {
  if (!event.target.matches('.dropbtn')) {
    var dropdowns = document.getElementsByClassName("dropdown-content");
    var i;
    for (i = 0; i < dropdowns.length; i++) {
      var openDropdown = dropdowns[i];
      if (openDropdown.classList.contains('show')) {
        openDropdown.classList.remove('show');
      }
    }
  }
}

document.addEventListener('DOMContentLoaded', function() {
  const form = document.getElementById('pedidoForm');
  const modal = document.getElementById('pedidoModal');
  const closeButton = document.querySelector('.close');
  const okButton = document.getElementById('okButton');
  const modalMessage = document.getElementById('modalMessage');

  // Função para lidar com a lógica de seleção de "Nenhum"
  function handleNoneOption(category) {
      const noneCheckbox = category.querySelector('.none-option');
      const checkboxes = category.querySelectorAll('input[type="checkbox"]:not(.none-option)');

      noneCheckbox.addEventListener('change', function() {
          if (this.checked) {
              checkboxes.forEach(checkbox => checkbox.checked = false);
          }
      });

      checkboxes.forEach(checkbox => {
          checkbox.addEventListener('change', function() {
              if (this.checked) {
                  noneCheckbox.checked = false;
              }
          });
      });
  }

  // Aplicar lógica "Nenhum" a cada categoria
  const categories = document.querySelectorAll('.category');
  categories.forEach(category => handleNoneOption(category));

  // Validação do formulário e exibição do modal
  form.addEventListener('submit', function(e) {
      e.preventDefault();
      let isValid = true;

      categories.forEach(category => {
          const checkboxes = category.querySelectorAll('input[type="checkbox"]');
          const isChecked = Array.from(checkboxes).some(checkbox => checkbox.checked);
          if (!isChecked) {
              isValid = false;
          }
      });

      if (isValid) {
          modalMessage.textContent = 'Pedido enviado à cozinha com sucesso!';
      } else {
          modalMessage.textContent = 'Verifique seu pedido, você não selecionou tudo.';
      }
      
      modal.style.display = 'block';
  });

  okButton.addEventListener('click', function() {
      modal.style.display = 'none';
      if (modalMessage.textContent === 'Pedido enviado à cozinha com sucesso!') {
          location.reload(); // Recarrega a página para iniciar um novo pedido
      }
  });

  closeButton.addEventListener('click', function() {
      modal.style.display = 'none';
  });

  window.addEventListener('click', function(event) {
      if (event.target === modal) {
          modal.style.display = 'none';
      }
  });
});