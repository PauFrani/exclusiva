const initDisableLocation = () => {
  const campoSearch = document.getElementById("bidding_address_street")
  const buttonDissabled = document.getElementById("location_submit");

  if (buttonDissabled) {
    campoSearch.addEventListener("input",function() {
      if (campoSearch.value.length) {
          buttonDissabled.classList.remove("size-greyscale");
          buttonDissabled.classList.remove("button-disabled");
      }
      if (campoSearch.value.length < 1) {
          buttonDissabled.classList.add("size-greyscale");
          buttonDissabled.classList.add("button-disabled");
      }
    });
  }
}

export {initDisableLocation};
