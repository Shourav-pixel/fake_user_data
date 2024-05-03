import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="home"
export default class extends Controller {
  static targets = ["select"]
  connect() {

    console.log("Hello, Shourav",this.element);
    console.log(this.selectTarget.value);
  }
region()
{
  const region = this.selectTarget.value;
  const url = `?locale=${region}`;

  Turbo.visit(url)
}
  update()
  {
    console.log("update");
    this.region();
  }
}
