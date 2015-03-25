require_relative 'html_report'
require_relative 'plain_text_report'

report = HTMLReport.new
report.output_report

report = PlainTextReport.new
report.output_report
