import places from 'places.js';

const initAutocomplete = () => {
  const addressInput = document.getElementById('bidding_address_street');
  if (addressInput) {
    places({ container: addressInput });
  }
};

const initAutocomplete1 = () => {
  const addressInput1 = document.getElementById('_bidding_address');
  if (addressInput1) {
    places({ container: addressInput1 });
  }
};

export { initAutocomplete };
export { initAutocomplete1 };
