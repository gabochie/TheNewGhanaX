// News Aggregator Module for TheNewGhanaX
(function() {
  'use strict';

  const NewsAggregator = {
    newsData: [],
    newsContainer: null,

    init() {
      this.newsContainer = document.getElementById('news-feed');
      if (!this.newsContainer) return;

      this.loadNews();
    },

    async loadNews() {
      try {
        const response = await fetch('/assets/js/news-data.json');
        if (!response.ok) throw new Error('Failed to load news');
        
        this.newsData = await response.json();
        this.renderNews();
        this.updateTimestamp();
      } catch (error) {
        console.error('Error loading news:', error);
        this.showError();
      }
    },

    renderNews() {
      if (!this.newsContainer) return;

      const newsHTML = this.newsData.map(news => `
        <article class="news-card">
          <div class="news-meta">
            <span class="news-category">${news.category}</span>
            <span class="news-date">${this.formatDate(news.date)}</span>
          </div>
          <h3 class="news-title">
            <a href="${news.url}" target="_blank" rel="noopener noreferrer">${news.title}</a>
          </h3>
          <p class="news-summary">${news.summary}</p>
          <div class="news-source">
            <span class="source-name">${news.source}</span>
          </div>
        </article>
      `).join('');

      this.newsContainer.innerHTML = newsHTML;
    },

    formatDate(dateString) {
      const options = { year: 'numeric', month: 'short', day: 'numeric' };
      return new Date(dateString).toLocaleDateString('en-US', options);
    },

    updateTimestamp() {
      const timestamp = document.getElementById('news-timestamp');
      if (timestamp) {
        const now = new Date().toLocaleString('en-US', { 
          year: 'numeric', 
          month: 'short', 
          day: 'numeric',
          hour: '2-digit', 
          minute: '2-digit' 
        });
        timestamp.textContent = `Last updated: ${now}`;
      }
    },

    showError() {
      if (this.newsContainer) {
        this.newsContainer.innerHTML = `
          <div class="news-error">
            <p>Unable to load news at this time. Please check back later.</p>
          </div>
        `;
      }
    }
  };

  // Initialize when DOM is ready
  if (document.readyState === 'loading') {
    document.addEventListener('DOMContentLoaded', () => NewsAggregator.init());
  } else {
    NewsAggregator.init();
  }

  // Expose for manual updates if needed
  window.NewsAggregator = NewsAggregator;
})();
