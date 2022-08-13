import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="insert-in-list"
export default class extends Controller {
  static targets = ["items", "form"]

  connect() {
    console.log(this.element)
    console.log(this.itemsTarget)
    console.log(this.formTarget)
  }

  send(event) {
    event.preventDefault()

    console.log("TODO: send request in AJAX")
  }

  fetch(this.formTarget.action, {
    method: "POST",
    headers: { "Accept": "application/json", "X-CSRF-Token": this.csrfToken },
    body: new FormData(this.formTarget)
  })
    .then(response => response.json())
    .then((data) => {
      console.log(data)
    })
}
