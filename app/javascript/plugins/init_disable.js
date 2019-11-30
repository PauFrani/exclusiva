// 1. Encontrar todas las talles
const initDisable = () => {
  const elements = document.querySelectorAll(".element-to-enable");
  const buttonDissabled = document.querySelector(".button-disableable");
  const amount = document.getElementById("bidding_amount");

  if (elements) {
    elements.forEach((element) => {
      element.addEventListener("click", (event) => {
        if (amount.value){
          buttonDissabled.classList.remove("size-greyscale");
          buttonDissabled.classList.remove("button-disabled");
          };
      });
    });
  }
}


// 1.bis Encontrar en una variable a la imagen que estoy mostrando (mainImage)
// 2. Agregar un eventListener
// 3. cuando hacen click busco 'mainImage' y le cambio el background-image url a la que hicieron click
// 4. cambio el grayscale y se lo agrego a todas las otras

export { initDisable };
