module Vcsmap
  module Provider
    class GitHub
      def search(plugin, total_pages)
        result_urls = []
        @query = plugin.search_string
        (1..total_pages).each do |page|
          result_urls += get_results_from_page(page)
        end
        result_urls
      end

      private

      def get_results_from_page(page)
        url = "https://github.com/search?p=#{page}&o=desc&q=#{@query}&s=indexed&type=Code"
        html = HTTP.get(url)
        parse_response(html.body.to_s)
      end

      def parse_response(body)
        doc = Nokogiri::HTML(body)
        hits = doc.css('p.title a:last')
        # TODO: use this when there are no file boxes.
        # hits = doc.css('.code-list-item .full-path a')
        urls = hits.map { |hit| 'https://github.com' + hit.attr('href') }
        urls.map { |url| get_raw(url) }
      end

      def get_raw(url)
        url.gsub('blob', 'raw')
      end
    end
  end
end
