import places from 'places.js';

const initAutocomplete = () => {
  const addressInput = document.getElementById('bidding_address_street');
  if (addressInput) {
    places({ container: addressInput, countries: ["AR"]  });
  }
};

const initAutocomplete1 = () => {
  const addressInput1 = document.getElementById('_bidding_address');
  if (addressInput1) {
    places({ container: addressInput1, countries: ["AR"] });
  }
};

export { initAutocomplete, initAutocomplete1 };
