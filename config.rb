###
# Page options, layouts, aliases and proxies
###

# Per-page layout changes:
#
# With no layout
page '/*.xml', layout: false
page '/*.json', layout: false
page '/*.txt', layout: false
page '/demo/*.html', layout: 'demo'

# With alternative layout
# page "/path/to/file.html", layout: :otherlayout

# Proxy pages (http://middlemanapp.com/basics/dynamic-pages/)
# proxy "/this-page-has-no-template.html", "/template-file.html", locals: {
#  which_fake_page: "Rendering a fake page with a local variable" }

activate :livereload
activate :i18n
activate :directory_indexes
activate :autoprefixer

activate :external_pipeline,
  name: :webpack,
  command: build? ? './node_modules/webpack/bin/webpack.js --bail' : './node_modules/webpack/bin/webpack.js --watch -d',
  source: ".tmp/dist",
  latency: 1

configure :build do
  # "Ignore" JS so webpack has full control.
  ignore { |path| path =~ /\/(.*)\.js$/ && $1 != 'application' }

  activate :minify_css
  activate :minify_javascript
end

###
# Helpers
###

helpers do
  def image_url(source)
    image_path(source)
  end

  def home?
    current_page.url == 'index.html' or current_page.url == '/'
  end

  def article?
    current_article
  end

  def articles?
    current_article.nil?
  end

  def page?
    current_page.url.include?('pages')
  end

  def nav_page?
    current_page.url.include?('archives.html') or current_page.url.include?('tags.html')
  end

  def lang_class(text)
    case (text).ascii_only?
    when true
      return 'is-en'
    end
    return 'is-ja'
  end

  def text_size(text)
    if (text).bytesize <= 6
      return 'is-sm'
    elsif (text).bytesize >= 7 && (text).bytesize <= 12
      return 'is-md'
    elsif (text).bytesize >= 13 && (text).bytesize <= 16
      return 'is-lg'
    else
      return 'is-xl'
    end
  end

  def is_current_home?
    case home?
    when true
      return 'is-current'
    end
    false
  end

  def is_current_page?(url)
    case current_page.path == url
    when true
      return 'is-current'
    end
    false
  end

  def is_current_group?(url)
    case current_page.url.include?(url)
    when true
      return 'is-current'
    end
  end

  def is_current_archives?
    if current_page.url.include?('articles')
      unless current_page.url.include?('tags')
        return 'is-current'
      end
    end
  end

  def glitch
    case data.site.glitch
    when true
      return 'is-glitch'
    end
  end

  def meta_title
    unless current_article.nil?
      current_article.title + ' - ' + data.site.title
    else
      data.site.title
    end
  end

  def meta_description
    if article? && current_article.data.description
      truncate(strip_tags(current_article.data.description), :length => 120).gsub(/[\r\n]/,'')
    elsif article?
      truncate(strip_tags(current_article.body), :length => 120).gsub(/[\r\n]/,'')
    elsif page? && current_page.data.description
      truncate(strip_tags(current_page.data.description), :length => 120).gsub(/[\r\n]/,'')
    elsif home?
      data.site.home_meta_descritpion
    elsif articles? && current_page.data.description
      truncate(strip_tags(current_page.data.description), :length => 120).gsub(/[\r\n]/,'')
    elsif articles?
      "articles"
    end
  end

    def meta_image
    if is_blog_article? && current_article.data.eyecatch_image_path
      current_article.data.eyecatch_image_path
    elsif is_blog_article? && current_article.data.tag == 'Information'
      'articles/information-default.png'
    elsif is_blog_article? && current_article.data.tag == 'Event'
      'articles/event-default.png'
    elsif is_blog_article? && current_article.data.tag == 'News Release'
      'articles/news-release-default.png'
    elsif is_blog_article? && current_article.data.tag == 'Recruit'
      'articles/recruit-default.png'
    elsif is_blog_article? && current_article.data.tag == 'Case'
      'articles/case-default.png'
    else
      'shared/og-image.png'
    end
  end
end

activate :syntax, line_numbers: true
set :markdown, fenced_code_blocks: true, smartypants: true, hard_wrap: true,  autolink: true, tables: true, linebreak: true, footnotes: true
set :markdown_engine, :redcarpet

activate :blog do |blog|
  blog.prefix = "articles"
  blog.permalink = ":year:month:day-:title.html"
  # blog.sources = ":year-:month-:day-:title.html"
  # blog.taglink = "tags/:tag.html"
  blog.layout = "layout"
  blog.summary_separator = /(READMORE)/
  blog.summary_length = 250
  blog.year_link = ":year.html"
  blog.month_link = ":year/:month.html"
  blog.day_link = ":year/:month/:day.html"
  blog.default_extension = ".markdown"
  blog.tag_template = "tag.html"
  blog.calendar_template = "calendar.html"

  blog.paginate = true
  blog.per_page = 10
  blog.page_link = "page/:num"
end

Time.zone = "Tokyo"

Slim::Engine.set_default_options :pretty => true

Slim::Engine.set_default_options :shortcut => {
  '#' => {:tag => 'div', :attr => 'id'},
  '.' => {:tag => 'div', :attr => 'class'},
  '&' => {:tag => 'input', :attr => 'type'}
}


page "/feed.xml", layout: false
# Reload the browser automatically whenever files change
# configure :development do
#   activate :livereload
# end

# Methods defined in the helpers block are available in templates
# helpers do
#   def some_helper
#     "Helping"
#   end
# end

# Build-specific configuration
configure :build do
  # Minify CSS on build
  activate :minify_css

  # Minify Javascript on build
  activate :minify_javascript
end

activate :deploy do |deploy|
  deploy.deploy_method = :git
  deploy.branch = 'master'
end
