require './Report'
require './HTMLReport'
require './PlainTextReport'

report = HTMLReport.new
report.output_report

report = PlainTextReport.new
report.output_report
