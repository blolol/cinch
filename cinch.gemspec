Gem::Specification.new do |s|
  s.name = 'cinch'
  s.version = '2.4.0'
  s.summary = 'An IRC bot framework'
  s.description = 'A simple, friendly DSL for creating IRC bots'
  s.authors = ['Dominik Honnef', 'Ross Paffett']
  s.email = 'ross@rosspaffett.com'
  s.homepage = 'https://github.com/blolol/cinch'
  s.required_ruby_version = '>= 2.7.0'
  s.files = Dir['LICENSE', 'README.md', '.yardopts', '{docs,lib,examples}/**/*']
  s.license = 'MIT'
  s.metadata = {
    # Connect Ruby gems published by .github/workflows/release.yml to GitHub repository
    # https://docs.github.com/en/packages/working-with-a-github-packages-registry/working-with-the-rubygems-registry#connecting-a-package-to-a-repository
    'github_repo' => 'ssh://github.com/blolol/cinch'
  }
end
