<?php
require_once(dirname(__FILE__).'/modifier.truncate.php');

function smarty_modifier_highlight_keyword($text, $keyword, $maxlines = 0, $truncate = 80) {
    if (!empty($text)) {
        $text = strip_tags($text);

        if (stripos($text, $keyword) !== false) {
            if (preg_match_all('/([^\.,]*\b'.preg_quote($keyword).'[^\.,]*)/is', $text, $matches)) {
                $lines = $matches[1];

                if ($maxlines && $maxlines < count($lines)) {
                    $lines = array_slice($lines, 0, $maxlines);
                }

                foreach ($lines as &$line) {
                    $line = trim($line);
                    $line = smarty_modifier_truncate($line, $truncate);

                    $line = preg_replace('/\b'.preg_quote($keyword).'/s', "<b>$keyword</b>", $line);

                    $kw2 = ucfirst($keyword);
                    $line = preg_replace('/\b'.preg_quote($kw2).'/s', "<b>$kw2</b>", $line);

                    if (strtolower($keyword) != $keyword) {
                        $kw2 = strtolower($keyword);
                        $line = preg_replace('/\b'.preg_quote($kw2).'/s', "<b>$kw2</b>", $line);
                    }
                }

                if (count($lines) > 1) {
                    $text = '...'.implode('...<br/>', $lines).'...';
                } else {
                    $text = trim(implode('', $lines));
                }
            }
        } else {
            $text = smarty_modifier_truncate($text, $truncate);
        }
    }

    return $text;
}