// 1. Encontrar todas las talles
const initDisable = () => {
  const elements = document.querySelectorAll(".element-to-enable");
  const buttonDissabled = document.querySelector(".button-disableable");

  if (elements) {
    elements.forEach((element) => {
      element.addEventListener("click", (event) => {
        buttonDissabled.classList.remove("size-greyscale");
        buttonDissabled.classList.remove("button-disabled");
      });

    });
  }
}

const initDisableLocation = () => {

  function el(el) {
    return document.getElementById(el);
  }

  el("location_street").addEventListener("input",function() {
      if (!this.value.length) { //Si la longitud de la cadena de caracteres es 0 => falsa
          el("location_submit").disabled = true; //Deshabilitamos el botón
      } else { //Si no...
          el("location_submit").disabled = false; //Lo habilitamos
      }
  });
}

// 1.bis Encontrar en una variable a la imagen que estoy mostrando (mainImage)
// 2. Agregar un eventListener
// 3. cuando hacen click busco 'mainImage' y le cambio el background-image url a la que hicieron click
// 4. cambio el grayscale y se lo agrego a todas las otras

export { initDisable, initDisableLocation };
