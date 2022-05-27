import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static values = {
    flag: Number
  }

  connect() {
    console.log(this.flagValue);
    if (this.flagValue > 0) {
      document.querySelector(".notifications").style.display = 'flex';
    } else {
      document.querySelector(".notifications").style.display = 'none'
    }
  }
}
