* Sending telegram bot messages


** Preparation
   $ read token ; echo "export TELEGRAM_BOT_TOKEN='$token'" >> ~/.bashrc
   $ read chat ; echo "export TELEGRAM_BOT_CHAT='$chat'" >> ~/.bashrc


** Example usage
   # Explicit, via $1
   $ send-telegram-message 'hello'
   # Implicit, from stdin
   $ ls -lah | send-telegram-message
