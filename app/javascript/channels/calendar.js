/*const endDate = document.querySelector('#end-date')
const startDate = document.querySelector('#start-date')
const dateMax = startDate.value

endDate.addEventListener('click', () => {
  endDate.setAttribute('min', '2022-05-26')
})*/
import flatpickr from "flatpickr";
import 'flatpickr/dist/flatpickr.css';



const priceDynamic = () => {
  const priceKm = parseInt(document.querySelector("#kilometers").value)/1000;
  const start = document.querySelector('#calendar').value.split(' ')[0];
  const end = document.querySelector('#calendar').value.split(' ')[2] || start;
  const priceCar = parseInt(document.querySelector(".card-top-price h2").innerText);
  const days = ((new Date(end) - new Date(start)) / (1000 * 3600 * 24)) + 1;
  const kilometers = parseInt(document.querySelector("#kilometers").value);
  if (days >= 1 && kilometers > 0) {
    document.querySelector(".calcul p").innerText = `${priceCar} x ${days}`;
    document.querySelectorAll(".calcul p")[1].innerText = `${days * priceCar}€`;
    document.querySelectorAll(".total p")[1].innerText = `${(days * priceCar) + (kilometers * priceKm)}€`;
  }
}

const initFlatpickr = () => {
  const unavailable = document.querySelector('#unavailable').innerText
  flatpickr("#calendar", {
    mode: "range",
    allowInput: true,
    disable: JSON.parse(unavailable),
    minDate: new Date()
  });
  document.querySelector('#calendar').addEventListener('change', () => {
    priceDynamic();
  })
  document.querySelector('#kilometers').addEventListener('change', () => {
    priceDynamic();
  })
}

export { initFlatpickr };
