module MarkdownHelper
  class RougeRenderer < Redcarpet::Render::HTML
    include Rouge::Plugins::Redcarpet
  end

  def markdown(text)
    Redcarpet::Markdown.new(markdown_renderer, parser_options).render(text).html_safe
  end

  private

  def parser_options
    {
      autolink: true,
      no_intra_emphasis: true,
      fenced_code_blocks: true,
      lax_html_blocks: true,
      strikethrough: true,
      superscript: true
    }
  end

  def markdown_renderer
    RougeRenderer.new
  end
end
