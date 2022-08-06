import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="calendar"
export default class extends Controller {
  connect() {
    console.log("stimulus connected");
  }
}
