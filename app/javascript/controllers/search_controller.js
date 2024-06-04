let rangeMin = 100;
const range = document.querySelector(".range-selected");
const rangeInput = document.querySelectorAll(".range-input input");
const rangePrice = document.querySelectorAll(".range-price input");
rangeInput.forEach((input) => {
	  input.addEventListener("input", (e) => {
		      let minRange = parseInt(rangeInput[0].value);
		      let maxRange = parseInt(rangeInput[1].value);
		      if (maxRange - minRange < rangeMin) {     
			            if (e.target.className === "min") {
					            rangeInput[0].value = (maxRange - rangeMin)/10;        
					          } else {
							          rangeInput[1].value = (minRange + rangeMin)/10;        
							        }
			          } else {
					        rangePrice[0].value = minRange/10;
					        rangePrice[1].value = maxRange/10;
					        range.style.left = (minRange / rangeInput[0].max) * 100 + "%";
					        range.style.right = 100 - (maxRange / rangeInput[1].max) * 100 + "%";
					      }
		    });
});
rangePrice.forEach((input) => {
	  input.addEventListener("inpuy", (e) => {
		      let minPrice = rangePrice[0].value;
		      let maxPrice = rangePrice[1].value;
		      if (maxPrice - minPrice >= rangeMin && maxPrice <= rangeInput[1].max) {
			            if (e.target.className === "min") {
					            rangeInput[0].value = minPrice*10;
					            range.style.left = (minPrice / rangeInput[0].max) * 100 + "%";
					          } else {
							          rangeInput[1].value = maxPrice*10;
							          range.style.right = 100 - (maxPrice / rangeInput[1].max) * 100 + "%";
							        }
			          }
		    });
});
