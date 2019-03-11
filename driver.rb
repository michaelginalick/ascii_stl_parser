require_relative './objects/ascii_model'
require_relative './errors/disallowed_file_type'

#driver code
if ARGV.length != 1
  puts "Please provide an stl file to analyze."
  exit;
end

filename = ARGV[0]
begin
  puts "Going to analyze #{filename}"
  file = File.open(filename)
  raise DisallowedFileType unless AsciiModel::ALLOWED_FILE_EXTENSIONS.include?(File.extname(file)) 
  model = AsciiModel.new(file)
  puts model.analyze
rescue DisallowedFileType => _e
  puts "This program is only for #{AsciiModel::ALLOWED_FILE_EXTENSIONS} files"
rescue StandardError => error
  puts "A problem occured #{error.backtrace}"
ensure
  file.close
end
