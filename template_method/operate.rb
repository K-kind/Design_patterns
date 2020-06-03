require_relative 'html_report'
require_relative 'plain_report'

html_report = HtmlReport.new
html_report.print_output

plain_report = PlainReport.new
plain_report.print_output
