<?php

do_action( "{$slug}_tracker_optin", $this->get_tracking_data() );

do_action( "{$slug}_tracker_optout", $this->get_tracking_data() );

/*
* Fire after the plugin _uninstall_reason_submitted
*/
do_action( "{$slug}_uninstall_reason_submitted", $data );

apply_filters( "{$client_slug}_tracker_data", $data );
