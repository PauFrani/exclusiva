// 1. Encontrar todas las talles
const initSize = () => {
  const sizes = document.querySelectorAll(".variant_stock");
  // const mainSize = document.querySelector("#main-size");

  if (sizes) {
    sizes.forEach((size) => {
      size.addEventListener("click", (event) => {
        const urlId = event.target.dataset.idProduct;
        sizes.forEach(siz => siz.classList.add("size-greyscale"));
        sizes.forEach(siz => siz.classList.remove("size-selected"));
        event.target.classList.remove("size-greyscale");
        event.target.classList.add("size-selected");
        const link = document.querySelector(".button-general");
        link.href = `/showroom_variant_stocks/${urlId}/purchases/new`
        link.classList.remove("disable-button-product")
      });
    });
  }
}
// 1.bis Encontrar en una variable a la imagen que estoy mostrando (mainImage)
// 2. Agregar un eventListener
// 3. cuando hacen click busco 'mainImage' y le cambio el background-image url a la que hicieron click
// 4. cambio el grayscale y se lo agrego a todas las otras

export { initSize };
