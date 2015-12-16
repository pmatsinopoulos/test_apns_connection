if ARGV.size != 1
  puts "main <path_to_pem>"
  exit 1
end
certificate = IO.read(ARGV[0])
puts certificate
ARGV.clear

print "Give me the pass phrase: "
pass_phrase = gets.chomp

apns_gateway = "apn://gateway.push.apple.com:2195"

require "houston"

houston = Houston::Connection.new(apns_gateway, certificate, pass_phrase)

houston.open

sleep(3)

houston.close



