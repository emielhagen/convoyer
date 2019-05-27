import Typed from 'typed.js';

const options = {
  strings: ["Create a convoy.", "Find a convoy."],
  typeSpeed: 30
}

const initType = (selector) => {
  const typeString = document.querySelector(selector);
  if (typeString) {
    new Typed(typeString, options);
  };
};

export { initType };
