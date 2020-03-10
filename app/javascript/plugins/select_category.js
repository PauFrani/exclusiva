const cards = document.querySelectorAll('.card-bidding-category');

const initCategorySelector = () => {

  if (cards) {
    cards.forEach( card => card.addEventListener('click', selectCategory));
  }

};

const selectCategory = (event) => {

  const card = event.currentTarget;

  // remove active card
  const activesCards = document.querySelectorAll('.card-bidding-category.active')
  activesCards.forEach( card => card.classList.remove('active') )

  // populate input hidden
  const input = document.getElementById('bidding_category');

  input.value = card.dataset.category;


  // add active to selected card
  card.classList.add('active')

}

export { initCategorySelector };
