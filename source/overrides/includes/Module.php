<?php

/**
 * Module activation hook
 *
 * @since 3.0.0
 *
 * @param object $module Module class instance
 */
do_action( "dokan_activated_module_{$module_id}", $container[$module_id] );

/**
 * Module deactivation hook
 *
 * @since 3.0.0
 *
 * @param object $module deactivated module class instance
 */
do_action( "dokan_deactivated_module_{$module_id}", $dokan_pro_module->{$module_id} );
