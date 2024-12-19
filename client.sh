# Telegram bot interaction
# Preparation: $ read token ; echo "export TELEGRAM_BOT_TOKEN='$token'" >> ~/.bashrc
#              $ read chat ; echo "export TELEGRAM_BOT_CHAT='$chat'" >> ~/.bashrc

function send-telegram-message() {
    local message="$1"
    [ $# -lt 1 ] && {
        local message="$(cat)"
    }
    local result=$(curl -sd '{"chat_id": "'"$TELEGRAM_BOT_CHAT"'", "text": "'"$message"'", "parse_mode": "html"}' -H 'Content-Type: application/json' "https://api.telegram.org/bot${TELEGRAM_BOT_TOKEN}/sendMessage")
    echo "$result" | grep '"ok":true' >/dev/null || {
        echo "$result"
        return 1
    }
}


function tgm() {
    send-telegram-message "$@"
}
