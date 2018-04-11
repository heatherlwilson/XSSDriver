require 'watir'

usage = <<TEXT
Usage:
ruby XSSDriver.rb /path/to/xsspayloads https://URL2Test/paramsFUZZ
XSSDriver will add payloads in place of 'FUZZ'.
TEXT

if ARGV.empty?
  puts usage
  exit
end


# Example to enable use of a Socks proxy:
# profile = Selenium::WebDriver::Firefox::Profile.new
# profile.proxy = Selenium::WebDriver::Proxy.new socks: '127.0.0.1:9001'
# browser = Watir::Browser.new :firefox, profile: profile

browser = Watir::Browser.new :firefox
xssfile = ARGV[0]
targeturl = ARGV[1]

File.open(xssfile, "r") do |f|
  f.each_line do |line|
    testurl = targeturl.sub 'FUZZ', line 
    browser.goto testurl
    sleep(2)
    if browser.alert.exists?
        puts "Popup detected! - #{testurl}"
        browser.alert.close
    end
  end
end

browser.close
