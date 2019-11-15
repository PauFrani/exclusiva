import places from 'places.js';

const initAutocomplete = () => {
  const addressInput = document.getElementById('bidding_address_street');
  if (addressInput) {
    places({
      container: addressInput,
      countries: ["AR"],
      appId: 'plS27C4JI3TY',
      apiKey: '0975179f03fc65cd0070b624e9253e9c',
    });
  }
};


export { initAutocomplete };
