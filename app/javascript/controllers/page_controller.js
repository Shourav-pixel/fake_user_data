import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["tbody"];

  connect() {
    this.fetchInitialData(); // Fetch initial batch of records
    this.setupScrollListener(); // Setup scroll listener
  }

  fetchInitialData() {
    fetch('http://localhost:3000/', {
      method: 'GET',
      headers: {
        'Content-Type': 'application/json'
      }
    })
    .then(response => response.text())
    .then(html => {
      this.tbodyTarget.innerHTML = html;
    })
    .catch(error => {
      console.error('Error fetching initial data:', error);
    });
  }
  

  fetchNextBatch() {
    // Your logic to determine the page number for the next batch
    let nextPageNumber = 2; // For example, assuming the first batch was page 1
    
    fetch(`http://localhost:3000/?page=${nextPageNumber}&per_page=10`, {
      method: 'GET',
      headers: {
        'Content-Type': 'application/json'
      }
    })
    .then(response => response.text())
    .then(html => {
      this.tbodyTarget.innerHTML += html;
    })
    .catch(error => {
      console.error('Error fetching next batch of records:', error);
    });
  }
  

  setupScrollListener() {
    window.addEventListener("scroll", () => {
      if (this.isScrollAtBottom()) {
        this.fetchNextBatch();
      }
    });
  }

  isScrollAtBottom() {
    const tbody = this.tbodyTarget;
    return window.innerHeight + window.pageYOffset >= tbody.offsetTop + tbody.offsetHeight;
  }
}
