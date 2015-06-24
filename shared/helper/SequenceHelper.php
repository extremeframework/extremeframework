<?php
/**
 * Copyright (c) 2011-2015 VIETMAI Solutions Corporation
 *
 * Released under the MIT license (http://opensource.org/licenses/MIT)
 */
/* Sample sequence format: ABzz00xxxx --> z: placeholder for A-Z; and x: placeholder for 0-9 */

class SequenceHelper {
    static function nextRefid($module) {
        if (!class_exists('AdminSequence')) {
            return;
        }

		$model = new AdminSequenceModel();

		$model->MODULE = $module;
        $model->UDID = isset($_SESSION['user'])? $_SESSION['user']->UDID : null;

		$model->find();

		if (!$model->fetch()) {
    		$model = new AdminSequenceModel();

    		$model->MODULE = $module;

            $model->find();
            $model->fetch();

            $model->CURRENT_VALUE = str_replace('x', '0', $model->SEQUENCE_FORMAT);
            $model->UDID = isset($_SESSION['user'])? $_SESSION['user']->UDID : null;
        }

        $sequence_format = $model->SEQUENCE_FORMAT;
        $current_value = $model->CURRENT_VALUE;
        $step = $model->SEQUENCE_STEP;

        if (!$step) {
            $step = 1;
        }

        $next_value = self::getNextSequenceValue($sequence_format, $current_value, $step);

        $model->CURRENT_VALUE = $next_value;
        $model->update();

        return $next_value;
    }

    static function getNextSequenceValue($sequence_format, $current_value, $step) {
        // x. Numeric increasement
        $current_extract = self::extract_mask_value($sequence_format, 'x', $current_value, $xpos);
        $new_extract = self::numeric_sequence_add($current_extract, $step, $overflow);
        $new_value = self::apply_mask_value($sequence_format, $xpos, $new_extract);

        // x. Alphabet increasement
        if ($overflow) {
            $sequence_format = $new_value;
            $step = 1;

            $current_extract = self::extract_mask_value($sequence_format, 'z', $current_value, $xpos);
            $new_extract = self::letter_sequence_add($current_extract, $step, $overflow);
            $new_value = self::apply_mask_value($sequence_format, $xpos, $new_extract);
        }

        return $new_value;
    }

    static function extract_mask_value($sequence_format, $mask_letter, $current_value, &$xpos) {
        $xpos = array();
        $current_extract = '';

        $len = strlen($sequence_format);

        for ($i = 0; $i < $len; $i++) {
            $char = $sequence_format[$i];

            if ($char == $mask_letter) {
                $xpos[] = $i;

                $current_extract .= $current_value[$i];
            }
        }

        return $current_extract;
    }

    static function apply_mask_value($sequence_format, $xpos, $new_extract) {
        $new = $sequence_format;

        foreach ($xpos as $i => $pos) {
            $new[$pos] = $new_extract[$i];
        }

        return $new;
    }

    static function letter_sequence_add($sequence, $step, &$overflow = false) {
        $len = strlen($sequence);

        $overflow = false;

        for ($i = $len - 1; $i >=0; $i--) {
            $bin = strtoupper($sequence[$i]);

            $ord = ord($bin);

            $new_ord = $ord + $step;

            if ($new_ord <= ord('Z')) {
                $overflow = false;

                $sequence[$i] = chr($new_ord);

                break;
            } else {
                $overflow = true;
                $step = 1;

                $sequence[$i] = 'A';
            }
        }

        return $sequence;
    }

    static function numeric_sequence_add($sequence, $step, &$overflow = false) {
        $len = strlen($sequence);

        $overflow = false;

        for ($i = $len - 1; $i >=0; $i--) {
            $bin = $sequence[$i];

            $new_bin = $bin + $step;

            if ($new_bin < 10) {
                $overflow = false;

                $sequence[$i] = $new_bin;

                break;
            } else {
                $overflow = true;
                $step = 1;

                $sequence[$i] = $new_bin % 10;
            }
        }

        return $sequence;
    }
}