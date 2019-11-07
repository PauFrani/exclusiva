import "bootstrap";
import 'mapbox-gl/dist/mapbox-gl.css';
import { initMapbox } from '../plugins/init_mapbox';
import { initSlick } from '../plugins/init_slick';


initMapbox();

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


// DRAGGABLE

var dragSrcEl = null;
function handleDragStart(e) {
// Target (this) element is the source node.
dragSrcEl = this;
e.dataTransfer.effectAllowed = 'move';
e.dataTransfer.setData('text/html', this.outerHTML);
this.classList.add('dragElem');
}
function handleDragOver(e) {
  if (e.preventDefault) {
  e.preventDefault(); // Necessary. Allows us to drop.
}
this.classList.add('over');
e.dataTransfer.dropEffect = 'move';  // See the section on the DataTransfer object.
return false;
}
function handleDragEnter(e) {
// this / e.target is the current hover target.
}
function handleDragLeave(e) {
this.classList.remove('over');  // this / e.target is previous target element.
}
function handleDrop(e) {
// this/e.target is current target element.
if (e.stopPropagation) {
  e.stopPropagation(); // Stops some browsers from redirecting.
}
// Don't do anything if dropping the same column we're dragging.
if (dragSrcEl != this) {
  // Set the source column's HTML to the HTML of the column we dropped on.
  //alert(this.outerHTML);
  //dragSrcEl.innerHTML = this.innerHTML;
  //this.innerHTML = e.dataTransfer.getData('text/html');
  this.parentNode.removeChild(dragSrcEl);
  var dropHTML = e.dataTransfer.getData('text/html');
  this.insertAdjacentHTML('beforebegin',dropHTML);
  var dropElem = this.previousSibling;
  addDnDHandlers(dropElem);
}
this.classList.remove('over');
return false;
}
function handleDragEnd(e) {
// this/e.target is the source node.
this.classList.remove('over');
/*[].forEach.call(cols, function (col) {
  col.classList.remove('over');
});*/
}
function addDnDHandlers(elem) {
  elem.addEventListener('dragstart', handleDragStart, false);
  elem.addEventListener('dragenter', handleDragEnter, false)
  elem.addEventListener('dragover', handleDragOver, false);
  elem.addEventListener('dragleave', handleDragLeave, false);
  elem.addEventListener('drop', handleDrop, false);
  elem.addEventListener('dragend', handleDragEnd, false);
}
var cols = document.querySelectorAll('#columns .column');
[].forEach.call(cols, addDnDHandlers);





