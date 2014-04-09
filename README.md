# Helpscout Conversation Export

This little Ruby script uses the `helpscout` gem to export all your HelpScout conversations into a CSV. So you can share it with your team, or send it to your customer.

## Installation

Install the helpscout gem

```
gem install helpscout
```

Find your API key on your HelpScout profile settings: *Your Profile > API Keys*.

## Usage

Run the script as follows:

```
ruby export.rb <your api> <mailbox id>
```

The mailbox id is optional. And will be asked if you do not provide it.

For example:

```
ruby export.rb 3123413d34c67d94234240c5b73edf8fdas23c73
```

or

```
ruby export.rb 3123413d34c67d94234240c5b73edf8fdas23c73 1234
```

The conversations will be exported to a file `conversations_<mailbox id>.csv`