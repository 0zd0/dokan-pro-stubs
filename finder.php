<?php
declare(strict_types=1);

use StubsGenerator\Finder;

return Finder::create()
    ->in('source/dokan-pro')
    ->notPath('source/vendor')
    ->notPath('source/dependencies')
    ->sortByName(true);
