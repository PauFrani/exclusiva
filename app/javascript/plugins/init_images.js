// 1. Encontrar todas las images
const initImages = () => {
  const images = document.querySelectorAll(".product-images");
  const mainImage = document.querySelector("#main-image");

  if (mainImage) {
    images.forEach((image) => {
      image.addEventListener("click", (event) => {
        const url = event.target.src;
        images.forEach(img => img.classList.add("greyscale"));
        event.target.classList.remove("greyscale");
        mainImage.style.backgroundImage = `url(${url})`;
      });
    });
  }
}
// 1.bis Encontrar en una variable a la imagen que estoy mostrando (mainImage)
// 2. Agregar un eventListener
// 3. cuando hacen click busco 'mainImage' y le cambio el background-image url a la que hicieron click
// 4. cambio el grayscale y se lo agrego a todas las otras

export { initImages };
