<?php

apply_filters( "{$product_id}_in_plugin_update_message", wp_kses_post( $upgrade_notice ) );
