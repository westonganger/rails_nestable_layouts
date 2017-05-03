# Rails Nestable Layouts

Dead simple nested layouts support for Rails. Does not monkey patch anything. Can nest as many layouts as desired.


## Install 

```ruby
# Gemfile

gem 'rails_nestable_layouts'
```


## Usage

### Your Controller
```ruby
# main layout, this line is not necessary. Note nested_layouts does not override the main layout.
layout :application 

# accepts the same options as before_action/before_filter
nested_layouts 'layouts/secondary_layout', 'posts/layout', except: [:index] 
```

### Main Layout
```erb
<html>
  <head></head>
  <body>
    <h1>My Main Layout</h1>
    
    <!-- this will call the first nested layout , will fallback to normal functionality if no nested layouts. -->
    <%= yield_nested %> 
  </body>
  <footer></footer>
</html>
```

### Nested Layout(s)
```erb
<h2>My Nested Layout</h2>

<%= yield_nested %> # this will call the next nested layout or the requested template if no more nested layouts.
```

<br>

# Credits

Created by Weston Ganger - @westonganger 

<a href='https://ko-fi.com/A5071NK' target='_blank'><img height='32' style='border:0px;height:32px;' src='https://az743702.vo.msecnd.net/cdn/kofi1.png?v=a' border='0' alt='Buy Me a Coffee' /></a> 
