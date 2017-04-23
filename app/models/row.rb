class Row < ApplicationRecord
  default_scope { order("id ASC") }
  belongs_to :column

  def self.html_breaker(row)
    tagsRegExp = /(<\/?\w+(?:(?:\s+\w+(?:\s*=\s*(?:".*?"|'.*?'|[^'">\s]+))?)+\s*|\s*)\/?>)/
    nbspsRegExp = /(&nbsp;)/
    jsRegExp = /(function.*?})/
    @regex = Regexp.union(nbspsRegExp, tagsRegExp, jsRegExp)
    unless row[:raw_text].nil?
      @text_arr = row[:raw_text].split(@regex)
    end
  end

end
