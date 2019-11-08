import places from 'places.js';

const initAutocomplete = () => {
  const addressInput = document.getElementById('#bidding_address_street');
  if (addressInput) {
    places({ container: addressInput });
  }
};

export { initAutocomplete };
