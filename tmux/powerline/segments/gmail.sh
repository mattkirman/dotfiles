#!/usr/bin/env zsh
# Shows the number of unread Gmail emails. Only compatible with OS X.
#
# This script makes use of the OS X Keychain. Once you've added your
# POWERLINE_GMAIL_ACCOUNT in the 'gmail_config' file add the following entry
# to your default keychain:
#
#   Keychain item name: Gmail Powerline
#   Account name: email address defined in POWERLINE_GMAIL_ACCOUNT
#   Password: your Gmail password (or application specific password)
#

source "$(dirname $0)/gmail_config"

if [ -z "${POWERLINE_GMAIL_ACCOUNT}" ]; then
  echo "Undefined POWERLINE_GMAIL_ACCOUNT"
  exit 1
fi

POWERLINE_GMAIL_PASSWORD=$(security find-generic-password -a "${POWERLINE_GMAIL_ACCOUNT}" -s "Gmail Powerline" -wg)
POWERLINE_GMAIL_CACHE_FILE="/tmp/$(echo "${POWERLINE_GMAIL_ACCOUNT}" | sed 's/@/%/g')_gmail_powerline_unread.cache"

if test `find "${POWERLINE_GMAIL_CACHE_FILE}" -mmin 1`; then
  # We've got a cache file that's not too old, so use the cached file
  mail_count=$(cat "$POWERLINE_GMAIL_CACHE_FILE")

else
  mail_count=$(curl -u "${POWERLINE_GMAIL_ACCOUNT}:${POWERLINE_GMAIL_PASSWORD}" --silent 'https://mail.google.com/mail/feed/atom' | grep 'fullcount' | sed 's/[<>]/ /g' | awk '{print $2}')

  # Cache this value for later
  $(echo "${mail_count}" > "${POWERLINE_GMAIL_CACHE_FILE}")
fi

# Only display the inbox count if there are unread emails
if [ "$mail_count" -gt 0 ]; then
  echo "✉ ${mail_count}"
fi

exit 0
