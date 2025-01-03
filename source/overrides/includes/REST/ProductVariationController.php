<?php

do_action( "dokan_rest_delete_{$post_type}_object", $object, $response, $request );

apply_filters( "dokan_rest_pre_insert_{$post_type}_object", $coupon, $request, $creating );
