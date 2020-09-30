require 'json-schema'

RSpec::Matchers.define :match_schema do |schema|
  match do |subject|
    schema_directory = "#{Dir.pwd}/spec/support/schemas"
    schema_path = "#{schema_directory}/#{schema}.yml"
    schema = YAML.load_file(schema_path)
    JSON::Validator.validate!(schema, subject, strict: true)
  end
end
