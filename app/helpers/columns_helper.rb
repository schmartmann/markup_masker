module ColumnsHelper

  def html_breaker(html)
      tagsRegExp = /(<\/?\w+(?:(?:\s+\w+(?:\s*=\s*(?:".*?"|'.*?'|[^'">\s]+))?)+\s*|\s*)\/?>)/
      nbspsRegExp = /(&nbsp;)/
      jsRegExp = /(function.*?})/
      templateExp = /({.*?})/
      @regex = Regexp.union(nbspsRegExp, tagsRegExp, jsRegExp, templateExp)
      unless html.nil?
        @text_arr = html.split(@regex)
      end
    end
    
end
