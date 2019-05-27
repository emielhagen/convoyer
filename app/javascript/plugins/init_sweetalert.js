import swal from 'sweetalert';

const initSweetalert = (selector, options = {}) => {
  const swalButton = document.querySelector(selector);
  if (swalButton) {
    swalButton.addEventListener('click', () => {
      swal(options);
    });
  }
};

export { initSweetalert };
