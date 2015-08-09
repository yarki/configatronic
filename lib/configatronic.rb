require 'forwardable'
require 'hashie'

module Configatronic
  extend SingleForwardable

  begin
    base_file = File.join(File.dirname($PROGRAM_NAME),
                          File.basename($PROGRAM_NAME, '.*'))
    config_file = base_file + '.config.yml'
    secrets_file = base_file + '.secrets.yml'
    fail "Configuration file not found: #{File.basename(config_file)}" unless
      File.exist? config_file
    @config = Hashie::Mash.load(config_file)
    # Override .config settings with .secrets settings
    @config.merge! Hashie::Mash.load(secrets_file) if
      File.exist? secrets_file
  end

  def_delegator :@config, :to_s
  def_delegator :@config, :[]
  def_delegator :@config, :method_missing
end
