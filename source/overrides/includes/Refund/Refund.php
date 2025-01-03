<?php

/**
 * Action based on refund status
 *
 * @since 3.0.0
 *
 * @param Refund $this
 */
do_action( "dokan_refund_request_{$status_name}", $this );
