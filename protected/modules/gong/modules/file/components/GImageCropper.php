<?php

class GImageCropper {

    public function init() {
        
    }

    public $image;
    public $image_type;
    public $image_info;

    function load($filename) {
        $this->image_info = getimagesize($filename);
        $this->image_type = $this->image_info[2];
        if ($this->image_type == IMAGETYPE_JPEG) {
            $this->image = imagecreatefromjpeg($filename);
        } elseif ($this->image_type == IMAGETYPE_GIF) {
            $this->image = imagecreatefromgif($filename);
        } elseif ($this->image_type == IMAGETYPE_PNG) {
            $this->image = imagecreatefrompng($filename);
        }
    }

    function save($filename, $image_type=IMAGETYPE_JPEG, $compression=75, $permissions=null) {
        if ($image_type == IMAGETYPE_JPEG) {
            imagejpeg($this->image, $filename, $compression);
        } elseif ($image_type == IMAGETYPE_GIF) {
            imagegif($this->image, $filename);
        } elseif ($image_type == IMAGETYPE_PNG) {
            imagepng($this->image, $filename);
        }
        if ($permissions != null) {
            chmod($filename, $permissions);
        }
    }

    function output($image_type=IMAGETYPE_JPEG) {
        if ($image_type == IMAGETYPE_JPEG) {
            imagejpeg($this->image);
        } elseif ($image_type == IMAGETYPE_GIF) {
            imagegif($this->image);
        } elseif ($image_type == IMAGETYPE_PNG) {
            imagepng($this->image);
        }
    }
    
    function resizeToHeight($maxwidth = 0, $height) {
        $ratio = $height / $this->image_info[1];
        $width = $this->image_info[0] * $ratio;
        if ($width > $maxwidth && $maxwidth > 0) {
            $maxRatio = $maxwidth / $width;
            $height *= $maxRatio;
            $width *= $maxRatio;
        }
        $this->resize($width, $height);
        $this->image_info[0] = $width;
        $this->image_info[1] = $height;
    }

    function resizeToWidth($width, $maxheight = 0) {
        $ratio = $width / $this->image_info[0];
        $height = $this->image_info[1] * $ratio;
        if ($height > $maxheight && $maxheight > 0) {
            $maxRatio = $maxheight / $height;
            $height *= $maxRatio;
            $width *= $maxRatio;
        }
        $this->resize($width, $height);
        $this->image_info[0] = $width;
        $this->image_info[1] = $height;
    }

    function scale($scale) {
        $width = $this->image_info[0] * $scale / 100;
        $height = $this->image_info[1] * $scale / 100;
        $this->resize($width, $height);
        $this->image_info[0] = $width;
        $this->image_info[1] = $height;
    }

    function resize($width, $height) {
        $new_image = imagecreatetruecolor($width, $height);
        imagecopyresampled($new_image, $this->image, 0, 0, 0, 0, $width, $height, $this->image_info[0], $this->image_info[1]);
        $this->image = $new_image;
        
        $this->image_info[0] = $width;
        $this->image_info[1] = $height;
    }

    function interlace() {
        imageinterlace($this->image, 1);
    }
}