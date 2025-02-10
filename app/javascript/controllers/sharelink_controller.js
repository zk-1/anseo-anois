import { Controller } from "@hotwired/stimulus"

export default class extends Controller {

  static targets = ["button"]

  static values = {
    shareUrl: String
  }

  copy() {
    let previousText = this.buttonTarget.textContent;
    let url = this.shareUrlValue;
      navigator.clipboard.writeText(url)
      .then(() => {
        this.buttonTarget.textContent = 'Copied!';
        setTimeout(() => {
          this.buttonTarget.textContent = previousText;
        }, 2000);
      })
      .catch((_error) => {
        alert("Here's your sharable link!\n" + url);
      });
  }
}
