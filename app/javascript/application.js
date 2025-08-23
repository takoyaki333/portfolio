// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"

import "chartkick"
import "chart.js"

Chart.register({
  id: "centerText",
  beforeDraw(chart) {
    if (chart.config.options.plugins.centerText) {
      const { ctx, chartArea: { width, height } } = chart;
      const text = chart.config.options.plugins.centerText.text;

      ctx.save();
      ctx.font = "bold 14px sans-serif";
      ctx.fillStyle = "#f97316"; // オレンジ色で表示
      ctx.textAlign = "center";
      ctx.textBaseline = "middle";
      ctx.fillText(text, width / 2, height / 2);
    }
  }
});

