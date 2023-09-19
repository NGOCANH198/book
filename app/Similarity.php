<?php

namespace App;

class Similarity
{
    // Tính điểm tương đồng dựa trên số thuộc tính của sản phẩm
    public static function hamming($productA, $productB, $returnDistance = false)
    {
        $distance = count(array_diff_assoc($productA, $productB));

        if ($returnDistance) {
            return $distance;
        }
        return (count($productA) - $distance) / count($productA);
    }

    // Tính điểm tương đồng dựa trên giá sản phẩm
    public static function euclidean($array1, $array2, $returnDistance = false)
    {
        $a   = $array1;
        $b   = $array2;
        $set = [];

        foreach ($a as $index => $value) {
            $set[] = $value - $b[$index] ?? 0;
        }

        $distance = sqrt(array_sum(array_map(function ($x) {
            return pow($x, 2);
        }, $set)));

        if ($returnDistance) {
            return $distance;
        }

        return 1 - $distance;
    }

    // Tính điểm tương đồng dựa trên danh mục sản phẩm
    public static function jaccard($string1, $string2, $separator = ',')
    {
        $a            = explode($separator, $string1);
        $b            = explode($separator, $string2);
        $intersection = array_unique(array_intersect($a, $b));
        $union        = array_unique(array_merge($a, $b));

        return count($intersection) / count($union);
    }

    public static function minMaxNorm($values, $min = null, $max = null)
    {
        $norm = [];
        $min  = $min ?? min($values);
        $max  = $max ?? max($values);

        foreach ($values as $value) {
            $numerator   = $value - $min;
            $denominator = $max - $min;
            $minMaxNorm  = $numerator / $denominator;
            $norm[]      = $minMaxNorm;
        }
        return $norm;
    }
}
