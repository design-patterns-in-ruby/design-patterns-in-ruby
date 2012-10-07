require './Report'

require './HTMLFormatter'
require './PlainTextFormatter'

report = Report.new(HTMLFormatter.new)
report.output_report

# Change the formatter at runtime
report.formatter = PlainTextFormatter.new
report.output_report
