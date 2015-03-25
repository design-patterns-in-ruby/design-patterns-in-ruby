require_relative 'report'
require_relative 'html_formatter'
require_relative 'plain_text_formatter'

report = Report.new(&HTML_FORMATTER)
report.output_report

# Change the formatter at runtime
report.formatter = PLAIN_TEXT_FORMATTER
report.output_report


# For added flexibility, we can use an on-the-fly code block as a formatter
report = Report.new do |context|
  puts("==== on-the-fly formatter 1 ===")
  puts("==== #{context.title} ===")
  context.text.each do |line|
    puts(line)
  end
end
report.output_report

report.formatter = lambda do |context|
  puts("==== on-the-fly formatter 2 ===")
  puts("==== #{context.title} ===")
  context.text.each do |line|
    puts(line)
  end
end
report.output_report
