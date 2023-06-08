import { Controller } from '@hotwired/stimulus';

//this just submits our turbo frame form on creation/sheet when changes are made
export default class extends Controller {
  submit() {
    this.element.requestSubmit();
  }
}
