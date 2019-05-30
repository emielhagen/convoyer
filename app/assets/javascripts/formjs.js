const formBtn = document.getElementById('btn-form-dropdown');

formBtn.addEventListener('click', (event) => {
  const formDropDown = document.querySelector('.form-wrapper');
  formDropDown.classList.toggle('form-hidden');
})
