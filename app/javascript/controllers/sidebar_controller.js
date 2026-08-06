import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["panel"]

  connect() {
    document.addEventListener("click", this.handleOutsideClick)
  }

  disconnect() {
    document.removeEventListener("click", this.handleOutsideClick)
  }

  toggle(event) {
    event?.preventDefault()
    event?.stopPropagation()
    this.panelTarget.classList.toggle("-translate-x-full")
  }

  handleOutsideClick = (event) => {
    const clickedInsidePanel = this.panelTarget.contains(event.target)
    const clickedToggleButton = event.target.closest("[data-action*='sidebar#toggle']")

    if (!clickedInsidePanel && !clickedToggleButton && !this.panelTarget.classList.contains("-translate-x-full")) {
      this.panelTarget.classList.add("-translate-x-full")
    }
  }
}