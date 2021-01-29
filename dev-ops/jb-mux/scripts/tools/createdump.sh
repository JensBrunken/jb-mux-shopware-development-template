#!/usr/bin/env bash
#DESCRIPTION: only script - create a dump on Server

SSH_USER=$1
SSH_HOST=$2
MUX_PATH=$3
DB_HOST=$4
DB_USER=$5
DB_PASSWORD=$6
DB_NAME=$7
DUMP_FILE=$8

EXCLUDED_TABLES=(
  customer
  customer_address
  customer_group
  customer_group_translation
  customer_recovery
  customer_tag
  newsletter_recipient
  newsletter_recipient_tag
  order
  order_address
  order_customer
  order_delivery
  order_delivery_position
  order_line_item
  order_tag
  order_transaction
  user
  user_access_key
  user_recovery
  log_entry
  dead_message
)
IGNORED_TABLES=''

for IGNORED_TABLE in "${EXCLUDED_TABLES[@]}"
do :
   IGNORED_TABLES+=" --ignore-table=${DB_NAME}.${IGNORED_TABLE}"
done

ssh "${SSH_USER}"@"${SSH_HOST}" "cd ${MUX_PATH} && mysqldump --opt -h'${DB_HOST}' -u'${DB_USER}' -p'${DB_PASSWORD}' ${IGNORED_TABLES} ${DB_NAME} | gzip > '${DUMP_FILE}'"
