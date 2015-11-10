class Article
  include ActiveModel::Model
  attr_accessor :title,
                :content,
                :permalink,
                :created_at

  def self.find_by_name
    file = find_file_by(name)
    new(extract_data_from(file))
  end

  def self.all
    article_files.reverse.map { |file| new(extract_data_from(file)) }
  end

  def id
    permalink.to_s
  end

  def content
    remove_yaml_frontmatter_from(@content)
  end

  def excerpt
    content.split('<!-- more -->').first
  end

  def has_more_text?
    content != excerpt
  end

  def created_at
    @created_at.to_date
  end

  def to_param
    @permalink.parameterize
  end



  private

  def self.article_files
    sort_by_id(Dir.glob(articles_path + '/*.md'))
  end

  def self.sort_by_id(files)
    files.sort_by { |file| File.basename(file, '.*').to_i }
  end

  def self.find_file_by(name)
    id = article_files.index { |file| file =~ /#{name}.md/ }
    article_files[id]
  end

  def self.articles_path
    Rails.root.join('app', 'views', 'blog', 'published')
  end

  def self.extract_data_from(file)
    content = {content: File.read(file),
               permalink: File.basename(file, '.*')}
    content.merge(yaml_frontmatter_metadata_from(file))
  end

  def self.yaml_frontmatter_metadata_from(file)
    YAML.load_file(file)
  end

  def remove_yaml_frontmatter_from(text)
    text.sub(/^\s*---(.*?)---\s/m, '')
  end

end
