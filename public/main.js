let scramble = document.querySelector("#scramble");
let cupcakes = document.querySelectorAll(".cupcake-img");

scramble.addEventListener("onload", wildOut);

function wildOut() {
  let cupcakes = document.querySelectorAll(".cupcake-img");
  for (var i in cupcakes) {
    if (cupcakes.hasOwnProperty(i)) {
      cupcakes[i].className = 'cupcake-img-spin';
     } else {
      cupcakes[i].className = 'cupcake-img';
     }
  }
}

// var elements = document.getElementsByClassName('hidden-class');
// for (var i in elements) {
//   if (elements.hasOwnProperty(i)) {
//     elements[i].className = 'show-class';
//   }
// }