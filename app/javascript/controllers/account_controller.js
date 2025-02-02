import { Controller } from "@hotwired/stimulus"
import { get } from '@rails/request.js'


export default class extends Controller {

  connect() {
  }

  change(event) {
    let model_name = event.currentTarget.value.split(/\.?(?=[A-Z])/).join('_').toLowerCase();
    let controller_name = model_name + 's';
    let url = `/${controller_name}/form_fields`
    get(url, { responseKind: "turbo-stream"})
  }
}
