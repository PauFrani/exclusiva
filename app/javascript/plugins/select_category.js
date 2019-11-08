const cards = document.querySelectorAll('.card-bidding-category');

const initCategorySelector = () => {

  if (cards) {
    console.log(cards)
    cards.forEach( card => card.addEventListener('click', selectCategory));
  }

};

const selectCategory = (event) => {

  const card = event.currentTarget;

  // remove active card
  const activesCards = document.querySelectorAll('.card-bidding-category.active')
  activesCards.forEach( card => card.classList.remove('active') )

  // populate input hidden
  console.log(card.dataset.category);
  const input = document.getElementById('bidding_category');

  input.value = card.dataset.category;


  // add active to selected card
  card.classList.add('active')

}

export { initCategorySelector };
