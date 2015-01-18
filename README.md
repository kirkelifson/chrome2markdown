Chrome2Markdown
===

My first gem. This tool accepts exported Google Chrome bookmark files, and a bookmark folder name and creates a markdown formatted array of links.

I wanted to make it for quickly updating my ['Essentials' list](https://parodybit.net/blog/2013/08/23/essentials/) and noticed that it couldbe adaptable to any folder on any system.

# Example

This gem can be installed easily by executing:

`gem install chrome2markdown`

Following this:

``` test.rb
require 'chrome2markdown'

bookmarks = Chrome2Markdown.new('bookmarks.html', 'essentials')
puts bookmarks.markdown
```

Using the sample bookmarks file (my bookmarks as of this moment):

```
$ ruby test.rb
[Hacker's Manifesto](http://phrack.org/issues/7/3.html)
[Strike three for SpaceX's Falcon 1 rocket](http://www.nbcnews.com/id/25990806/ns/technology_and_science-space/t/strike-three-spacexs-falcon-rocket/#.Uf5r65L0ByJ)

[snip]
```
