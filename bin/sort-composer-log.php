#!/usr/bin/php
<?php
declare(strict_types = 1);

$sep = str_repeat('=', 40);
echo "Paste composer log then press Ctrl+D:\n$sep\n";

$file = file_get_contents('php://stdin');
$lines = preg_split('/^ \- /m', $file);
$lines = array_filter($lines);
$lines = array_map(
    function (string $line): string {
        return ' - ' . trim($line);
    },
    $lines
);
sort($lines);
echo "$sep\nSorted:\n$sep\n";
echo implode("\n\n", $lines);
echo "\n$sep\n";
