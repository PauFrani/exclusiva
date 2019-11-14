import places from 'places.js';

const initAutocomplete = () => {
  const addressInput = document.getElementById('bidding_address_street');
  if (addressInput) {
    appId: 'plS27C4JI3TY',
    apiKey: '0975179f03fc65cd0070b624e9253e9c',
    places({ container: addressInput, countries: ["AR"]  });
  }
};


export { initAutocomplete };
