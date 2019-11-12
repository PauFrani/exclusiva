import { Sortable } from '@shopify/draggable';

const initSortable = () => {

  const columns = document.getElementById('columns');
  if (columns) {
    const sort = new Sortable(columns, {
      draggable: 'li'
    });
  }

  // sort.on('sortable:stop', (e) => {
    // console.log(e.newContainer.children)
    // var ranks = document.querySelectorAll(".rank")
    // e.newContainer.children.forEach((rank, index)=>rank.innerHTML = index + 1 )
  // });

  const brand_ranks_form = document.getElementById("brand_ranks_form");

  if (brand_ranks_form) {
    const initial_brand_orders_elements = Array.from(document.querySelectorAll(".brand_order"));
    const initial_brand_order = initial_brand_orders_elements.map(li => li.value )

    brand_ranks_form.addEventListener("submit", (e) => {
      e.preventDefault()

      const brand_orders_elements = Array.from(document.querySelectorAll(".brand_order"));
      const brand_order = brand_orders_elements.map(li => li.value )

      const brand_inputs = document.querySelectorAll(".brand_input")

      brand_inputs.forEach((input, index) => {
        const brand_id = initial_brand_order[index];
        input.value = parseInt(brand_order.indexOf(brand_id), 10) + 1;
      })

      brand_ranks_form.submit();
    })
  }



}

export { initSortable };
