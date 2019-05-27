import Typed from 'typed.js';

const options = {
  strings: ["You're going on a trip.",
            "Nice!",
            "But it is a long drive",
            "and it is boring to go alone",
            "so what do you do?",
            "You join or create a convoy!"],
  typeSpeed: 30
}

const initType = (selector) => {
  const typeString = document.querySelector(selector);
  if (typeString) {
    new Typed(typeString, options);
  };
};

export { initType };
