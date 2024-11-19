document.addEventListener('DOMContentLoaded', function() {
    const form = document.getElementById('clubForm');
    const nameInput = document.getElementById('name');
    const emailInput = document.getElementById('email');

    // Preenche automaticamente os campos de nome e e-mail se os parâmetros estiverem na URL
    const urlParams = new URLSearchParams(window.location.search);
    const name = urlParams.get('name');
    const email = urlParams.get('email');

    if (name) nameInput.value = name;
    if (email) emailInput.value = email;

    form.addEventListener('submit', function(e) {
        e.preventDefault();
        // Aqui você pode adicionar validações adicionais se necessário
        this.submit();
    });
});

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
