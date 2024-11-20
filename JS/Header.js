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
// form
document.addEventListener('DOMContentLoaded', function() {
  const form = document.getElementById('surveyForm');
  const modal = document.getElementById('thankYouModal');
  const joinClubButton = document.getElementById('joinClubButton');
  const laterButton = document.getElementById('laterButton');
  const closeButton = document.querySelector('.close');
  
  const ratingTexts = {
      1: 'Regular',
      2: 'Bom',
      3: 'Muito bom',
      4: 'Ótimo',
      5: 'Excelente'
  };

  /*Configuração das estrelas*/
  function configureRating(divId, textSpanId, hiddenInputId) {
      const div = document.getElementById(divId);
      const stars = div.querySelectorAll('span');
      const textSpan = document.getElementById(textSpanId);
      const hiddenInput = document.getElementById(hiddenInputId);

      stars.forEach(star => {
          star.addEventListener('mouseover', function() {
              const value = this.getAttribute('data-value');
              textSpan.textContent = ratingTexts[value];
              for (let i = 0; i < stars.length; i++) {
                      stars[i].style.color = '#ffd700'; /* ajuste da pag para as estrelinhas vermelhas */
              }
          });

          star.addEventListener('click', function() {
              const value = this.getAttribute('data-value');
              hiddenInput.value = value;
              stars.forEach(s => s.classList.remove('active'));
              this.classList.add('active');
          });
      });

      div.addEventListener('mouseout', function() {
          const value = hiddenInput.value;
          textSpan.textContent = value ? ratingTexts[value] : '';
          /* stars.forEach((star, index) => {
             star.style.color = index < value ? '#ffd700' : '#ccc'; 
          }); */
      });
  }

  /*Grupos de estrelas*/
  configureRating('rating', 'rating-text', 'rating-value');
  configureRating('food_quality', 'food-quality-text', 'food-quality-value');
  configureRating('service_quality', 'service-quality-text', 'service-quality-value');

  /*Validação do formulário */
  form.addEventListener('submit', function(e) {
      e.preventDefault();
      modal.style.display = 'block';
  });

  joinClubButton.addEventListener('click', function() {
      window.location.href = 'p_Clube.html';
  });

  laterButton.addEventListener('click', function() {
      window.location.href = 'P_index.html';
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