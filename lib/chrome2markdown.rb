# TODO:
#   - Shrink functions
#   - Unit tests
#   - Refactor

require 'nokogiri'

class Chrome2Markdown
  attr_reader :page, :links, :markdown

  def initialize(bookmarks, folder_name)
    if bookmarks == nil or folder_name == nil
      throw 'Bookmarks file or folder name not specified.'
    end

    @bookmarks   = bookmarks
    @folder_name = folder_name

    begin
      @page        = search_tree(@bookmarks, @folder_name)
      @links       = find_links(@page)
      @markdown    = to_markdown(@links)
    rescue
      throw 'Could not parse bookmarks.'
    end
  end

  def search_tree(bookmarks, folder_name)
    page = Nokogiri::HTML(open(bookmarks))

    if page == nil
      throw 'Bookmarks file is invalid.'
    end

    page.xpath('//dl/dl').each do |folder|
      if folder.previous_sibling.text.strip == folder_name
        return folder.inner_html.split('<dt>')
      end
    end
  end

  def find_links(page)
    links = []

    page.each do |line|
      if line.strip!.include?('<a href')
        # Final line is very messy.
        # Nokogiri adjusts for missing </DT> tags.
        links << line.split(/\r\n/).first
      end
    end

    # Breaks if not explicitly returned.
    # Might have something to do with array shift (<<).
    links
  end

  def to_markdown(links)
    markdown = []

    links.each do |link|
      link.gsub! /\<a href=\"(.*)\" add_date(.*)\>(.*)\<\/a\>/, '[\3](\1)'

      # HTML entities
      link.gsub! /&amp;/, '&'
      link.gsub! /&lt;/, '<'
      link.gsub! /&rt;/, '>'

      markdown << link
    end

    markdown
  end
end
