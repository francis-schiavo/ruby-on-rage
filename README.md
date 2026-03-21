# RubyOnRage

An interactive Rails application that serves comprehensive tutorials for mastering the essential toolset required to become a proficient Ruby on Rails developer.

## 🎯 Main Goal

RubyOnRage provides a structured, interactive learning platform focused on the three fundamental pillars of Rails development:

- **Linux**: System administration, terminal commands, package management, and server operations
- **Git**: Version control, branching strategies, collaboration workflows, and best practices
- **Ruby**: Programming fundamentals, object-oriented concepts, testing, and advanced language features

The application transforms static documentation into an engaging, navigable learning experience with syntax-highlighted code examples and organized chapter-based progression.

## ✨ Features

- **Comprehensive Tutorials**: 50+ chapters covering Linux, Git, and Ruby fundamentals to advanced topics
- **Interactive Navigation**: Easy-to-use interface for browsing tutorials by topic and chapter
- **Syntax Highlighting**: Code examples rendered with Rouge syntax highlighting
- **Markdown Rendering**: Tutorials written in Markdown for easy maintenance and updates
- **Mobile-Friendly**: Responsive design that works on all devices
- **Search Functionality**: Quickly find relevant content across all tutorials
- **Progress Tracking**: Mark chapters as read and track learning progress
- **Modern Rails Stack**: Built with Rails 8.1.2, Hotwire, and modern web standards

## 🛠️ Tech Stack

- **Backend**: Ruby on Rails 8.1.2
- **Frontend**: Hotwire (Turbo + Stimulus), Tailwind CSS
- **Database**: SQLite (development), PostgreSQL (production)
- **Markdown Processing**: Redcarpet + Rouge for syntax highlighting
- **Asset Pipeline**: Propshaft for modern asset management
- **Background Jobs**: Solid Queue
- **Caching**: Solid Cache
- **Web Server**: Puma

## 📋 Prerequisites

- Ruby 3.4+

## 🚀 Installation

1. **Clone the repository**
   ```bash
   git clone git@github.com:francis-schiavo/ruby-on-rage.git
   cd ruby-on-rage
   ```

2. **Install Ruby with RVM (recommended)**
   ```bash
   curl -sSL https://get.rvm.io | bash
   source ~/.rvm/scripts/rvm
   rvm use 3.4.0 --install --default
   ```

3. **Install dependencies**
   ```bash
   bundle install
   ```
4. **Install foreman and start the development server**
   ```bash
   gem install foreman
   foreman start -f Procfile.dev
   ```

5. **Visit the application**
   Open http://localhost:3000 in your browser

## 🎮 Usage

### Browsing Tutorials
1. Navigate to the main page
2. Select a tutorial category (Linux, Git, or Ruby)
3. Choose a chapter from the sidebar
4. Read through the content with syntax-highlighted code examples

### Development
- **Adding Tutorials**: Create new `.md` files in `tutorials/{category}/`
- **Updating Routes**: Modify `config/routes.yml` to include new chapters
- **Styling**: Edit SCSS files in `app/assets/stylesheets/`
- **Testing**: Run `rails test` to execute the test suite

## 🤝 Contributing

We welcome contributions! Here's how you can help:

1. **Fork the repository**
2. **Create a feature branch**: `git checkout -b feature/amazing-feature`
3. **Make your changes**
4. **Add tests** for new functionality
5. **Commit your changes**: `git commit -m 'Add amazing feature'`
6. **Push to the branch**: `git push origin feature/amazing-feature`
7. **Open a Pull Request**

### Content Contributions
- Improve existing tutorials
- Add new chapters or topics
- Fix typos and improve clarity
- Translate content to other languages

### Code Contributions
- Bug fixes and performance improvements
- New features and enhancements
- UI/UX improvements
- Testing improvements

## 📝 Writing Tutorials

Tutorials are written in Markdown and stored in the `tutorials/` directory:

```
tutorials/
├── linux/
│   ├── introduction-to-linux.md
│   └── basic-terminal-commands.md
├── git/
│   ├── basics.md
│   └── advanced-commands.md
└── ruby/
    ├── introduction-to-ruby.md
    └── classes-and-objects.md
```

### Markdown Features
- Use standard Markdown syntax
- Code blocks with language specifiers for syntax highlighting
- Tables, lists, and links
- Headers for chapter organization

Example:

```markdown
# Chapter Title

## Section

``ruby
def hello_world
  puts "Hello, World!"
end
``

- Point 1
- Point 2
```

## 🧪 Testing

Run the test suite:

```bash
rails test
```

Run tests with coverage:

```bash
bundle exec simplecov
rails test
```

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🙏 Acknowledgments

- **Ruby Community**: For creating such a wonderful language and ecosystem
- **Rails Contributors**: For the amazing web framework
- **Open Source Community**: For the countless libraries and tools that make this possible

## 📞 Support

If you have questions or need help:

- Open an issue on GitHub
- Check the documentation
- Join our community discussions

---

**Happy Learning!** 🚀

Become a Rails developer with RubyOnRage - your interactive guide to mastering the Ruby on Rails ecosystem.
