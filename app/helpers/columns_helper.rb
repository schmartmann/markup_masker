module ColumnsHelper

  def html_breaker(html)
      tagsRegExp = /(<\/?\w+(?:(?:\s+\w+(?:\s*=\s*(?:".*?"|'.*?'|[^'">\s]+))?)+\s*|\s*)\/?>)/
      nbspsRegExp = /(&nbsp;)/
      jsRegExp = /(function.*?})/
      @regex = Regexp.union(nbspsRegExp, tagsRegExp, jsRegExp)
      unless html.nil?
        @text_arr = html.split(@regex)
      end
    end
    
end
