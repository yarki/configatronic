# Configatronic

Dead simple configuration facility for your Ruby scripts.

Loads a configuration from `yourscript.config.yml` file automatically.

Overrides it with `yourscript.secrets.yml` settings (optional).

## Usage

Sample:
```bash
.gitignore
Gemfile
myscript.rb
myscript.config.yml # mandatory configuration file
myscript.secrets.yml # optional secrets file (overrides the configuration file settings)
```

.gitignore
```bash
*.secrets.yml # intentionally untracked files that git should ignore
```

myscript.config.yml
```yaml
endpoint:
  url: https://example.com/rest
  credentials:
    user: ?
    pass: ?
```

myscript.secrets.yml
```yaml
endpoint:
  credentials:
    user: admin
    pass: strongpass
```

myscript.rb
```ruby
#!/usr/bin/env ruby

require 'bundler'
Bundler.require(:default)

Configatronic.endpoint.url # => "https://example.com/rest"
Configatronic.endpoint.credentials.user # => "admin"
Configatronic.endpoint.credentials.pass # => "strongpass"
```

Gemfile
```ruby
gem 'configatronic', git: 'https://github.com/yarki/configatronic.git'
```
