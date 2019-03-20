<?php
/**
 * Escapes HTML for output
 *
 */
function escape1($html) {
    return htmlspecialchars($html, ENT_QUOTES | ENT_SUBSTITUTE, "UTF-8");
}

