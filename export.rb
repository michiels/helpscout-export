require 'helpscout'

api_key = ARGV[0]
mailbox_id = ARGV[1]

helpscout = HelpScout::Client.new(api_key)

if mailbox_id.nil?
  puts "All mailboxes"
  puts "============="

  mailboxes = helpscout.mailboxes

  mailboxes.each do |mailbox|
    puts "#{mailbox.id} - #{mailbox.name}"
  end

  print "Enter the number of the mailbox to export: "

  mailbox_id = STDIN.gets.chomp

end

mailbox = helpscout.mailbox(mailbox_id)

puts "Exporting #{mailbox.name}..."

active_conversations = helpscout.conversations(mailbox_id, "active", nil)
pending_conversations = helpscout.conversations(mailbox_id, "pending", nil)

conversations = active_conversations + pending_conversations

CSV.open("conversations_#{mailbox_id}.csv", "wb", col_sep: ';', headers: true) do |csv|
  csv << ["Number", "From", "Subject", "Created"]
  conversations.each do |conversation|
    customer = conversation.customer
    csv << [conversation.number, customer.email, conversation.subject, conversation.createdAt]
  end
end

puts "Active and pending conversations written to export_#{mailbox_id}.csv."