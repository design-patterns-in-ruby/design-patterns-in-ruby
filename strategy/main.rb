require './Report'
require './Formatter'
require './HTMLFormatter'
require './PlainTextFormatter'

report = Report.new(HTMLFormatter.new)
report.output_report

# Change which formatter is selected at runtime
report.formatter = PlainTextFormatter.new
report.output_report
