import { Controller } from '@hotwired/stimulus';

export default class extends Controller {
  static targets = [];

  closeModal(event) {
    event.target.parentNode.close();
  }
}
