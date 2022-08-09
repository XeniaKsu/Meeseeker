import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="calendar"
export default class extends Controller {
  static targets = ["calendar", "button"]
  connect() {
    console.log("stimulus connected");
  }

  display() {
   const display = this.calendarTarget.classList.toggle('calendar-display-none')
}

}
