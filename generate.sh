#!/usr/bin/env bash
#
# Generate dokan pro stubs from the source directory.
#

HEADER=$'/**\n * Generated stub declarations for dokan.\n * @see https://dokan.co\n * @see https://github.com/0zd0/dokan-pro-stubs\n */'

FILE="dokan-pro-stubs.php"
DIR=$(dirname "$0")

IGNORE_HOOKS=(
"\$this->client->slug . '_tracker_data"
"\$this->client->slug . '_tracker_optin"
"\$this->client->slug . '_tracker_optout"
"\$this->client->slug . '_uninstall_reason_submitted"
"dokan_refund_request_' . dokan_pro()->refund->get_status_name(\$this->get_status())"
"dokan_rest_delete_{\$this->post_type}_object"
"dokan_rest_prepare_{\$this->post_type}_object"
"dokan_rest_pre_insert_{\$this->post_type}_object"
"dokan_seller_badge_' . \$badge_data->event_type . '_updated"
"woocommerce_order_item_' . \$item['type'] . '_html"
"dokan_stripe_connect_add_payment_method_' . \$posted['payment_method'] . '_success"
"dokan_seller_badge_' . \$data['event_type'] . '_created"
"\$this->id . '_is_available"
"\$this->product_id . '_in_plugin_update_message"
"dokan_shipping_' . \$this->id . '_get_customer_address_string"
"dokan_distance_rate_shipping_' . \$instance_id . '_get_shipping_address_string"
"dokan_pointer_' . \$this->screen_id"
"\$this->id . '_is_available"
"woocommerce_email_subject_' . \$this->id"
"woocommerce_email_heading_' . \$this->id"
"dokan_activated_module_' . \$module_id"
"dokan_deactivated_module_' . \$module_id"
"wsa_form_top_' . \$form['id']"
"wsa_form_bottom_' . \$form['id']"
"wedevs_sms_via_' . \$active_gateway"
)
IGNORE_HOOKS_STRING=$(IFS=,; echo "${IGNORE_HOOKS[*]}")

set -e

test -f "$FILE" || touch "$FILE"
test -d "source/dokan-pro"

"$DIR/vendor/bin/generate-hooks" \
    --input=source/dokan-pro \
    --input=source/overrides \
    --output=hooks \
    --ignore-hooks="$IGNORE_HOOKS_STRING"

"$DIR/vendor/bin/generate-stubs" \
    --force \
    --finder=finder.php \
    --header="$HEADER" \
    --functions \
    --classes \
    --interfaces \
    --traits \
    --constants \
    --out="$FILE"
