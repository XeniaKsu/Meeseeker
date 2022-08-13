import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="search-field-reveal"
export default class extends Controller {
  static targets = ["button", "search"]
  connect() {
    console.log("search field reveal active")
  }

  reveal() {
    const searchToggle = this.searchTarget.classList.toggle("search-field-hide")
    }
  }
